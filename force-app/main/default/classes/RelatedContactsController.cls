public with sharing class RelatedContactsController 
{
    @AuraEnabled
    public static List<Contact> getRelatedContactsByAccName(String accName) 
    {
        return ContactsSelector.getBySetId(accName);
    }
}
