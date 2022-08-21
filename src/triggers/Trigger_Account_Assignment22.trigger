/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Account object.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/08/5
 *  Revision Logs    :    V_1.0 - Created - 2022/08/5
 **/ 
trigger Trigger_Account_Assignment22 on Account (before insert,before update,after insert,after update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert||Trigger.isUpdate){
            //AccountTriggerHelper22.updateDiscountBasedOnRevenueAmount(Trigger.new,Trigger.old);
            AccountTriggerHelper22.updateAccountType(Trigger.new);
        }
    }
    //if(Trigger.isAfter && AccountTriggerHelper22.ALLOW_ACCOUNT_UPDATE)    
   // AccountTriggerHelper1.processAccountData();
}