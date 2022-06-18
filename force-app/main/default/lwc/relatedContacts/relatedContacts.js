import { LightningElement, wire, api, track } from 'lwc';
import {getRecord} from 'lightning/uiRecordApi';
import LEAD_COMPANY from '@salesforce/schema/Lead.Company';
import getRelatedContactsByAccName from '@salesforce/apex/RelatedContactsController.getRelatedContactsByAccName'
const COLS = [
    {fieldName: 'NameUrl', type:'url', typeAttributes:{label: {fieldName: 'Name', target: '_blank'}}, label: 'Name'},
    {fieldName: 'Email', label: 'Email'},
    {fieldName: 'Phone', label: 'Phone'}
];

export default class RelatedContacts extends LightningElement {
    @api recordId;
    @track isContact = false;
    @track showGrid = false;
    
    gridColumns = COLS;
    isLoading = true;
    gridData = [];

    @wire(getRecord, {
        recordId: '$recordId',
        fields: [LEAD_COMPANY]
    }) wireUser ({
        error,
        data
    }) {
        if(error) {
            console.log('@@error ', error);
            this.error = error;
        }else if(data){
            var company = data.fields.Company.value;
            if(company == null)
            {
                this.isContact = true;
            }else{
                this.showGrid = true
                this.getRelatedContacts(company);
            }
        }
    }

    getRelatedContacts(company){
        getRelatedContactsByAccName({ accName : company})
        .then(result => {
            this.gridData = result.map((contact) => ({
                ...contact,
                NameUrl: `/${contact.Id}`,
                Email: contact.Email,
                Phone: contact.Phone,
            }));
            this.isLoading = false;
        })
        .catch(error => {
            console.error('ERROR AO CARREGAR CONTATOS -> ', error);
        })
    }
}