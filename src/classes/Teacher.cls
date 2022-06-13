public class Teacher {
    public Teacher ()  //Constructor
    {    
     //*********************Teacher Layout*****************
     	//*********************Student Personal Info*********
        Student__c student = new Student__c();
        student.Student_Name__c = 'Ashok Kumar';
        student.Roll_Number__c = 52346;
        student.Contact_No__c = '9982876356';
        student.Father_Name__c = 'Suresh Sharma';
        student.Father_Mobile_No__c= '3563431234';
        student.Landline_Number__c = '01413269916';
        student.Address__c = '1117,Jaipur';
        student.Email_Id__c = 's.sharma@gmail.com';
        student.Overall_Grade__c = 'A';
        //*************Class Info****************************
        student.Stream__c = 'CS';
        student.Class__c = 'II Year';
        student.Section__c = 'CS-B';
        //****************Fees Info**************************
        student.Current_Year__c = date.parse('12/08/2022');
        student.Pending_Fees_Amount__c = 04;
        student.Pending_Exam_Fees__c = 12;
        student.Exam_Fees_Submitted__c = true;
        student.Fees_Summitted__c = true;
        //*****************Semester Details*******************
        student.I_Sem_Back__c = true;
        student.I_Sem_Percentage__c = 79;
        student.II_Sem_Percentage__c = 80;
        student.IVSem_Percentage__c =79;
        student.III_Sem_Back__c = true;
        student.IV_Sem_Back__c = true;
        student.Back_Subject__c ='DE;EDC'; 
        insert student;   // Insert Record**************************
        System.debug('Record Id of this Record:'+ student.id);  //Get Record Id
    }

}