public class candidateCallout {
    
     public void newCandidateDetail(String candidateNameA, String candidateEmailA, String candidatePhoneA){
        Candidate__c can = new Candidate__c(Name = candidateNameA, Email__c = candidateEmailA, Phone__c = candidatePhoneA );
         Insert can;
        candidateCalling(candidateNameA, candidateEmailA, candidatePhoneA);
    }
    @future(callout = true)
    private static void candidateCalling(String candidateNameA, String candidateEmailA, String candidatePhoneA){
        CalloutA c = new CalloutA();
        c.calloutasd(candidateNameA, candidateEmailA, candidatePhoneA);
    }  
    
}