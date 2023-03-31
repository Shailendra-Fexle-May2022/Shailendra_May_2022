/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Contact object.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/08/13
 *  Revision Logs    :    V_1.0 - Created - 2022/08/13
 **/ 
trigger Trigger_Contact on Contact (Before insert,Before update) {
    if(trigger.isBefore){
        if(trigger.isInsert){
            ConatctTriggerHelper.synchronizeContactAccountPropertyRecord(Trigger.new);
        }
    }
}