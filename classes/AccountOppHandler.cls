public class AccountOppHandler {
    public static void afterInsert(List<Account> newList) {
        List<Opportunity> opportunitiesToInsert = new List<Opportunity>();
        //Schema.DescribeSObjectResult opportunityDescribe = Opportunity.sObjectType.getDescribe();
	//Boolean hasCreateAccess = opportunityDescribe.isCreateable();
	//if(hasCreateAccess){
	for (Account acc : newList) {
                Opportunity newOpp = new Opportunity();
                newOpp.Name = acc.Name;
        		newOpp.AccountId = acc.Id;
                newOpp.StageName = 'Prospecting';
        		newOpp.CloseDate = date.Today();
		opportunitiesToInsert.add(newOpp);
        
        }
       Database.Insert(opportunitiesToInsert, False, AccessLevel.User_mode); 
	
	//}
	//else{
	//system.debug('No permisson to create');
	//}
	}
}