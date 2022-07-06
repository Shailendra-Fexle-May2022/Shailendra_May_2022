/**
 *  Purpose         :    This class is used to show different control statment.
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/06/27
 *  Revision Logs   :    V_1.0 - Created - 2022/06/27
 **/
public with sharing class ConditionalAndLoop {
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to show the highest number out of three number.
      * Params        :    Void
      * Return        :    Void
      **/
    public static void conditionalMethod() {
        Integer i = 35, j = 20, k = 15;
        if(i>j){
            if(i>k){
            System.debug('The highest number is::'+i);
            }
            else{
                System.debug('The highest number is::'+k);
            }
        }
        else if(j>k){
                System.debug('The highest number is::'+j);  
        }
            else{
                System.debug('The highest number is::'+k);
            }      
    }
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to show the factorial of a number.
      * Params        :    Void
      * Return        :    Void
      **/
    public static void forLoopMethod(){
        Integer num = 5;
        Integer fact = 1;
        for(Integer i = 1;i<=num;i++){
            fact = fact*i;
        }
        System.debug('The factorial of number is::'+fact);
    }  
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to show the inseration and iteration of data in a List.
      * Params        :    List<Student__c>
      * Return        :    Void
      **/ 
    public static void forEachLoopMethod(){
        List<String> strList = new List<String>{'Rohan','Prakash','Mukesh','Rahul'};
        for(String str:strList){
            System.debug('Name of Student is ::'+ str); 
        }
        List<Student__c> myList = new List<Student__c>();
         myList = [select Id,Name from Student__c];
        for(Student__c st:myList){
            System.debug('Name of Student is ::'+ st.Name); 
        }
    }     

}