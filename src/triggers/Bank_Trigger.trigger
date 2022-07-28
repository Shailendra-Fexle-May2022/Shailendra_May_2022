/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Bank__c object.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/21
 *  Revision Logs    :    V_1.0 - Created - 2022/07/21
 **/ 
trigger Bank_Trigger on Bank__c (Before insert,After Insert,After Update) {
    If(Trigger.isBefore){
        if(Trigger.isInsert){
            BankTriggerHelper.insertPrefixInAccountNumber(Trigger.New);
        } 
		if(Trigger.isUpdate){
            BankTriggerHelper.updateAccountNumberMethod(Trigger.New, Trigger.oldMap);
        }        
    }
    If(Trigger.isAfter){
        if(Trigger.isInsert){
            BankTriggerHelper.sendEmailNotification(Trigger.New);
        }
        if(Trigger.isUpdate){
            BankTriggerHelper.sendEmailUpdateNotification(Trigger.New, Trigger.oldMap);
        }
    }
}