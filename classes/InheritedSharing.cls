public inherited sharing class InheritedSharing {
	public static void performDML() {
        //Query
        List<Contact> conList = new List<Contact>();
        List<Account> acc = [Select Name,Id from Account WHERE Name = 'Account Tech Inc' LIMIT 1];
        for (Account a: acc) {
            Contact con = new Contact();
            con.LastName = a.Name;
            conList.add(con);
        }
        insert conList;
    }
}