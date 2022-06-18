@isTest
public class AccountTestBuilder implements ITestBuilder
{
    private Account record;

    public AccountTestBuilder()
    {
        record = new Account();
    }

    public static AccountTestBuilder build()
    {
        return new AccountTestBuilder();
    }

    public Account persist()
    {
        insert record;
        return record;
    }

    public AccountTestBuilder isPJ()
    {
        this.isPJ('74611073000156');
        return this;
    }

    public AccountTestBuilder isPJ(String cnpj)
    {
        record.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('PJ').getRecordTypeId();
        record.Name = 'Empresa Teste';
        record.CompanyId__c = cnpj;
        record.Phone = '5585999999999';
        return this;
    }
}
