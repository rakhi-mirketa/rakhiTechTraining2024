trigger AddPersonDetail on Account (after insert) {
    List<PersonDetail__c> addDetails = new List<PersonDetail__c>();
    for (Account acc: Trigger.new)
   {
        PersonDetail__c person = new PersonDetail__c();
        person.Name = acc.Name ;
        person.Person_Phone__c = acc.Phone ;
        person.Description__c = acc.Description ;
        person.Person_Employee_ID__c = acc.Id   ;
        person.Parent_Account__c = acc.ParentId  ;   
        addDetails.add(person);
    }
  insert addDetails;
}