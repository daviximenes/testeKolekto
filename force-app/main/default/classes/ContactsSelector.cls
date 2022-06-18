public with sharing class ContactsSelector 
{
    public static List<Contact> getBySetId(String accName)
    {
        return [SELECT Id, FirstName, LastName, Account.Name, Email, Phone, Name
                FROM Contact 
                WHERE Account.Name = :accName];
    }
}
