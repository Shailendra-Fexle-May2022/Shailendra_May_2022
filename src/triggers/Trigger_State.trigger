/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Contact object.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/08/13
 *  Revision Logs    :    V_1.0 - Created - 2022/08/16
 **/ 
trigger Trigger_State on State__c (After insert, After update, After delete,After unDelete) {
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUnDelete ){
            StateTriggerHelper1.increaseStateDistrictCountOnCountry(Trigger.new,Trigger.oldMap);
        }
        if(trigger.isUpdate){
         StateTriggerHelper1.updateStateDistrictCountOnCountry(Trigger.new,Trigger.oldMap);
        }
        if(trigger.isDelete){
            StateTriggerHelper1.decreaseStateDistrictCountOnCountry(Trigger.oldMap);    
        }
    }
    /*if(Trigger.isAfter){
        StateTriggerHelper.increaseStateDistrictCountOnCountry(Trigger.new, Trigger.oldMap);
    }*/
}