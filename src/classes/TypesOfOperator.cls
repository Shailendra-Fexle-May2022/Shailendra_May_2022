/*
 *  Purpose          :    This class is used  to practice of different types of operators.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/06/26
 *  Revision Logs    :    V_1.0 - Created - 2022/06/26
 */
public with sharing class TypesOfOperator {
       /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used display the different types of operators.
    * Params        :    Void
    * Return        :    Void
    */
    public static void displayOperator() {
        integer a = 25;
        Integer result = a + 50;
        System.debug('result = a+50 ::'+result);
        result = result-10;
        System.debug('result =result-10 ::'+result);
        result = result*20; 
        System.debug('result =result*20 ::'+result);
        result=result/20;
        System.debug('result =result/20 ::'+result);
        integer b = 100; 
        b += 10;  //This is equivalent b = b + 10
        System.debug('b+=10 ::'+b);
        b *= 15; //This is equivalent b = b * 15
        System.debug('b*=15 ::'+b);
        b *= 10; //This is equivalent b = b / 10
        System.debug('b/=10 ::'+b);
        b -= 35; //This is equivalent b = b - 35
        System.debug('b-=35 ::'+b);
        integer c = 25;
        Integer d = 35;
        Integer result1 = c*d;
        System.debug('result1 =  c*d ::'+result1);
        Integer age = 20;
        if(age>=20){
            System.debug('ELIGIBLE FOR VOTING'); 
        }
        else{
            System.debug('NOT ELIGIBLE');
        }
    }
}