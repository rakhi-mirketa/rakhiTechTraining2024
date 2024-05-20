public class calloutCodeee {
    public static void getCaseDetails(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:ConnectedName/services/apexrest/Case/CaseServices?Id=500dM0000030xw4QAA');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        system.debug(response.getStatusCode());
        //if (response.getStatusCode() == 200) {
            //List<Object> results=(List<Object>)JSON.deserializeUntyped(response.getBody());
            //for(Object result: results){
                //Map<String,Object> caseProps=(Map<String,Object>)result;
               // system.debug('Candidate Name: '+caseProps.get('Name')+' - Phone: '+caseProps.get('Phone__c')+' - Email:' +caseProps.get('Email__c'));
            	//system.debug(response.getBody());
            //}
        //}
    }
}