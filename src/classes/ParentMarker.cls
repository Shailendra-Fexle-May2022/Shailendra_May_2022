/**
 *  Purpose         :    This class is used to show overriding
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/07/5
 *  Revision Logs   :    V_1.0 - Created - 2022/07/5
 **/
public virtual class ParentMarker {
    /**
     * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to debug the statement.
    * Params        :    Void
    * Return        :    Discount
    **/
    public virtual void write() {
        System.debug('Writing some text.');//|Writing some text.
    }
    /**
     * Created By    :    Shailendra Sharma
    * Purpose       :    This method is rturing discount.
    * Params        :    Void
    * Return        :    Discount
    **/

    public virtual Double discount() {
        return .05;
    }
}