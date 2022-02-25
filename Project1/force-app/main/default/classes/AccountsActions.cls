public class AccountsActions {
    
    public static List<List<sObject>> mySoslMethod() {
        
        List<List<sObject>> mySoslResult = [FIND 'com' RETURNING Account(Name, Rating), Contact(FirstName)];
        List<Account> accounts = mySoslResult[0];
        List<Contact> contacts = mySoslResult[1];        
        return mySoslResult;
    }

}