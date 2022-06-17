public with sharing class Leads extends TriggerHandler
{
    private List<Lead> lstNewLeads;
    private List<Lead> lstOldLeads;
    private Map<Id, Lead> mapNewLeads;
    private Map<Id, Lead> mapOldLeads;

    public Leads()
    {
        super();
        this.lstNewLeads = super.newList;
        this.lstOldLeads = super.oldList;
        this.mapNewLeads = (Map<Id, Lead>) super.newMap;
        this.mapOldLeads = (Map<Id, Lead>) super.oldMap;
    }   

    override protected void onBeforeInsert()
    {
    }

    override protected void onBeforeUpdate()
    {
    }

    override protected void onBeforeDelete()
    {
    }

    override protected void onAfterInsert()
    {
    }

    override protected void onAfterUpdate()
    {
    }

    override protected void onAfterDelete()
    {
    }

    override protected void onAfterUndelete()
    {
    }
}
