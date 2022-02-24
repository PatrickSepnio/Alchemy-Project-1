public with sharing class UpdateTriggerHelper {
    public UpdateTriggerHelper() {

    }

    public Set<String> getStatusVals()
    {
        Set<String> validVals = new Set<String>();

        validVals.add('Cancelled');
        validVals.add('Delivered');
        validVals.add('Out For Delivery');
        validVals.add('Packaging');
        validVals.add('Pending');

        return validVals;
    }

    public Boolean isValidStatusVal(List<Customer_Order__c> inRecs)
    {
        return (getStatusVals().contains(inRecs[0].Order_Status__c));
    }
}