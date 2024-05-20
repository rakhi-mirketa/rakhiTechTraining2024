public class devTriggerHandler{
    public static void beforeInsert(List<Developer__c> devList){
        Map<String, Schema.SObjectType> devMap = Schema.getGlobalDescribe();
        System.debug(devMap.get('Developer__c'));
        List<String> devListttt = new List<String>();
        devListttt.add('Developer__c');

        List<Schema.DescribeSObjectResult> developerObjResult = Schema.describeSObjects(devListttt);
        System.debug(developerObjResult[0].fields.getMap());
       
        Map<String, Schema.SObjectField> fieldMap = developerObjResult[0].fields.getMap();
        if (fieldMap.containsKey('Organisation__c')){
            for (Developer__c dev : devList) {
                dev.Organisation__c = 'Mirketa'; 	
            	}  
        }
    }
}