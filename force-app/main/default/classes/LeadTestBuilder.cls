@isTest
public class LeadTestBuilder implements ITestBuilder
{ 
    private Lead record;

    public LeadTestBuilder()
    {
        record = new Lead();
    }

    public static LeadTestBuilder build()
    {
        return new LeadTestBuilder();
    }

    public Lead persist()
    {
        insert record;
        return record;
    }

    public LeadTestBuilder isPF()
    {
        this.isPF('de Aquino','Teste Empresa');
        return this;
    }

    public LeadTestBuilder isPF(String lName, String company)
    {
        record.RecordTypeId = LeadsSelector.RECORDTYPE_PJ;
        record.LastName = lName;
        record.Company = company;
        record.Status = 'Open - Not Contacted';
        return this;
    }

    public LeadTestBuilder isPJ()
    {
        this.isPJ('de Aquino','Teste Empresa','74611073000156');
        return this;
    }

    public LeadTestBuilder isPJ(String lName, String company, String cnpj)
    {
        record.RecordTypeId = LeadsSelector.RECORDTYPE_PJ;
        record.LastName = lName;
        record.Company = company;
        record.Status = 'Open - Not Contacted';
        record.CompanyId__c = cnpj;
        return this;
    }

}
