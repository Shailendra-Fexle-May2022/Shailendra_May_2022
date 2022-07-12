/*
 *  Purpose          :    This class is for insert and update record.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/10
 *  Revision Logs    :    V_1.0 - Created - 2022/07/10
 */
public with sharing class ExceptionHandling {
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is showing insert  and update DML operation on Account Object using try and catch keywords.
    * Params        :    Void
    * Return        :    Void
    */
    public static void ExceptionHandling_Method() {
        Account[] accList = new List<Account>();
        for(Integer i=1;i<=3;i++){
            Account acc = new Account(Name = 'Miachal'+i,BillingCity='San Francisco');
            accList.add(acc);
       }
        System.debug(accList);   
        Account accountToUpdate;
        try {
            insert accList;
            accountToUpdate=[Select BillingCity from Account where Name = 'Miachal2' AND BillingCity= 'San Francisco' Limit 1];
            accountToUpdate.BillingCity = 'New York';
            update accountToUpdate;
            System.debug(accountToUpdate);
        }catch(DmlException d){
            System.debug('An unexpected error has occurred: ' + d.getMessage());
            //An unexpected error has occurred: Insert failed. First exception on row 0; first error: DUPLICATES_DETECTED, Use one of these records?: []
        }
    }
}