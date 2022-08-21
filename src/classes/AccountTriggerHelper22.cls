/*
 *  Purpose          :    This class is used to shoe when to use Trigger.Before.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/08/13
 *  Revision Logs    :    V_1.0 - Created - 2022/08/5
 */
public without sharing class AccountTriggerHelper22 {
  public static Boolean ALLOW_ACCOUNT_UPDATE = true;

  /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to update data using static flag in before operation.
    * Params        :    List<Contact> 
    * Return        :    Void
    */
    public static void processAccountData() {
        List<Account> accList = Trigger.new;
        List<Account> accList1 = new List<Account>();
        for(Account acc:accList){
            //Trigger.isAfter with DML
           accList1.add(new Account(id = acc.id,Name = 'FexleServices2'));
            
            //Trigger.isBefore without DML
           // acc.Name = 'Hello';
        }
      AccountTriggerHelper1.ALLOW_ACCOUNT_UPDATE = false;
      update accList1;
    }

     /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to apply discount based on AnnualRevenue condition .
    * Params        :    Void 
    * Return        :    Void
    */ 
    public static void updateDiscountBasedOnRevenueAmount(List<Account> newList,List<Account> oldList){
      Integer count = 0;
      for(Account acc : newList){
          if(acc.Phone != '' && oldList[count].Phone != ''){
              acc.Phone.addError('Phone Number should not be blank');
          }
          if(acc.AnnualRevenue != oldList[count].AnnualRevenue && acc.AnnualRevenue > 1000){
              acc.Discount__c = 50;
          }
      }
  }

  /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to update type in Account object based on Revenue Amount on Opportunity onject.
    * Params        :    List<Opportunity> 
    * Return        :    Void
    */
  public static void updateAccountType(List<Account> newList){
   // List<Opportunity> oppList = [SELECT Id, Name, Amount, AccountId FROM Opportunity WHERE AccountId IN :newList];
    List<Opportunity> oppList = [SELECT Id, Name, AccountId, Amount FROM Opportunity WHERE AccountId IN : newList AND Amount > 1000];
    System.debug(oppList);
    Set<Id> accIdSet = new Set<Id>();
    for(Opportunity opp : oppList){
       // if(opp.Amount > 1000){
          accIdSet.add(opp.AccountId);
        //}
    }
    System.debug(accIdSet);
    Integer count = 0;  
    for(Account acc: newList){
        if(accIdSet.contains(acc.Id)){
            acc.Type = 'Technology Partner';
        }
    }
    count++;
  }
}