/*
 *  Purpose          :    This class is used to shoe when to use Trigger.Before.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/08/13
 *  Revision Logs    :    V_1.0 - Created - 2022/08/5
 */
public class BasicTriggerHelper {
    public static Boolean ALLOW_TriggerBasic_UPDATE = true;

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to check DML operation in before and after operation.
    * Params        :    List<TriggerBasic__c> 
    * Return        :    Void
    */
    public static void checkDmlOeration(){ 
       List<TriggerBasic__c> newList = Trigger.New;
       /* //Update record using DML Statement In Before event
        for(TriggerBasic__c tb:newList){
            tb.Name = 'DmlOperation1';
            tb.Phone__c = '141476477';
        }
        update newList;//execution of BeforeUpdate caused by: System.SObjectException: DML statement cannot operate on trigger.new or trigger.old*/
        
        //Update record Without DML Statement In Before event.// Record is updated(modification).
        /*for(TriggerBasic__c tb:newList){
            tb.Name = 'DmlOperation1';
            tb.Phone__c = '141476477';     
        }*/
        //Update record using DML Statement In After event
       /* for(TriggerBasic__c tb:newList){
            tb.Name = 'DmlOperation2';
            tb.Phone__c = '141476442';
        }
        update newList;//execution of AfterUpdate caused by: System.FinalException: Record is read-only*/
        
       // Update record Without DML Statement In After event
        for(TriggerBasic__c tb:newList){
            tb.Name = 'DmlOperation3';
            tb.Phone__c = '141476';//execution of AfterUpdate caused by: System.FinalException: Record is read-only
	      }
    }   
    
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to show alternate method to use DML operation after operation.
    * Params        :    List<TriggerBasic__c> 
    * Return        :    Void
    */
    public static void alternateMehodToUpdateRecord(){
        List<TriggerBasic__c> newList = Trigger.New;
        List<TriggerBasic__c> newList1 = new List<TriggerBasic__c>();
        for(TriggerBasic__c tb:newList){
             newList1.add(new TriggerBasic__c(Id = tb.Id,Name = 'DmlOperation3',Phone__c = '141476'));
        }
      //  TriggerBasicHelper.ALLOW_TriggerBasic_UPDATE = 	false ;
        update newList1;
        //execution of AfterUpdate caused by: System.DmlException: Update failed. First exception on row 0 with id a0W5i000000BzwKEAS; first error: CANNOT_INSERT_UPDATE_ACTIVATE_ENTITY, Tigger_DmlOperation: maximum trigger depth exceeded
    	
        //Update record using Flag In After event//// Record is updated(modification).
        for(TriggerBasic__c tb:newList){
             newList1.add(new TriggerBasic__c(Id = tb.Id,Name = 'DmlOperation3',Phone__c = '141476'));
        }
        TriggerBasicHelper.ALLOW_TriggerBasic_UPDATE = 	false ;
        update newList1;//
        
    }
}