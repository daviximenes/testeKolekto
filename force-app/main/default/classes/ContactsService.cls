public with sharing class ContactsService {
    
    public static List<Database.SaveResult> insertContacts(List<Contact> lstCont)
    {
        List<Database.SaveResult> srList = new List<Database.SaveResult>();

        if(!lstCont.isEmpty())
            srList = Database.insert(lstCont, false);

        return srList;
    }
}
