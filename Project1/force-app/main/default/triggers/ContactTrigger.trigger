trigger ContactTrigger on Contact (before insert, before update, before
    delete, after insert, after update, after delete, after undelete) {
        
    if (Trigger.isAfter && Trigger.isInsert) {

        ContactTriggerHandler.CreateNewContacts(Trigger.New);
    }
}