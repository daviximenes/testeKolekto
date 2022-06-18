public with sharing class ContactsService {
    
    public static void insertContact(List<Contact> lstCont)
    {
        if(!lstCont.isEmpty())
            insert lstCont;
    }
}
