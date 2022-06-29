/**
 *  Purpose         :    This class is used to show the different use of OperatorPrecedence.
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/06/29
 *  Revision Logs   :    V_1.0 - Created - 2022/06/29
 **/
public with sharing class OperatorPrecedence {
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This constructor is used display different OperatorPrecedence.
      * Params        :    Void
      * Return        :    Void
      **/
    public OperatorPrecedence() {
        Integer i;
        i = 5 + 3*(5+2)-2;
        System.debug(i); //24
        i = 8 + 4*6;
        System.debug(i); //32
        i = (8+5)*2;
        System.debug(i);//26
        i = 5*8/4*6;
        System.debug(i);//60
        Integer a = 12, b = 8, c = 1, d;
        d = a-++c-++b; 
        System.debug(d); //1
        System.debug(3 + 2 + 'abc');//5abc
        System.debug('abc' + 3 + 6); // abc36
        Integer x = 6;
        Integer y = 9;
        Integer z = ++y * y--;
        System.debug(z);//100
        Integer j = 7;
        Integer k = (++j * (j++ + 5));
        system.debug(k);//104
    }

}