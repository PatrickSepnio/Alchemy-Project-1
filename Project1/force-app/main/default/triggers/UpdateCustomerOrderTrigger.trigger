trigger UpdateCustomerOrderTrigger on Customer_Order__c (before update, after update) {

    UpdateTriggerHelper trigHelp = new UpdateTriggerHelper();

    if (trigger.isBefore)
    {
        if(!trigHelp.isValidStatusVal(trigger.new))
        {
            trigger.new[0].Order_Status__c.addError('Invalid Order Status');
        }
        
    }

    if(trigger.isAfter)
    {
        //System.debug('After update: ');
    }
}