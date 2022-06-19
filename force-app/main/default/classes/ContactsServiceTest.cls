@isTest
public with sharing class ContactsServiceTest 
{
    @TestSetup
    static void setup()
    {
        Contact contact = ContactTestBuilder.build().isDefault().persist();    
    }    

    @isTest
    static void testInsertContacts()
    {
        Contact contact = [SELECT Id FROM Contact LIMIT 1];

        Test.startTest();
            List<Database.SaveResult> srList = ContactsService.insertContacts(new List<Contact>{contact});
            System.assert(!srList.isEmpty(), 'Erro classe de teste ContactsServiceTest');
        Test.stopTest();
    }
}
