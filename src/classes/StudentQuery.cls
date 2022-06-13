public class StudentQuery
{
	public StudentQuery()
    {   
    /*{
		//Get Student Query of one Record.
		Student__c student = new Student__c();
    	student = [Select id,Name,Student_Name__c,Roll_Number__c, Contact_No__c,Father_Name__c,Father_Mobile_No__c,Email_Id__c,Overall_Grade__c,Stream__c,Class__c,Section__c,Current_Year__c,Pending_Fees_Amount__c, Pending_Exam_Fees__c,Exam_Fees_Submitted__c,Fees_Summitted__c,I_Sem_Back__c,I_Sem_Percentage__c,Back_Subject__c from Student__c limit 1];
        System.debug(student);  
    }*/  
        //Get Student Query of 5 Record.
        List<Student__c> students = new List<Student__c>();
    	students = [Select Id,Name,Student_Name__c,Roll_Number__c,Contact_No__c from Student__c];
    	for(Student__c s:student)
    	{
        	System.debug('Record of Student:'+ s);    
   	    }
    }
}