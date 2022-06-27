/**
 *  Purpose         :    This Batch is used to show different Student Percentage Marks
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/06/26
 *  Revision Logs   :    V_1.0 - Created - 2022/06/26
 **/
public with sharing class StudentPercentage {
    
     /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to display the different Student passing division.
      * Params        :    List<Student__c> 
      * Return        :    Void
      **/
      static final Integer STUDENT_PERCENTAGE = 75;
      static final Integer STUDENT_PERCENTAGE1 = 60;
    public static void display(){	
        List<Student__c> per = [select Name,Percentage_Marks__c from Student__c];
        for(Student__c str:per)
        {
            if(str.Percentage_Marks__c>STUDENT_PERCENTAGE)
            {
                System.debug('Students Pass with Distinction ::'+ str);
            }
            else if(str.Percentage_Marks__c<STUDENT_PERCENTAGE)
            {
                System.debug('Students Pass with I division ::'+ str);
            }
            else if(str.Percentage_Marks__c<STUDENT_PERCENTAGE1)
            {
                System.debug('Students Pass with II division ::'+ str);
            }
            else
            {
                System.debug('Students Pass with III division ::'+ str); 
            }
        }
    }
}