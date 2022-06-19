public with sharing class ContactsSelector 
{
    public static final String RECORDTYPE_DEFAULT = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('Default').getRecordTypeId();

    public static List<Contact> getByAccName(String accName)
    {
        return [SELECT Id, FirstName, LastName, Account.Name, Email, Phone, Name
                FROM Contact 
                WHERE Account.Name = :accName];
    }
}