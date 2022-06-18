public with sharing class ContactsService {
    
    public static void insertContact(Set<Id> setAccId, String companyName)
    {
        List<Contact> lstContactToInsert = new List<Contact>();
        for(Id accId : setAccId)
        {
            Contact cont = new Contact();
            cont.AccountId = accId;
            cont.LastName = companyName;
            lstContactToInsert.add(cont);
        }

        if(!lstContactToInsert.isEmpty())
        {
            insert lstContactToInsert;
        }
    }
}
