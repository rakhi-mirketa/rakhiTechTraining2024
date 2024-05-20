trigger LeadTrigger on New__e (after insert) {
    List<New__e> npeList = new List<New__e>();
    System.debug(Trigger.new);

    List<Account> accList = new List<Account>();
    for (New__e npe : trigger.new){
        Account acc = new Account(
        Name = 'Rakhiiiiii',
        Phone = '8789539769');    
        accList.add(acc);
    }
    insert accList;
   

    System.debug('--acclist--' + accList);
    //List<Database.SaveResult> results = EventBus.publish(npeList);
    
}