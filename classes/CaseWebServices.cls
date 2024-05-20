@RestResource(urlMapping= '/Case/CaseServices/*')
Global with sharing class CaseWebServices {
    
    @httpGet
    global static Case getCase(){
        String caseId = RestContext.request.params.get('Id');
        return [SELECT Id, Status FROM Case WHERE Id= :caseId];
    }

    @httpPut
    global static Case putCase( String caseStatus, String caseType){
        Case casee = new Case();
        RestRequest caseRequest = RestContext.request;
        String caseRequestURI = caseRequest.requestURI;
        String caseId = caseRequestURI.substring(caseRequestURI.lastIndexof('/')+1);
        if(String.isNotEmpty(caseId)){
            casee.Id = caseId;
        }

        casee.Status = caseStatus;
        casee.Type = caseType;
        upsert casee;
        return casee;
    }

    @httpPost
    global static Case postCase( String caseStatus, String caseType){
        Case casee = new Case();
        casee.Status = caseStatus;
        casee.Type = caseType;
        insert casee;
        return casee;
    }

    @httpPatch
    global static Case patchCase( String caseId , String caseStatus, String caseType){
        Case casee = [Select Id from Case where Id=:caseId];
        casee.Status = caseStatus;
        casee.Type = caseType;
        casee.Id = caseId;
        update casee;
        return casee;
    }

    @httpDelete
    global static void deleteCase (){
        String caseId = RestContext.request.params.get('Id');
        delete [SELECT Id, Status FROM Case WHERE Id= :caseId];
    }

}