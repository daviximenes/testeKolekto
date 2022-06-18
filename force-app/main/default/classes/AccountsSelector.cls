public class AccountsSelector 
{
    public static final String RECORDTYPE_PJ = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('PJ').getRecordTypeId();

    public static List<Account> getByCnpj(Set<String> setAccCnpj)
    {
        return [SELECT Id,CompanyId__c
                FROM Account 
                WHERE CompanyId__c IN :setAccCnpj];
    }
}
