@isTest
public with sharing class ContactTriggerTest {
    
     @isTest static void TestCreateContactInBulk() {
        // Test Setup data
        // Create 200 new Contacts
        List<Contact> newContacts = new List<Contact>();
    	for(integer i = 0; i < 200; i++) {
        	Contact con = new Contact(LastName='Test Contact' + i);
        	newContacts.add(con);
    }
         
        // Perform Test
        Test.startTest();
        insert newContacts;                               
        Test.stopTest();
        // Verify that 200 new Contact were inserted 
        List<Contact> verifyCons = [SELECT Id FROM Contact];
        System.assertEquals(200, verifyCons.size()); 
        //Also verify flow added default Twitter Handle value       
 	    System.assertEquals('salesforce2022', verifyCons[0].Twitter_Handle__c);        
     }
}