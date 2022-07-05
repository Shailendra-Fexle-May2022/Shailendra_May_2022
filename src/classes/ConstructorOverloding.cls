/*
 *  Purpose          :    This class shows how a argument is passed through construction.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/06/27
 *  Revision Logs    :    V_1.0 - Created - 2022/06/27
 */
public with sharing class ConstructorOverloding {
    Integer a, b, C;
    Integer sum;
    Integer multi;
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This construction is used to passing the two argument.
    * Params        :    Void
    * Return        :    Void
    */

    public ConstructorOverloding(Integer x,Integer y) {
        a=x;
        b=y;
        Sum = a+b;
        System.debug('Addition of two number is::' + sum );
    }
      /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This construction is used to passing the three argument.
    * Params        :    Void
    * Return        :    Void
    */

    public ConstructorOverloding(Integer x,Integer y,Integer z) {
        a= x;
        b= y;
        c= z;
        multi = a*b*c;
        System.debug('Multiplication of three number is::' + multi ); 
    }
}