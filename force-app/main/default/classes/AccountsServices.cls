public with sharing class AccountsServices 
{
    public static List<Database.SaveResult> insertAccountWithLeadInfo(String leadCompanyName)
    {
        List<Account> lstAccToInsert = new List<Account>();
        List<Database.SaveResult> srList = new List<Database.SaveResult>();

        lstAccToInsert.add(new Account(Name = leadCompanyName));

        if(!lstAccToInsert.isEmpty())
        {
            srList = Database.insert(lstAccToInsert, false);
        }

        return srList;
    }

    public static List<Database.SaveResult> updateAccountWithExistingLeadCnpj(String leadCompanyName, String cnpj)
    {
        List<Account> lstAccToUpdate = new List<Account>();
        List<Database.SaveResult> srList = new List<Database.SaveResult>();

        lstAccToUpdate = AccountsSelector.getByCnpj(new Set<String>{cnpj});
        for(Account acc : lstAccToUpdate)
        {
            acc.CompanyId__c = cnpj;
            acc.Name = leadCompanyName;
        }

        if(!lstAccToUpdate.isEmpty())
        {
            srList = Database.update(lstAccToUpdate, false);
        }

        return srList;
    }
}
