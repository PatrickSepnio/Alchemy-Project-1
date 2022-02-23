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
        // Verify that 200 new Contact were inserted and flow added default Twitter Handle value
        List<Contact> verifyCons = [SELECT Twitter_Handle__c FROM Contact];
 	    System.assertEquals('salesforceorg', verifyCons[0].Twitter_Handle__c);        
     }
}