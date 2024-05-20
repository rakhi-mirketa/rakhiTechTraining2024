public class Asynchronous implements Queueable {
    public void execute(QueueableContext context) {
        List<Account> UpdateName = new List<Account>();
         for (Account obj : [SELECT Id, Name FROM Account WHERE Name =: 'Nandinii']){
            obj.Name = 'Rakhi';
            UpdateName.add(obj);
        }
        if (!UpdateName.isEmpty()){
            update UpdateName;
        }
    }
}