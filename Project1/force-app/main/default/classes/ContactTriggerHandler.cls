public class ContactTriggerHandler {
    
   public static void CreateContacts(List<Contact> cons) {
       
        for (Contact con : cons) {
            if(con.Twitter_Handle__c == null) {
               con.Twitter_Handle__c = con.Twitter_Handle__c;
            }
        }
   }
}