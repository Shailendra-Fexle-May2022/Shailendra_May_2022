public class Registrar 
{
	public  Registrar() //Constructor
    {
     //*********************Teacher Layout*****************
    	 //*********************Student Personal Info*******
        Student__c student = new Student__c();
        student.Student_Name__c = 'Surendra';
        student.Roll_Number__c = 53447;
        student.Contact_No__c = '9982876350';
        student.Father_Name__c = 'Amar Nath Sharma';
        student.Father_Mobile_No__c = '3563431234';
        student.Landline_Number__c = '01413269915';
        student.Address__c = '1273,Jaipur';
        student.Email_Id__c = 's.sharma@gmail.com';        
        student.Overall_Grade__c = 'A';      
        //*************Class Info****************************
        student.Stream__c = 'ME';
        student.Class__c = 'II Year';
        student.Section__c = 'ME-A';
       //****************Fees Info**************************
        student.Current_Year__c = date.parse('2/08/2022');
        student.Exam_Fees_Submitted__c = true;
        student.Fees_Summitted__c = true; 
        student.Is_Donation__c = true;
        student.Pending_Fees_Amount__c = 24;
        student.Pending_Exam_Fees__c = 12;
        student.Donation_Amount__c = 23;
        student.Pending_Over_All_Amount__c= 10;
       //****************Bank Info**************************
        student.Bank_Name__c = 'Axis Bank';
        student.IFSC_Code__c = 'UTIB000031';
        student.Account_Number__c = 235641232;
        student.Bank_Phone_NO__c = '0141434744';
        student.Student_Contact_No__c= '9982876350';
        student.City__c = 'Jaipur';
        student.State__c = 'Rajasthan';    
        insert student;  //Insert Record**************************   
    }
}