public with sharing class UpdateCustomerOrder {
    public UpdateCustomerOrder() {

    } 
    
    @AuraEnabled
    public static void updateOrderByNumAndFullName(String custFullName, String custOrdNum, String newStatus)
    {
        try 
        {
            String searchName = custFullName;
            String searchNum = custOrdNum;

            Customer_Order__c orderToUpdate = [
                SELECT  Order_Status__c 
                FROM Customer_Order__c 
                    WHERE Customer_Full__c = :searchName
                    AND Name = :searchNum];	

            orderToUpdate.Order_Status__c = newStatus;
            update orderToUpdate;

        } 
        catch (DmlException e) 
        {
            
        }
        catch (Exception e) 
        {
            
        }
    }
}