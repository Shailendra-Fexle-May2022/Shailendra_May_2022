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
    public static void passByValue1() {
        Integer i = 10;
        Integer m =  callValue1(i);
        System.debug('The value of Integer :'+m ); // 80
    }

   /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to return the result to the previous method. 
    * Params        :    passing integer
    * Return        :    Integer type
    */
    
    public static integer callValue1(Integer j){
        integer k = 70;
        return (j+k);
    }
     /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to pass the String value to another method
    * Params        :    Void
    * Return        :    Void
    */
    public static void passByValue2() {
        String name = 'Jorge';
        String s1 = 'Shaun'+' '+callValue2(name);
        System.debug('The name of student :'+s1); // Shaun Jorge
    }

   /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to return the result to the previous method. 
    * Params        :    passing String
    * Return        :    String type
    */
    
    public static String callValue2(String s){
        return s;
    }
     /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to pass the String value to another method
    * Params        :    Void
    * Return        :    Void
    */
    public static void passByValue3() {
        Date today_Date = Date.today();
        Date new_Date = callValue3(today_Date);
        System.debug('The date of examination:' + new_Date); // The date of examination:2022-07-07 00:00:00
    }
   /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to return the result to the previous method. 
    * Params        :    passing Date
    * Return        :    Date type
    */
    
    public static Date callValue3(Date d){
        System.debug('The today date:' + d);//The today date:2022-07-05 00:00:00
        Date dt = d.addDays(2);
        return dt;
    }
     /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to pass the String value to another method
    * Params        :    Void
    * Return        :    Void
    */
    public static void passByValue4() {
        Double double_value = 49.14159d;
        Double updatedDouble_value = callValue4(double_value);
        System.debug('The updated average marks in Mathematics subject::' + updatedDouble_value); //The updated average marks in Mathematics subject::54.37702
    }
   /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to return the result to the previous method. 
    * Params        :    passing double
    * Return        :    Double type
    */
    
    public static Double callValue4(Double d){
        System.debug('The average marks in Mathematics subject::' + d);//The average marks in Mathematics subject::49.14159
        Double uodate_DoubleValue = 5.23543d;
        return (d+uodate_DoubleValue);
    }

}