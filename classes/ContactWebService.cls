@RestResource(urlMapping= '/Contact/ContactServices/*')
Global with sharing class ContactWebService {
    
    @httpGet
    global static Contact getContact(){
        String conId = RestContext.request.params.get('Id');
        return [SELECT Id, Name FROM Contact WHERE Id= :conId];
    }

    @HttpPut 
    global static Contact putContact(String conLastName,String conLeadSource){
        RestRequest contactRequest = RestContext.request;
        String ContactRequestURI = ContactRequest.requestURI;
        String conId = ContactRequestURI.substring(ContactRequestURI.lastIndexof('/')+1);
        Contact con = new Contact();
        if(String.isNotEmpty(conId)){
            con.Id = conId;
        }
        con.LastName = conLastName;
        con.LeadSource = conLeadSource;
        upsert con;
        return con;
    }

    @httpPost
    global static Contact postContact( String conName, String conLeadSource){
        Contact con = new Contact();
        con.LastName = conName;
        con.LeadSource = conLeadSource;
        insert con;
        return con;
    }

    @httpPatch
    global static Contact patchContact( String conId , String conLastname,String conLeadsource){
        Contact con = [Select Id from Contact where Id=:conId];
        con.LastName = conLastname;
        con.LeadSource = conLeadsource;
        con.Id = conId;
        update con;
        return con;
    }

    @httpDelete
    global static void deleteContact (){
        String conId = RestContext.request.params.get('Id');
        delete [SELECT Id, Name FROM Contact WHERE Id= :conId];
    }

}