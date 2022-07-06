/*
 *  Purpose          :    This class is implementing the interface class .
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/06/29
 *  Revision Logs    :    V_1.0 - Created - 2022/06/29
 */

public class CustomerPurchaseOrder implements PurchaseOrder {
     /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is defining the implemented method.
    * Params        :    Void
    * Return        :    Discount
    */

    public Double discount() {
        return .05;  // Flat 5% discount
    }
}