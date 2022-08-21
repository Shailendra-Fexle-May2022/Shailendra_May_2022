/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Account object.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/08/5
 *  Revision Logs    :    V_1.0 - Created - 2022/08/5
 **/ 
trigger Tigger_DmlOperation on TriggerBasic__c (Before Update,After Update) {
   // If(Trigger.isBefore)
    // BasicTriggerHelper.checkDmlOeration();
   // If(Trigger.isAfter)
    //BasicTriggerHelper.checkDmlOeration(); 
    //BasicTriggerHelper.alternateMehodToUpdateRecord();
    If(Trigger.isAfter && BasicTriggerHelper.ALLOW_TriggerBasic_UPDATE)
        BasicTriggerHelper.alternateMehodToUpdateRecord();
}