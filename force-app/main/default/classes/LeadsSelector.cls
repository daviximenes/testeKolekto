public class LeadsSelector 
{
    public static final String RECORDTYPE_PJ = Schema.SObjectType.Lead.getRecordTypeInfosByDeveloperName().get('PJ').getRecordTypeId();
    public static final String RECORDTYPE_PF = Schema.SObjectType.Lead.getRecordTypeInfosByDeveloperName().get('PF').getRecordTypeId();
}
