@isTest 
public class UpdateCustomerOrderTest {

    final private static String mockFirstName = 'Jimothy';
    final private static String mockLastName = 'Jenkins';
    final private static String mockOrderStatus = 'Pending';
    final private static String newTestOrderStatus = 'Cancelled';

    @TestSetup
    static void makeData(){

        Integer numOrders = 5;
        List<Customer_Order__c> mockedOrders = new List<Customer_Order__c>();

        for(Integer i=1; i <= numOrders; i++)
        {
            Customer_Order__c o = new Customer_Order__c();
            o.Customer_First__c = mockFirstName;
            o.Customer_Last__c = mockLastName;
            o.Order_Status__c = mockOrderStatus;

            //System.debug('i = ' + i);
            //System.debug(o);
            //System.debug('O\'s (API)Name/(Label)Order Number is : ');
            //System.debug(o.Name);
            mockedOrders.add(o);
        }

        insert mockedOrders;
    }

    @isTest
    public static void updaterTest()
    {
        String searchName = '%' + mockFirstName + ' ' + mockLastName + '%';

        List<Customer_Order__c> jimothies = [SELECT id, Name, Customer_Full__c, Order_Status__c 
                                                FROM Customer_Order__c 
                                                WHERE Customer_Full__c
                                                    LIKE :searchName];

        for (Customer_Order__c jimmy : jimothies) 
        {
            UpdateCustomerOrder.updateOrderByNumAndFullName(jimmy.Customer_Full__c, jimmy.Name, newTestOrderStatus);
        }

        List<Customer_Order__c> updatedJimothies =  [SELECT id, Name, Customer_Full__c, Order_Status__c 
                                                    FROM Customer_Order__c 
                                                    WHERE Customer_Full__c
                                                        LIKE :searchName];

        for (Customer_Order__c newJimmy : updatedJimothies) 
        {
            System.AssertEquals(newTestOrderStatus, newJimmy.Order_Status__c);
        }
    }
}