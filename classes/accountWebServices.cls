@RestResource(urlMapping='/Account')
global with sharing class accountWebServices {
    @HttpGet
    global static List<Account> getAccountbyId(){
        /*RestRequest request=RestContext.request;
        String accountId=request.requestURI.subString(request.requestURI.lastIndexOf('/')+1);
        System.debug(request.requestURI.subString(request.requestURI.lastIndexOf('/')+1));
        try{
            Account acc=[Select Name,Phone from Account where ID=:accountId];
            return acc;
        }catch(DMLException e){
            System.debug(e.getMessage());
            return null;
        }*/
        try{
            List<Account> accList=[Select Id,Name, Phone from Account];
            System.debug(accList);
            return accList;
        }catch(DMLException e){
            System.debug(e.getMessage());
            return null;
        }  
    }
    @HttpPost
    global static Id createAccount(String name,String phone){
        try{
            Account acc=new Account(Name=name,Phone=phone);
            insert acc;
            return acc.id;
        }catch(DMLException e){
            System.debug(e.getMessage());
            return null;
        }
    }
    @HttpDelete
    global static void deleteAccount(){
        RestRequest request=RestContext.request;
        String accountId=request.requestURI.subString(request.requestURI.lastIndexOf('/')+1);
        try{
            Account acc=[Select Id from Account where ID=:accountId];
        	delete acc;  
        }catch(DMLException e){
            System.debug(e.getMessage());
        }
 
    }
    @HttpPut
    global static void upsertAccount(String id,String name,String phone){
        try{
            Account acc=new Account(Id=id,Name=name,Phone=phone);
            upsert acc;
        }catch(DMLException e){
            System.debug(e.getMessage());
        }
    }
	@HttpPatch
    global static ID updateAccount(){
        RestRequest request=RestContext.request;
        String accountId=request.requestURI.subString(request.requestURI.lastIndexOf('/')+1);
        try{
            Account acc=[Select Id from Account where Id=:accountId];
            Map<String,Object>params=(Map<String,Object>)JSON.deserializeUntyped(request.requestBody.toString());
            System.debug(params);
			for(String fieldName:params.keySet()){
                acc.put(fieldName,params.get(fieldName));
            }
            update acc;
            return acc.id;
        }catch(DMLException e){
            System.debug(e.getMessage());
            return null;
        }
    }
}