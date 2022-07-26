/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Bank__c object.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/21
 *  Revision Logs    :    V_1.0 - Created - 2022/07/21
 **/ 
trigger Bank_Trigger on Bank__c (Before insert,After Insert,After Update) {
    If(Trigger.isBefore){
        if(Trigger.isInsert){
        Bank__c bank = Trigger.New[0];
            bank.Account_Number__c = 'SV'+bank.Account_Number__c;
        } 
    }
    If(Trigger.isAfter && Trigger.isInsert){
            BankTriggerHandler.sendEmailNotification(Trigger.New);
        }else if(Trigger.isUpdate){
            BankTriggerHandler.sendEmailUpdateNotification(Trigger.New);
     }
}