trigger devTrigger on Developer__c (before insert) { 
    if(Trigger.isBefore){
        if(Trigger.isInsert) {
            devTriggerHandler.beforeInsert(Trigger.new);
        }
    }
}