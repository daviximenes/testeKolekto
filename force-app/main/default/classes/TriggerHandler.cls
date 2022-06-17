public abstract class TriggerHandler 
{

    protected List<SObject> newList;
    protected List<SObject> oldList;
    protected Map<Id, SObject> newMap;
    protected Map<Id, SObject> oldMap;

    public TriggerHandler()
    {
        this.newList = Trigger.new;
        this.newList = Trigger.old;
        this.newMap = Trigger.newMap;
        this.oldMap = Trigger.oldMap;
    }

    public static void runTrigger(TriggerHandler handlerClass)
    {
        if(Trigger.isBefore)
        {
            if(Trigger.isInsert)
                handlerClass.onBeforeInsert();
            else if(Trigger.isUpdate)
                handlerClass.onBeforeUpdate();
            else if(Trigger.isDelete)
                handlerClass.onBeforeDelete();
        }else{
            if(Trigger.isInsert)
                handlerClass.onAfterInsert();
            else if(Trigger.isUpdate)
                handlerClass.onAfterUpdate();
            else if(Trigger.isDelete)
                handlerClass.onAfterDelete();
            else if(Trigger.isUndelete)
                handlerClass.onAfterUndelete();
        }
    }

    protected abstract void onBeforeInsert();
    protected abstract void onBeforeUpdate();
    protected abstract void onBeforeDelete();
    protected abstract void onAfterInsert();
    protected abstract void onAfterUpdate();
    protected abstract void onAfterDelete();
    protected abstract void onAfterUndelete();
}