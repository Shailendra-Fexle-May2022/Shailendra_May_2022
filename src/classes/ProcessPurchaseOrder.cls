/*
 *  Purpose          :    This class is used to procedssing the ordered discount.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/06/29
 *  Revision Logs    :    V_1.0 - Created - 2022/06/29
 */

public class ProcessPurchaseOrder {
     /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This constructor is used to get the instance of Customer and Employee PurchaseOrder.
    * Params        :    Void
    * Return        :    Void
    */
    public ProcessPurchaseOrder() {
        PurchaseOrder order1 =  new CustomerPurchaseOrder();
        PurchaseOrder order2 =  new EmployeePurchaseOrder();
       //System.debug('Ckeck discount :::' +order1.discount());
       //System.debug('Ckeck discount :::' +order2.discount());
       processOrder(order1);
       processOrder(order2); 
    }
      /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is taking argument for interface class and showing discount on purchase.
    * Params        :    Interface class
    * Return        :    Void
    */

    public void processOrder(PurchaseOrder order){
       System.debug('Ckeck discount :::' +order.discount()); 
    }
}