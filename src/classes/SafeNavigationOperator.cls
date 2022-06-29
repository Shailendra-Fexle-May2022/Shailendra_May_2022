/*
 *  Purpose          :    This class is used  to practice of Safe Navigation Operator.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/06/26
 *  Revision Logs    :    V_1.0 - Created - 2022/06/26
 */
public with sharing class SafeNavigationOperator {
        /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to get account number and find out account holde name.
    * Params        :    List<Account> and passing String accountNumber
    * Return        :    Void
    */
    public static void getAccountNumberWithoutSafeNavigation(String accountNumber) {
        List<Account> accAccount = [select Id,Name from Account where AccountNumber = : accountNumber];
        if(! accAccount.isEmpty()){
            System.debug('Account Name::'+accAccount.get(0).Name);
        }
    }
         /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to get account number and find out account holde name.
    * Params        :    passing String accountNumber
    * Return        :    Void
    */
    public static void getAccountNumberWithSafeNavigation(String accountNumber){
        String accountName = [select Id,Name from Account where AccountNumber = : accountNumber]?.Name;
        System.debug('Account Name::'+accountName);
    }
}