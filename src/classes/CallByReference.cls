/*
 *  Purpose          :    This class shows how a List argument is passed by reference into the method.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/06/26
 *  Revision Logs    :    V_1.0 - Created - 2022/06/26
 */

public with sharing class CallByReference {
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to pass the List argument to another method
    * Params        :    List<String>
    * Return        :    Void
    */

    public static void passByReference() {
        List<String> myString = new List<String>();
        reference(myString);
        System.debug(myString.size());       
        for(String str: myString){ 
            System.debug('Name of Person are::' +str);
        } 

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to pass the List argument to another method
    * Params        :    List<String>
    * Return        :    Void
    */

        List<String> myString1 = new List<String>();
        reference1(myString1);
        System.debug(myString1.size());
         for(String str1:myString1){  
            System.debug('Name of Person are::' +str1); 
         }     
    }
     /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    The method add the passed-in argument to a newly created List 
    * Params        :    List<String>
    * Return        :    List of String
    */

    public static List<String> reference(List<String> s){
        s.add('Jhon');
        s.add('Michal');
        s.add('David');
        s.add('Jorge');
     return s;
    }
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    The method assigns the passed-in argument to a newly created List 
    * Params        :    List<String>
    * Return        :    List of String
    */

    public static List<String> reference1(List<String> m){
        m = new List<String>{'Hello','Michal','Sam','Ruhi'};
          return m;
         }   
}