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
        Account accountReference = new Account(Name ='Gorge', MyExtID__c='SAP111111');
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
        Opportunity newOpportunity = new Opportunity(Name='OpportunityWithAccountInsert', StageName='Prospecting',
        CloseDate=Date.today().addDays(7));
        List<Account> accountReference = [Select Id, Name from Account where MyExtID__c='SAP111111'];                
        // Add the account sObject to the opportunity.
        newOpportunity.AccountId = accountReference[0].Id;
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
    public static void relatingRecordsExternalID_Method3() {
        Opportunity newOpportunity = new Opportunity(Name='OpportunityWithAccountInsert', StageName='Prospecting',
        CloseDate=Date.today().addDays(7),AccountID = '0015i00000JAYe6AAH');
        Database.SaveResult results = Database.insert(newOpportunity);
        System.debug(results);
    }

}