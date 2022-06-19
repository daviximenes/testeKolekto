@isTest
public with sharing class LeadsServiceTest 
{
    @TestSetup
    static void setup()
    {
        Account account = AccountTestBuilder.build().isPJ().persist(); 
    }  

    @isTest
    static void testLeadsPJ()
    {
        Lead lead = LeadTestBuilder.build().isPJ().persist();   
        lead.Status = 'Working - Contacted';
        update lead;

        List<Account> lstAccount = [SELECT Id FROM Account WHERE CompanyId__c =: lead.CompanyId__c LIMIT 1];
        System.assert(!lstAccount.isEmpty(),'Erro classe de teste LeadsServiceTest');
    }  

    @isTest
    static void testLeadsPF()
    {
        Lead leadPF = LeadTestBuilder.build().isPF().persist();    
        leadPF.Status = 'Working - Contacted';
        update leadPF;

        List<Account> lstAccount = [SELECT Id FROM Account WHERE CompanyId__c =: leadPF.CompanyId__c LIMIT 1];

        System.assert(!lstAccount.isEmpty(), 'Erro classe de teste LeadsServiceTest');
    } 
}
