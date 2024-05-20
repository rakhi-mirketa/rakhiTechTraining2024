public class BatchClass implements Database.Batchable<sObject>{ 
    Public Integer Index = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, Name FROM Account WHERE Name LIKE '%Rakhi%']);
    }
    public void execute(Database.BatchableContext bc, List<Account> accList) {
        
        System.debug(Index++);

        List<Account> accountsToUpdate = new List<Account>();
        for(Account acc : accList) {
            acc.Description = 'New Description';
            accountsToUpdate.add(acc);
        }
        update accountsToUpdate;
    }
    public void finish(Database.BatchableContext bc) {
        System.debug('Finish Method');
    }
}