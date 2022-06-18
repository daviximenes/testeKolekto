public class LeadsSelector 
{
    public static final String RECORDTYPE_PJ = Schema.SObjectType.Lead.getRecordTypeInfosByDeveloperName().get('PJ').getRecordTypeId();
    public static final String RECORDTYPE_PF = Schema.SObjectType.Lead.getRecordTypeInfosByDeveloperName().get('PF').getRecordTypeId();

    public static List<Lead> getBySetId(Set<Id> setLeadId)
    {
        return [SELECT Id, OwnerId, Status, RecordTypeId, CompanyId__c, Company
                FROM Lead 
                WHERE Id IN :setLeadId];
    }
}
