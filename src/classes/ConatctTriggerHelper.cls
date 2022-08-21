/*
 *  Purpose          :    This class is used to synchronize status on three object.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/08/13
 *  Revision Logs    :    V_1.0 - Created - 2022/08/13
 */
public without sharing class ConatctTriggerHelper {

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to copy satus from parent to child and grand parent to child if parent status is empty.
    * Params        :    List<Contact> 
    * Return        :    Void
    */
    public static void synchronizeContactAccountPropertyRecord(List<Contact> newList) {
        Set<id> accountIdSet = new Set<id>();
        for(Contact con: newList){
            if(con.Status__c == null){
                accountIdSet.add(con.AccountId);   
                System.debug(accountIdSet);
            }
        } 
        Map<Id,Account> accMap = new Map<Id,Account>([Select Id,Status__c,Property__c,Property__r.Status__c,Property__r.Name From Account Where id IN: accountIdSet]);
        System.debug(accMap);                                                            
        for(Contact con: newList){
           // Account acc = new Account();
            //acc.Status__c = accMap.get(con.AccountId).Status__c;
            Account acc = accMap.get(con.AccountId);
            if(acc.Status__c != null){
                con.Status__c = acc.Status__c; 
            }
            else if(acc.Property__r.Status__c!=null){
                con.Status__c = acc.Property__r.Status__c;
            }
        }
    }
}