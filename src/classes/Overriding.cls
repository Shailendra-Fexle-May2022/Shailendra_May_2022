/**
 *  Purpose         :    This class is used to show overriding
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/06/28
 *  Revision Logs   :    V_1.0 - Created - 2022/06/28
 **/
public virtual class Overriding {
    /**
    *  Purpose         :    Inner Class Parent
    *  Created By      :    Shailendra Sharma
    *  Created Date    :    2022/06/28
    *  Revision Logs   :    V_1.0 - Created - 2022/06/28
    **/
    public virtual class Parent{
        Integer s ;
        /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is taking argument and display data.
      * Params        :    Void
      * Return        :    Void
      **/
        public virtual void getValues(Integer x, Integer y) {
            s = x + y;
            System.debug('Sum of two number is::'+s);
        }
    }
    /**
    *  Purpose         :    Inner Class Child
    *  Created By      :    Shailendra Sharma
    *  Created Date    :    2022/06/28
    *  Revision Logs   :    V_1.0 - Created - 2022/06/28
    **/
    public virtual class Child extends Parent{
       Integer s;
        /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is taking argument and display data.
      * Params        :    Void
      * Return        :    Void
      **/
       public override void getValues(Integer x, Integer y){
            s = x * y;
            System.debug(s);
       }
    }
}