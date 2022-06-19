public with sharing class LeadsServices 
{
    public static void verifyDuplicity(List<Lead> lstLeads, Map<Id, Lead> mapOldLeads)
    {
        for(Lead newLead : lstLeads)
        {
            Lead oldLead = mapOldLeads.get(newLead.Id);
            if(newLead.RecordTypeId == LeadsSelector.RECORDTYPE_PJ 
                && (oldLead.Status == 'Open - Not Contacted' && newLead.Status == 'Working - Contacted'))
            {
                List<Database.SaveResult> srList = new List<Database.SaveResult>();

                if(String.isEmpty(newLead.CompanyId__c))
                {
                    List<Account> lstAcc = new List<Account>();
                    lstAcc.add(new Account(Name = newLead.Company, RecordTypeId = AccountsSelector.RECORDTYPE_PJ));
                    srList = AccountsServices.insertAccounts(lstAcc);
                }else{
                    List<Account> lstAcc = new List<Account>();
                    lstAcc = AccountsSelector.getByCnpj(new Set<String>{newLead.CompanyId__c});
                    for(Account acc : lstAcc)
                    {
                        acc.CompanyId__c = newLead.CompanyId__c;
                        acc.Name = newLead.Company;
                    }
                    srList = AccountsServices.updateAccounts(lstAcc);
                }

                List<Contact> lstContToInsert = new List<Contact>();
                User currentUser = UsersSelector.getById(UserInfo.getUserId());

                for (Database.SaveResult sr : srList) 
                {
                    if(sr.isSuccess())
                    {
                        lstContToInsert.add(new Contact(FirstName = currentUser.FirstName,
                                                        LastName = currentUser.LastName,
                                                        Email = currentUser.Email,
                                                        Phone = currentUser.Phone,
                                                        AccountId = sr.getId()));
                    }
                }
                
                if(!lstContToInsert.isEmpty())
                    ContactsService.insertContacts(lstContToInsert);
            }
        }
    } 
}
