/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Account object.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/21
 *  Revision Logs    :    V_1.0 - Created - 2022/07/21
 **/ 
trigger Trigger_AccountMap on Account (Before Insert,Before Update,Before Delete,After Insert,After Update,After Delete,After UnDelete){
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            system.debug('Check Insert List ::: Trigger.newMap ' + Trigger.newMap);//Check Insert List ::: Trigger.newMap null
            system.debug('Check Insert List ::: Trigger.oldMap ' + Trigger.oldMap);//Check Insert List ::: Trigger.oldMap null,
        }
        if(Trigger.isUpdate){
            system.debug('Check Update List ::: Trigger.newMap ' + Trigger.newMap.keySet());//Check Update List ::: Trigger.newMap {0015i00000JE1JWAA1}
            system.debug('Check Update List ::: Trigger.oldMap ' + Trigger.oldMap.keySet());//Check Update List ::: Trigger.oldMap {0015i00000JE1JWAA1}
        }
        if(Trigger.isDelete){
            system.debug('Check Delete List ::: Trigger.newMap ' + Trigger.newMap);//Check Delete List ::: Trigger.newMap null
            system.debug('Check Delete List ::: Trigger.oldMap ' + Trigger.oldMap.keySet());//Check Delete List ::: Trigger.oldMap {0015i00000JE1JWAA1}  
        }      
    }
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            system.debug('Check Insert List ::: Trigger.newMap ' + Trigger.newMap.keySet());//Check Insert List ::: Trigger.newMap {0015i00000JE1JWAA1}
            system.debug('Check Insert List ::: Trigger.oldMap ' + Trigger.oldMap);//Check Insert List ::: Trigger.oldMap null
        }
        if(Trigger.isUpdate){
            system.debug('Check Update List ::: Trigger.newMap ' + Trigger.newMap.keySet());//Check Update List ::: Trigger.newMap {0015i00000JE1JWAA1}
            system.debug('Check Update List ::: Trigger.oldMap ' + Trigger.oldMap.keySet());//Check Update List ::: Trigger.oldMap {0015i00000JE1JWAA1}
        }
        if(Trigger.isDelete){
            system.debug('Check Delete List ::: Trigger.newMap ' + Trigger.newMap);//Check Delete List ::: Trigger.newMap null
            system.debug('Check Delete List ::: Trigger.oldMap ' + Trigger.oldMap.keySet());//Check Delete List ::: Trigger.oldMap {0015i00000JE1JWAA1}
        }
        if(Trigger.isUndelete){
            system.debug('Check Undelete List ::: Trigger.newMap ' + Trigger.newMap.keySet());//Check Undelete List ::: Trigger.newMap {0015i00000JE1JWAA1}
            system.debug('Check Undelete List ::: Trigger.oldMap ' + Trigger.oldMap);//Check Undelete List ::: Trigger.oldMap null
        }
    }
}