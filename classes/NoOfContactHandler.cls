public class NoOfContactHandler {
     public static void UpdateNoOfCont(Map<Id,Contact> newCon){
        
//         Set<Id> accId = new Set<Id>();
//         for (Id con : newCon.keySet()) {
//             accId.add(newCon.get(con).AccountId);
//         }
    
//         Map<Id, Integer> contactCount = new Map<Id, Integer>();
//         for (AggregateResult aggCon : [SELECT AccountId, COUNT(Id) NoOfCon FROM Contact WHERE AccountId IN :accId GROUP BY AccountId])
//         {
//             contactCount.put((Id)aggCon.get('AccountId'), (Integer)aggCon.get('NoOfCon'));
//         }
//         List<Account> accountsToUpdate = new List<Account>();
//         for (Id accountId : accId) {
//             Integer contactCnt = 0;
//             if (contactCount.containsKey(accountId)) {
//                 contactCnt = contactCount.get(accountId);
//             }
//             accountsToUpdate.add(new Account(Id = accountId, No_of_Contacts__c = contactCnt));
//         }
		
//         update accountsToUpdate;
     }
}