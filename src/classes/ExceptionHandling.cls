/*
 *  Purpose          :    This class is for insert and update record.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/10
 *  Revision Logs    :    V_1.0 - Created - 2022/07/11
 */
public with sharing class ExceptionHandling {
    
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is using try and catch keywords for exception handling.
    * Params        :    Void
    * Return        :    Void
    */
    public static void ExceptionHandling_Method() {   
        Account[] accList = new List<Account>();
        for(Integer i=1;i<=3;i++){
            Account acc = new Account(Name = 'Miachal'+i,BillingCity='San Francisco');
            accList.add(acc);
        }
        System.debug(accList);//(Account:{Name=Miachal1, BillingCity=San Francisco}, Account:{Name=Miachal2, BillingCity=San Francisco}, Account:{Name=Miachal3, BillingCity=San Francisco})   
        Account accountToUpdate;
        //DmlException
        try {
            insert accList;
            accountToUpdate=[Select BillingCity from Account where Name = 'Miachal2' AND BillingCity= 'San Francisco' Limit 1];
            accountToUpdate.BillingCity = 'New York';
            update accountToUpdate;
            System.debug(accountToUpdate);
        }catch(DmlException d){
            System.debug('An unexpected error has occurred: ' + d.getMessage());
            //An unexpected error has occurred: Insert failed. First exception on row 0; first error: DUPLICATES_DETECTED, Use one of these records?: []
        }catch(Exception a){
            System.debug('An unexpected error has occurred: ' + a.getMessage());
            
        }
        /*}catch(Exception a){
            System.debug('An unexpected error has occurred: ' + a.getMessage());
            
        }catch(DmlException d){ //(Exception type already caught: System.DmlException)
            System.debug('An unexpected error has occurred: ' + d.getMessage());
            //An unexpected error has occurred: Insert failed. First exception on row 0; first error: DUPLICATES_DETECTED, Use one of these records?: []
        }
        try {
            Account acct = new Account(Name='Jackson Account');
            insert acct;
            ID acctID = acct.ID;
            // Add a contact to this account.
            Contact con = new Contact(
                FirstName='Joe',
                LastName='Smith',
                Phone='44437675',
                AccountId=acctID);
            insert con;
            System.debug(con);//{FirstName=Joe, LastName=Smith, Phone=44437675, AccountId=0015i00000JCDzdAAH, Id=0035i000008oockAAA}
        } catch(Exception e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        //ListException
        try {
            List<Integer> integerList = new List<Integer>();
            integerList.add(15);
            Integer a = integerList[0]; 
            Integer b = integerList[1]; // Causes a ListException
        } catch(ListException le) {
            System.debug('The following exception has occurred: ' + le.getMessage());//The following exception has occurred: List index out of bounds: 1
        }
        //NullPointerException
        try {
            String s;
            Boolean b = s.contains('abc'); // Causes a NullPointerException
        } catch(NullPointerException npe) {
            System.debug('The following exception has occurred: ' + npe.getMessage());//The following exception has occurred: Attempt to de-reference a null object
        }
        //QueryException
        try {
            // This statement doesn't cause an exception, even though 
            // we don't have a teacher with name='XYZ'.
            // The list will just be empty.
            List<Teacher__c> teacherList = [SELECT Name FROM Teacher__c WHERE Name = 'XYZ'];
            System.debug(teacherList.size());//0
            
            // However, this statement causes a QueryException because 
            // we're assiging the return value to a Teacher__c object
            // but no Teacher is returned.
            Teacher__c teacherObject = [SELECT Name FROM Teacher__c WHERE Name = 'XYZ' LIMIT 1];
        } catch(QueryException qe) {
            System.debug('The following exception has occurred: ' + qe.getMessage()); //The following exception has occurred: List has no rows for assignment to SObject   
        }*/
    }
}