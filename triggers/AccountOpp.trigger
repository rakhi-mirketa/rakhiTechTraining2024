trigger AccountOpp on Account (after insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            AccountOppHandler.afterInsert(Trigger.new);
        }
    }
    
}