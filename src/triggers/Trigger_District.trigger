/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Contact object.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/08/13
 *  Revision Logs    :    V_1.0 - Created - 2022/08/16
 **/ 
trigger Trigger_District on District__c (After insert, After update, After delete,After unDelete) {
   if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUnDelete){
           DistrictTriggerHelper.increaseDistrictCountOnState(Trigger.new);
            //District1TriggerHelper.increaseDistrictCountOnState(Trigger.new);
        }
        if(trigger.isUpdate){
          DistrictTriggerHelper.updateDistrictCountOnState(Trigger.new,Trigger.oldMap);
          //District1TriggerHelper.updateDistrictCountOnState(Trigger.new,Trigger.oldMap);
        }
        if(trigger.isDelete){
           DistrictTriggerHelper.decreaseDistrictCountOnState(Trigger.oldMap); 
            //District1TriggerHelper.decreaseDistrictCountOnState(Trigger.old);    
        }
    }
    /*if(Trigger.isAfter){
        if(trigger.isInsert||trigger.isUpdate||trigger.isDelete||trigger.isUnDelete)
        District1TriggerHelper.increaseStateDistrictCountOnCountry(Trigger.new, Trigger.oldMap);
    }*/
}