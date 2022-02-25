@isTest
public class AccountsActions_Test {
	
    @isTest
    public static void single() {
        
        Account acc = new Account(Name='Company Generic', Rating='Hot');
        Contact con = new Contact(FirstName='Common', LastName='Kobold');
        
        insert acc;
        insert con;
        
        List<Id> fixedSearchResults = new List<Id>();
        fixedSearchResults.add(acc.Id);
        fixedSearchResults.add(con.Id);
        
        Test.setFixedSearchResults(fixedSearchResults);
        
        List<List<sObject>> results = AccountsActions.mySoslMethod();
        
        List<Account> accounts = results[0];
        
        system.debug(accounts[0].Name);
        
        System.assertEquals(accounts[0].Name, 'Generic');      
    }
    
}