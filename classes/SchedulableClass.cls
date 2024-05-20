public class SchedulableClass implements Schedulable {
    
    public void execute(SchedulableContext ctx) {
        List<Account> UpdateName = new List<Account>();
        for (Account obj : [SELECT Id, Name FROM Account WHERE Name = 'Nandinii11']){
            obj.Name = 'Rakhi11';
            UpdateName.add(obj);
        }
        
        if (!UpdateName.isEmpty()){
            update UpdateName;
        }
    }
}