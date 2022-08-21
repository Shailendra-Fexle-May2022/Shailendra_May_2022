trigger Trigger_Practice on TriggerPractice__c (Before Insert, Before Update,Before Delete, After Insert, After Update,After Delete,After Undelete ) {
    if(Trigger.isBefore){  
        system.debug('Checking in Before Trigger Operations');//Checking in Before Trigger Operations
        if(Trigger.isInsert){   
            system.debug('Check Insert List ::: Trigger.New ' + Trigger.New);//Check Insert List ::: Trigger.New (TriggerPractice__c:{Id=null, OwnerId=0055i000001d4G8AAI, IsDeleted=false, Name=Fexle 3, CreatedDate=null,
                // CreatedById=null, LastModifiedDate=null, LastModifiedById=null, SystemModstamp=null, LastActivityDate=null, LastViewedDate=null, LastReferencedDate=null, Phone__c=345562434, Department__c=TESTING})
            system.debug('Check Insert List ::: Trigger.old ' + Trigger.old);//Check Insert List ::: Trigger.old null
        }
    
        if(Trigger.isUpdate){
            system.debug('Check Update List ::: Trigger.New ' + Trigger.New);//Check Update List ::: Trigger.New (TriggerPractice__c:{Id=a0S5i000002au6cEAA, OwnerId=0055i000001d4G8AAI, IsDeleted=false, Name=Fexle 3, 
                //CreatedDate=2022-07-26 10:57:09, CreatedById=0055i000001d4G8AAI, LastModifiedDate=2022-07-26 10:57:09, LastModifiedById=0055i000001d4G8AAI, SystemModstamp=2022-07-26 10:57:09, LastActivityDate=null, 
                //LastViewedDate=null, LastReferencedDate=null, Phone__c=1413278587, Department__c=TESTING})
            system.debug('Check Update List ::: Trigger.old ' + Trigger.old);//Check Update List ::: Trigger.old (TriggerPractice__c:{Id=a0S5i000002au6cEAA, OwnerId=0055i000001d4G8AAI, IsDeleted=false, Name=Fexle 3, 
                //CreatedDate=2022-07-26 10:57:09, CreatedById=0055i000001d4G8AAI, LastModifiedDate=2022-07-26 10:57:09, LastModifiedById=0055i000001d4G8AAI, SystemModstamp=2022-07-26 10:57:09, LastActivityDate=null, 
                //LastViewedDate=null, LastReferencedDate=null, Phone__c=345562434, Department__c=TESTING})
        }
        if(Trigger.isDelete){
            system.debug('Check Delete List ::: Trigger.New ' + Trigger.New);//Check Delete List ::: Trigger.New null
            system.debug('Check Delete List ::: Trigger.old ' + Trigger.old);//Check Delete List ::: Trigger.old (TriggerPractice__c:{Id=a0S5i000002au6cEAA, OwnerId=0055i000001d4G8AAI, IsDeleted=false, Name=Fexle 1, 
                //CreatedDate=2022-07-26 10:57:09, CreatedById=0055i000001d4G8AAI, LastModifiedDate=2022-07-26 11:13:08, LastModifiedById=0055i000001d4G8AAI, SystemModstamp=2022-07-26 11:13:08, LastActivityDate=null, 
                //LastViewedDate=null, LastReferencedDate=null, Phone__c=1413278587, Department__c=TESTING})     
       }
    } 
    if(Trigger.isAfter){
        system.debug('Checking in After Trigger Operations');//Checking in After Trigger Operations
        if(Trigger.isInsert){   
            system.debug('Check Insert List ::: Trigger.New ' + Trigger.New);//Check Insert List ::: Trigger.New (TriggerPractice__c:{Id=a0S5i000002au6cEAA, OwnerId=0055i000001d4G8AAI, IsDeleted=false, Name=Fexle 3, 
                //CreatedDate=2022-07-26 10:57:09, CreatedById=0055i000001d4G8AAI, LastModifiedDate=2022-07-26 10:57:09, LastModifiedById=0055i000001d4G8AAI, SystemModstamp=2022-07-26 10:57:09, LastActivityDate=null, 
                //LastViewedDate=null, LastReferencedDate=null, Phone__c=345562434, Department__c=TESTING})
            system.debug('Check Insert List ::: Trigger.old ' + Trigger.old);//Check Insert List ::: Trigger.old null
        }
        if(Trigger.isUpdate){
            system.debug('Check Update List ::: Trigger.New ' + Trigger.New);//Check Update List ::: Trigger.New (TriggerPractice__c:{Id=a0S5i000002au6cEAA, OwnerId=0055i000001d4G8AAI, IsDeleted=false, Name=Fexle 1, 
                //CreatedDate=2022-07-26 10:57:09, CreatedById=0055i000001d4G8AAI, LastModifiedDate=2022-07-26 11:13:08, LastModifiedById=0055i000001d4G8AAI, SystemModstamp=2022-07-26 11:13:08, LastActivityDate=null,
                // LastViewedDate=null, LastReferencedDate=null, Phone__c=1413278587, Department__c=TESTING})
            system.debug('Check Update List ::: Trigger.old ' + Trigger.old);//Check Update List ::: Trigger.old (TriggerPractice__c:{Id=a0S5i000002au6cEAA, OwnerId=0055i000001d4G8AAI, IsDeleted=false, Name=Fexle 3, 
                //CreatedDate=2022-07-26 10:57:09, CreatedById=0055i000001d4G8AAI, LastModifiedDate=2022-07-26 11:06:57, LastModifiedById=0055i000001d4G8AAI, SystemModstamp=2022-07-26 11:06:57, LastActivityDate=null, 
                //LastViewedDate=null, LastReferencedDate=null, Phone__c=1413278587, Department__c=TESTING})    
        }
        if(Trigger.isDelete){
            system.debug('Check Delete List ::: Trigger.New ' + Trigger.New);//Check Delete List ::: Trigger.New null
            system.debug('Check Delete List ::: Trigger.old ' + Trigger.old);//Check Delete List ::: Trigger.old (TriggerPractice__c:{Id=a0S5i000002au6cEAA, OwnerId=0055i000001d4G8AAI, IsDeleted=false, Name=Fexle 1,
                // CreatedDate=2022-07-26 10:57:09, CreatedById=0055i000001d4G8AAI, LastModifiedDate=2022-07-26 11:13:08, LastModifiedById=0055i000001d4G8AAI, SystemModstamp=2022-07-26 11:13:08, LastActivityDate=null,
                // LastViewedDate=null, LastReferencedDate=null, Phone__c=1413278587, Department__c=TESTING}   
        }
        if(Trigger.isUnDelete){
            system.debug('Check UnDelete List ::: Trigger.New ' + Trigger.New);//Check UnDelete List ::: Trigger.New (TriggerPractice__c:{Id=a0S5i000002au6cEAA, OwnerId=0055i000001d4G8AAI, IsDeleted=false, Name=Fexle 1, 
                //CreatedDate=2022-07-26 10:57:09, CreatedById=0055i000001d4G8AAI, LastModifiedDate=2022-07-26 11:24:08, LastModifiedById=0055i000001d4G8AAI, SystemModstamp=2022-07-26 11:24:08, LastActivityDate=null, 
                //LastViewedDate=null, LastReferencedDate=null, Phone__c=1413278587, Department__c=TESTING})
            system.debug('Check UnDelete List ::: Trigger.old ' + Trigger.old);//Check UnDelete List ::: Trigger.old null
        }
    }
}