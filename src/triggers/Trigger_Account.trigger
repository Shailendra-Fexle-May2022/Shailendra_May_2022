/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Account object.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/21
 *  Revision Logs    :    V_1.0 - Created - 2022/07/21
 **/ 
trigger Trigger_Account on Account (Before Insert,Before Update,Before Delete,After Insert,After Update,After Delete,After UnDelete) {
    if(Trigger.isBefore){  
        system.debug('Checking in Before Trigger Operations');
        if(Trigger.isInsert){   
            system.debug('Check Insert List ::: Trigger.New ' + Trigger.New);//Trigger.New (Account:{Id=null, IsDeleted=false,Name=Hello,
            system.debug('Check Insert List ::: Trigger.old ' + Trigger.old);//Check Insert List ::: Trigger.old null
        }
        if(Trigger.isUpdate){
            system.debug('Check Update List ::: Trigger.New ' + Trigger.New);//Check Update List ::: Trigger.New (Account:{Id=0015i00000JDytcAAD, IsDeleted=false,Name=Hello,BillingStreet=NewYork
            system.debug('Check Update List ::: Trigger.old ' + Trigger.old);//DEBUG|Check Update List ::: Trigger.old (Account:{Id=0015i00000JDyQLAA1, IsDeleted=false,Name=hello,BillingStreet=null      
        }
        if(Trigger.isUnDelete){
            system.debug('Check Delete List ::: Trigger.New ' + Trigger.New);//Delete List ::: Trigger.New null
            system.debug('Check Delete List ::: Trigger.old ' + Trigger.old);//Check Delete List ::: Trigger.old (Account:{Id=0015i00000JDytcAAD, IsDeleted=false,Name=Hello,BillingStreet=NewYork,      
       }
        if(Trigger.isDelete){
            system.debug('Check Delete List ::: Trigger.New ' + Trigger.New);//Delete List ::: Trigger.New null
            system.debug('Check Delete List ::: Trigger.old ' + Trigger.old);//Check Delete List ::: Trigger.old (Account:{Id=0015i00000JDytcAAD, IsDeleted=false,Name=Hello,BillingStreet=NewYork,      
       }
    } 
    if(Trigger.isAfter){
        if(Trigger.isInsert){   
            system.debug('Check Insert List ::: Trigger.New ' + Trigger.New);//Check Insert List ::: Trigger.New (Account:{Id=0015i00000JDytcAAD, IsDeleted=false,Name=Hello, Type=null
            system.debug('Check Insert List ::: Trigger.old ' + Trigger.old);//Check Insert List ::: Trigger.old null
        }
        if(Trigger.isUpdate){
            system.debug('Check Update List ::: Trigger.New ' + Trigger.New);//Check Update List ::: Trigger.New (Account:{Id=0015i00000JDytcAAD, IsDeleted=false,Name=Hello,BillingStreet=NewYork,
            system.debug('Check Update List ::: Trigger.old ' + Trigger.old);//Check Update List ::: Trigger.old (Account:{Id=0015i00000JDytcAAD, IsDeleted=false,Name=Hello,BillingStreet=null      
        }
        if(Trigger.isDelete){
            system.debug('Check Delete List ::: Trigger.New ' + Trigger.New);//Check Delete List ::: Trigger.New null
            system.debug('Check Delete List ::: Trigger.old ' + Trigger.old);//Check Delete List ::: Trigger.old (Account:{Id=0015i00000JDytcAAD, IsDeleted=false,Name=Hello,BillingStreet=NewYork,     
       }
        if(Trigger.isUnDelete){
            system.debug('Check UnDelete List ::: Trigger.New ' + Trigger.New);//Check UnDelete List ::: Trigger.New (Account:{Id=0015i00000JDytcAAD, IsDeleted=false,Name=Hello,BillingStreet=NewYork
            system.debug('Check UnDelete List ::: Trigger.old ' + Trigger.old);//Check UnDelete List ::: Trigger.old null     
       }
    }
}