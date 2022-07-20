/*
 *  Purpose          :    This class is for Database method .
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/15
 *  Revision Logs    :    V_1.0 - Created - 2022/07/15
 */
public with sharing class DataBaseDmlOperation {

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is showing database Insert method.
    * Params        :    Void
    * Return        :    Void
    */
    public  static void dataBaseOperation_InsertMethod() {
        // Insert DataBaseOperation
        // Create the list of Account to insert
        List<Account> acctList = new List<Account>();
        acctList.add(new Account(Name='James', Phone = '1234567876'));
        acctList.add(new Account(Name='Lucas', Phone = '8976563423'));

        // Bulk insert all Account recods with one call
        Database.SaveResult[] srList = Database.insert(acctList, false);

        // Iterate through each returned result
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully inserted account. Account ID: ' + sr.getId());//Successfully inserted account. Account ID: 0015i00000JDkJxAAL, Successfully inserted account. Account ID: 0015i00000JDkJyAAL
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
        }
        // Create two accounts, one of which is missing a required field
        List<Contact> conList = new List<Contact>();
       	conList.add(new Contact(FirstName='Jack',LastName = 'Goms'));
        conList.add(new Contact());
            Database.SaveResult[] crList = Database.insert(conList , false);
            //Database.SaveResult[] crList  = Database.insert(conList , true);//If we use true instead of false
            //System.DmlException: Insert failed. First exception on row 1; 
            //first error: REQUIRED_FIELD_MISSING, Required fields are missing: [Name]: [Name]

        // Iterate through each returned result
        for (Database.SaveResult sr : crList) {
            if (sr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully inserted Contact. Contact ID: ' + sr.getId()); //Successfully inserted Contact. Contact ID: 0015i00000JBrPiAAL
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage()); //REQUIRED_FIELD_MISSING: Required fields are missing: [Name]
                    System.debug('Contact fields that affected this error: ' + err.getFields()); //Contact fields that affected this error: (Name)
                }
            }
        }
    }

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is showing database update method.
    * Params        :    Void
    * Return        :    Void
    */
    public  static void dataBaseOperation_UpdateMethod(){
        // Update DataBaseOperation
        // Create the list of Contact to Update
        List<Contact> contList = new List<Contact>();
            for(Contact con :[SELECT Id,Phone from Contact WHERE Name = 'Manish Sharma']){
                con.Phone = '67427635';
                con.Email= 'admo@gmail.com';
                contList.add(con);
            }
        // Bulk update all Contact recods with one call
        Database.SaveResult[] srList = Database.update(contList , false);

        // Iterate through each returned result
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully updatedted contact. Contact ID: ' + sr.getId());//Successfully updatedted contact. Contact ID: 0035i000006djebAAA
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');                   
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Contact fields that affected this error: ' + err.getFields());
                }
            }
        }
        //Showing error message duing update of data.
        List<Contact> contList1 = new List<Contact>();
            for(Contact con :[SELECT Id,Phone,LastName from Contact]){
                con.LastName = ' '; 
                con.Phone = '67427635';
                con.Email= 'admo@gmail.com';
                contList1.add(con);
            }
        // Bulk update all Contact recods with one call
        Database.SaveResult[] srList1 = Database.update(contList1 , false);

        // Iterate through each returned result
        for (Database.SaveResult sr : srList1) {
            if (sr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully updatedted contact. Contact ID: ' + sr.getId());
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');//The following error has occurred.                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());//Contact fields that affected this error: (LastName)
                    System.debug('Contact fields that affected this error: ' + err.getFields());//Contact fields that affected this error: (LastName)
                }
            }
        }
    }
    
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is showing database delete method.
    * Params        :    Void
    * Return        :    Void
    */
    public  static void dataBaseOperation_DeleteMethod(){
        //Delete DataBaseOperation
        // Query the accounts to delete
        Account[] acctList2 = [SELECT Id from Account WHERE Name LIKE 'James'];
        // Delete the accounts
        Database.DeleteResult[] drList = Database.delete(acctList2, false);

        // Iterate through each returned result
        for(Database.DeleteResult dr : drList) {
            if (dr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully deleted account with ID: ' + dr.getId());////Successfully deleted account with ID: 0015i00000JBrOZAA1
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : dr.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
        }
    }

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is showing database undelete method.
    * Params        :    Void
    * Return        :    Void
    */
    public  static void dataBaseOperation_UnDeleteMethod(){   
        //UnDelete DataBaseOperation
        // Query the accounts to Undelete
        Account[] acctList3 = [SELECT Id from Account WHERE Name LIKE 'James' ALL ROWS];
        // UnDelete the accounts
        Database.UnDeleteResult[] drList1 = Database.Undelete(acctList3,true);

        // Iterate through each returned result
        for(Database.UnDeleteResult dr : drList1) {
            if (dr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully Undeleted account with ID: ' + dr.getId()); //Successfully Undeleted account with ID: 0015i00000JBrOZAA1, Successfully Undeleted account with ID: 0015i00000JBrOjAAL
            }
            else {
                // Operation failed, so get all errors
                System.debug('The following error has occurred.'); 
                List<Database.Error> errorList = dr.getErrors();               
                for(Database.Error err : errorList ) {                     
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
        }
    }
}