trigger UpdateDescription on PersonDetail__c (before update) {
 List<PersonDetail__c> updated = new List<PersonDetail__c>();
    for( Id i: Trigger.oldMap.keySet())
    {
      PersonDetail__c person = Trigger.newMap.get(i);
      if( Trigger.oldMap.get(i).Person_Email__c != Trigger.newMap.get(i).Person_Email__c )
     {
       person.Description__c = 'Email Id has been updated';   
     }
      if( Trigger.oldMap.get(i).Person_Phone__c != Trigger.newMap.get(i).Person_Phone__c )
     {
       person.Description__c  = 'Phone Number has been updated'; 
     }
    }
}