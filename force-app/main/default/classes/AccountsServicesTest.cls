@isTest
public with sharing class AccountsServicesTest 
{
    @TestSetup
    static void setup()
    {
        Account account = AccountTestBuilder.build().isPJ().persist();    
    }    

    @isTest
    static void testInsertAccounts()
    {
        Account account = [SELECT Id FROM Account LIMIT 1];

        Test.startTest();
            List<Database.SaveResult> srList = AccountsServices.insertAccounts(new List<Account>{account});
            System.assert(!srList.isEmpty(), 'Erro classe de teste AccountsServicesTest');
        Test.stopTest();
    }

    @isTest
    static void testUpdateAccounts()
    {
        Account account = [SELECT Id, Phone FROM Account LIMIT 1];
        account.Phone = '551111111111';

        Test.startTest();
            List<Database.SaveResult> srList = AccountsServices.updateAccounts(new List<Account>{account});
            System.assert(!srList.isEmpty(), 'Erro classe de teste AccountsServicesTest');
        Test.stopTest();
    }
}
