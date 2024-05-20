public class Assignment {
    public static void insertAccCon(){
        List<Account> accList = New List<Account>{
         new Account (
            Name = 'New Tech Inc',
            Industry = 'Technology', 
            AnnualRevenue = 2000000
            )
        };   
        
        System.debug(accList);
        Database.SaveResult[] sr1 =  Database.Insert(accList, False);

        List<Contact> conList = New List<Contact>{
         new Contact (
            FirstName = 'Emily',
            LastName = 'Johnson', 
            Email = 'emily.johnson@example.com',
            AccountId = accList[0].Id
            )
        };   
         
        System.debug(conList);
        Database.SaveResult[] sr2 = Database.Insert(conList, False);
    } 
    public static void updateRec(){
        List<Account> accList = [SELECT AnnualRevenue FROM Account WHERE Name = 'New Tech Inc' ];
        accList[0].AnnualRevenue = 3000000;
        Database.SaveResult[] sr2 = Database.Update(accList, False);

        List<Contact> conList = [SELECT Email FROM Contact WHERE Name = 'Emily Johnson'];
        conList[0].Email = 'emily.johnson.updated@example.com';
        Database.SaveResult[] sr3 = Database.Update(conList, False);

        }

    public static void upsertAcc(){
        List<Account> accList = [SELECT Country__c FROM Account];
        for (Account a : accList){
            a.Country__c = 'India';
        }
         Account b = new Account (
            Name = 'Account Tech Inc',
            Industry = 'Technology', 
            AnnualRevenue = 1000000,
            Country__c = 'India'
            );
            accList.add(b);

        Database.UpsertResult[] sr4 = Database.Upsert(accList, False);
        }

    public static void delCon(){
        List<Contact> conList = [SELECT Name FROM Contact WHERE FirstName = 'Emily'];
        
        Database.DeleteResult[] sr5 = Database.Delete(conList, False);
        }

    public static void unDelCon(){
        List<Contact> conList = [SELECT Name FROM Contact WHERE FirstName = 'Emily' ALL ROWS];
        
        Database.UnDeleteResult[] sr6 = Database.UnDelete(conList, False);
        }

    public static void queryAcc(){
        String queryAccn = 'SELECT Id, Name FROM Account WHERE Name = \'New Tech Inc\'';
        List<Account> accList = Database.query(queryAccn);
        System.Debug(AccList);
    }
    public static void bindExecute(){
        Map<String, Object> accBind = new Map<String, Object>{ 'accName' => 'GenePoint'};
            List<Account> accccList = Database.queryWithBinds('SELECT Id FROM Account where Name = :accName', accBind, AccessLevel.USER_MODE);

        System.debug(accccList.size());
    }
    

}