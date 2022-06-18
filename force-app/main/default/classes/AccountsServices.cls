public with sharing class AccountsServices 
{
    public static List<Database.SaveResult> insertAccounts(List<Account> lstAcc)
    {
        List<Database.SaveResult> srList = new List<Database.SaveResult>();

        if(!lstAcc.isEmpty())
            srList = Database.insert(lstAcc, false);

        return srList;
    }

    public static List<Database.SaveResult> updateAccounts(List<Account> lstAcc)
    {
        List<Database.SaveResult> srList = new List<Database.SaveResult>();

        if(!lstAcc.isEmpty())
            srList = Database.update(lstAcc, false);

        return srList;
    }
}
