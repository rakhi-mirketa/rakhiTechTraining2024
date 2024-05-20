global class CalloutA {
	global void calloutasd(String candidateNameA, String candidateEmailA, String candidatePhoneA) {
       
		Http http = new Http(); 
        HttpRequest request = new HttpRequest(); 
        request.setEndpoint('callout:ConnectedName/services/apexrest/Candidate/CandidateServices'); 
        request.setMethod('POST'); 
        request.setHeader('Content-Type', 'application/json;charset=UTF-8'); 
        request.setBody('{"candidateName":"'+ candidateNameA + '","candidateEmail":"' + candidateEmailA + '","candidatePhone":"' + candidatePhoneA +'"}');
        HttpResponse response = http.send(request);
		if(response.getStatusCode() != 200) { 
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus()); 
        } 
        else { 
            System.debug(response.getBody()); 
        } 
        //return response;
        
	}
}