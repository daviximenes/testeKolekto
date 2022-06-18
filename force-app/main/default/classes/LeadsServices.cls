public with sharing class LeadsServices 
{
    public static void verifyDuplicatedLead(List<Lead> lstLeads, Map<Id, Lead> mapOldLeads)
    {
        for(Lead newLead : lstLeads)
        {
            Lead oldLead = mapOldLeads.get(newLead.Id);
            if(newLead.RecordTypeId == LeadsSelector.RECORDTYPE_PJ 
                && (oldLead.Status == 'Open - Not Contacted' && newLead.Status == 'Working - Contacted'))
            {
                List<Database.SaveResult> srList = new List<Database.SaveResult>();

                srList = String.isEmpty(newLead.CompanyId__c) 
                ? AccountsServices.insertAccountWithLeadInfo(newLead.Company)
                : AccountsServices.updateAccountWithExistingLeadCnpj(newLead.Company, newLead.CompanyId__c);

                Set<Id> setAccIdToRelated = new Set<Id>();
                for (Database.SaveResult sr : srList) 
                {
                    setAccIdToRelated.add(sr.getId());
                }

                //Get User Info for Contact name,email,phone
                ContactsService.insertContact(setAccIdToRelated, newLead.Company);
            }
        }
    } 
}
