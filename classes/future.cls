public class future {
    public static void method1(){
        Account obj = new Account();
        obj.Name = 'Rakhi futureName';
        insert obj;           
        InsertUser(); 
    } 
    
    @future
    public static void InsertUser(){
        
      List<UserRole> roles = [SELECT Id FROM UserRole WHERE Name = 'CEO Subordinate'];
        Id roleId = roles.isEmpty() ? null : roles[0].Id;
        
        Profile profileObj = [SELECT Id FROM Profile WHERE Name = 'Standard Platform User'];
        
        User userObj = new User();
        userObj.LastName = 'Shekhar';
        userObj.Email = 'rakhishekhar@gmail.com';
        userObj.Username = 'rakhi@example.com'; 
        userObj.Alias = 'rs'; 
        userObj.TimeZoneSidKey = 'America/Los_Angeles'; 
        userObj.LocaleSidKey = 'en_US'; 
        userObj.EmailEncodingKey = 'ISO-8859-1'; 
        userObj.ProfileId = profileObj.Id;
        userObj.LanguageLocaleKey = 'en_US'; 
        
        if (roleId != null) {
            userObj.UserRoleId = roleId;
        }
        insert userObj;
    }
}