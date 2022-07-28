/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Account object.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/21
 *  Revision Logs    :    V_1.0 - Created - 2022/07/21
 **/ 
trigger Trigger_Account_Assignment on Account (Before insert,Before Update) {
    if(Trigger.isBefore){   
        system.debug('Checking in Before Trigger Operations');
        if(Trigger.isInsert){     
            system.debug('Check Insert List ::: Trigger.New ' + Trigger.New);
            system.debug('Check Insert List ::: Trigger.old ' + Trigger.old);
        }
        if(Trigger.isUpdate){   
            system.debug('Check Update List ::: Trigger.New ' + Trigger.New);//|Check Update List ::: Trigger.New (Account:{Id=0015i00000JE1mcAAD,Name=Fexle Servics, Type=Customer - Channel,
                system.debug('Check Update List ::: Trigger.old ' + Trigger.old);//Check Update List ::: Trigger.old (Account:{Id=0015i00000JE1mcAAD,Name=Fexle Servics, Type=Customer - Direct, 
                if(Trigger.New[0].Type != Trigger.old[0].Type){
                    
                    system.debug('Type Value Changed');//Type Value Changed
                    system.debug('Trigger.New Data' + Trigger.New[0].Type);//Trigger.New DataCustomer - Channel
                    system.debug('Trigger.old Data' + Trigger.old[0].Type);//DEBUG|Trigger.old DataCustomer - Direct
                }else{
                    Trigger.New[0].addError('Trigger Type must changed');
                }
        }
    }
}