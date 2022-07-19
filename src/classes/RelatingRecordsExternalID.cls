/*
 *  Purpose          :    This class is for DML operation using external Id.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/10
 *  Revision Logs    :    V_1.0 - Created - 2022/07/10
 */
public with sharing class RelatingRecordsExternalID {
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is creating opportunity using Account Id(External Id).
    * Params        :    Void
    * Return        :    Void
    */

    public static void relatingRecordsExternalID_Method() {
        Opportunity newOpportunity = new Opportunity(Name='OpportunityWithAccountInsert', StageName='Prospecting',
        CloseDate=Date.today().addDays(7));
        Account accountReference = new Account(Name ='Jon Henery', ExternalId__c='SAP111111');
        insert accountReference;
        // Add the account sObject to the opportunity.
        newOpportunity.AccountId = accountReference.Id;
        // Create the opportunity.
        Database.SaveResult results = Database.insert(newOpportunity);
        System.debug(results);
    }
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is creating opportunity using Account Id(External Id).
    * Params        :    Void
    * Return        :    Void
    */
    public static void relatingRecordsExternalID_Method1() {
       // Creating Parent and Child Records in a Single Statement Using Foreign Keys
        Opportunity newOpportunity = new Opportunity(Name='OpportunityWithAccountInsert', StageName='Prospecting',
        CloseDate=Date.today().addDays(7));
        Account accountReference = new Account(ExternalId__c='SAP111123');                
        // Add the account sObject to the opportunity.  
        newOpportunity.AccountId = accountReference.Id;

        // Create the Account object to insert.
        Account parentAccount = new Account(Name = 'Gorge Poul', ExternalId__c='SAP111123' );

        // Create the opportunity.
        Database.SaveResult []results = Database.insert(new Sobject[]{parentAccount, newOpportunity});
        System.debug(results);
        for(Database.SaveResult sr : results){
            if(sr.isSuccess()){
                System.debug('The Id of sucessfully inserted record is::'+sr.getId());
            }
            else{
                for(Database.Error err : sr.getErrors()){
                    System.debug('The following error has occured:');
                    System.debug(err.getStatusCode() +'::'+ err.getMessage());
                    System.debug('The field affected by this error is:'+ err.getFields());
                }
            }
        }
    }
     /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is creating opportunity using Account Id(External Id).
    * Params        :    Void
    * Return        :    Void
    */
    public static void relatingRecordsExternalID_Method3() {
        Opportunity newOpportunity = new Opportunity(Name='OpportunityWithAccountInsert', StageName='Prospecting',
        CloseDate=Date.today().addDays(7),AccountID = '0015i00000JAYe6AAH');
        Database.SaveResult results = Database.insert(newOpportunity);
        System.debug(results);
    }

}