@isTest
public with sharing class RelatedContactsControllerTest 
{
    @TestSetup
    static void setup()
    {
        Account account = AccountTestBuilder.build().isPJ().persist();    
        Contact contact = ContactTestBuilder.build().isDefault(account.Name,'5585999999999', 'testeKolekto@test.com').withAccountId(account.Id).persist();
    }    

    @isTest
    static void test()
    {
        Account account = [SELECT Id, Name FROM Account LIMIT 1];

        Test.startTest();
            List<Contact> lstCont = RelatedContactsController.getRelatedContactsByAccName(account.Name);
            System.assert(!lstCont.isEmpty(), 'Erro classe de teste RelatedContactsControllerTest');
        Test.stopTest();

    }
}