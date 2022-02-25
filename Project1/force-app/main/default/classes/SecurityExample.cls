public with sharing class SecurityExample {
    public SecurityExample() {
        //ensure we are checking the user context of this method and enforce the object at field-level security
        //System.query exception if it fails
        //mitigate with try/catch block 
        List<Contact> cons1 = [SELECT Id FROM Contact WITH SECURITY_ENFORCED];

        List<SObject> cons = [SELECT iD, Name FROM Contact];
        //strip and access
        System.debug(cons);
        SObjectAccessDecision decision = Security.stripInaccessible(AccessType.UPDATABLE, cons);
        System.debug(decision.getRecords());

        //most precise way to check security within the context of a user
        Account a = new Account(Name='Example');
        if(Schema.SObjectType.Account.isCreateable()) {
            insert a;
        }
    }
}