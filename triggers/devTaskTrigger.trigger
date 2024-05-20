trigger devTaskTrigger on Developer__c (before insert, after update) {
    if(Trigger.isAfter){
        if(Trigger.isInsert) {
            devTriggerHandler.beforeInsert(Trigger.new);
        }
    }
}
    
