public class DynamicBinding {
    public static void Execute(){
        Map<String, Object> accBind = new Map<String, Object>{ 'accName' => 'GenePoint'};
            List<Account> accList = Database.queryWithBinds('SELECT Id FROM Account where Name = :accName', accBind, AccessLevel.USER_MODE);

        System.debug(accList.size());
    }

}