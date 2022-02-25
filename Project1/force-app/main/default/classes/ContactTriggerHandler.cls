public with sharing class ContactTriggerHandler {

   public static void CreateNewContacts(List<Contact> cons) {

       List<Contact> conList = new List<Contact>();
       for (Contact c : cons) {
           Contact con = new Contact();
           con.LastName = c.LastName + ' Contact';
           conList.add(con);
       }
       if (conList.size() > 0) {
           insert conList;
       }
   }
}