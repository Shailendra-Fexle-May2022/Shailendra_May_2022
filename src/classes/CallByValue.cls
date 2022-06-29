/*
 *  Purpose          :    This class shows how a primitive argument of type Integer is passed by value into another method.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/06/26
 *  Revision Logs    :    V_1.0 - Created - 2022/06/26
 */

public with sharing class CallByValue {
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to pass the integer value to another method
    * Params        :    Void
    * Return        :    Void
    */
    public static void passByValue() {
        Integer i = 10;
      integer m =  callValue(i);
        System.debug('The value of Integer :'+m );
    }

   /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to return the result to the previous method. 
    * Params        :    passing integer
    * Return        :    Integer type
    */
    
    public static integer callValue(Integer j){
        integer k =70;
        return j+k;
    }
}