/**
 *  Purpose         :    This class is used to show overloading
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/06/28
 *  Revision Logs   :    V_1.0 - Created - 2022/06/28
 **/
public with sharing class OverloadingClass {
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is diplay data.
      * Params        :    Void
      * Return        :    Void
      **/

    public static void walk() {
        System.debug('My speed is normal');
    }
     /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is taking argument and display data.
      * Params        :    Integer
      * Return        :    Void
      **/

    public static void walk(Integer i){
        System.debug('My speed is::'+ i);
    }
     /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is taking argument and display data.
      * Params        :    String
      * Return        :    Void
      **/

    public static void walk(String s){
        System.debug('My speed is just like::'+ s);
    }
     /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is taking argument and display data.
      * Params        :    Integer, String
      * Return        :    Void
      **/

    public static void walk(Integer i,String s){
        System.debug('My speed is' +i  +'and just like' + s);
    }  
}