trigger NoOfContact on Contact (before insert, before delete ) {
     if (Trigger.isBefore){    
         if (Trigger.isInsert) {
             NoOfContactHandler.UpdateNoOfCont(Trigger.newMap);
         } 
         else if(Trigger.isDelete) {
             NoOfContactHandler.UpdateNoOfCont(Trigger.oldMap);
         } 
         // else if (Trigger.isUndelete) {
         //     NoOfContactHandler.UpdateNoOfCont(Trigger.newMap);
         //}
     }
}