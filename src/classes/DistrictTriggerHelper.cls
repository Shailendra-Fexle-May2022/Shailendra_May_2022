/*
 *  Purpose          :    This class is used to call trigger method.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/22
 *  Revision Logs    :    V_1.0 - Created - 2022/08/14
 */
public without sharing class DistrictTriggerHelper {

	public static Map<Id, State__c> stateMap = new Map<Id, State__c>();
	
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to increase district count on state.
    * Params        :    List<District__c>
    * Return        :    Void
    */
	public static void increaseDistrictCountOnState(List<District__c> newList) {
        
        for(District__c dis: newList){
            if(dis.State__c != null){
                stateMap.put(dis.State__c, new State__c(Id=dis.State__c, Total_Districts_Count__c	 = 0));  
                System.debug(stateMap); 
            }
        }                                                  
        if(!stateMap.isEmpty()){
            updateCountOnState(stateMap);
        }    
    }

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to decrease district count on state.
    * Params        :    Map<Id, District__c>
    * Return        :    Void
    */
    public static void decreaseDistrictCountOnState(Map<Id, District__c> oldMap){
        
        for(District__c dis: oldMap.values()){
            if(oldMap.get(dis.Id).State__c !=null){
                stateMap.put(oldMap.get(dis.Id).State__c, new State__c(Id=oldMap.get(dis.Id).State__c, Total_Districts_Count__c	 = 0));
				System.debug(stateMap);
            }
        }
       if(!stateMap.isEmpty()){
            updateCountOnState(stateMap);
        }  
    } 

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to update district count on state.
    * Params        :    List<District__c>,Map<Id,District__c>
    * Return        :    Void
    */
    public static void updateDistrictCountOnState(List<District__c> newList, Map<Id,District__c> oldMap ){

        Set<id> stateIdSet = new Set<id>();
        for(District__c dis: newList){
            if(oldMap.get(dis.Id).State__c != null && dis.State__c != oldMap.get(dis.Id).State__c){
                stateMap.put(oldMap.get(dis.Id).State__c,new State__c(Id=oldMap.get(dis.Id).State__c, Total_Districts_Count__c	 = 0) );
                stateMap.put(dis.State__c,new State__c(Id = dis.State__c, Total_Districts_Count__c	 = 0));
                System.debug(stateMap);
            }    
        }
        if(!stateMap.isEmpty()){
            updateCountOnState(stateMap);
        }
    }  

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to do aggregate query on state.
    * Params        :    Map<Id, State__c>
    * Return        :    Void
    */
    public static void updateCountOnState(Map<Id, State__c> statesMap){
		List<State__c> stateList = [Select Id,Name,Total_Districts_Count__c,(Select Id,Name From Districts__r),Country__r.Total_Districts_Trigger_Count__c From State__c Where Id In:statesMap.keySet()];
        if(!stateList.isEmpty()){
            for(State__c st:stateList){
                st.Total_Districts_Count__c = st.Districts__r.size();
                st.Country__r.Total_Districts_Trigger_Count__c = st.Country__r.Total_Districts_Trigger_Count__c + st.Districts__r.size();    
            }
            if(!stateList.isEmpty()){
                update stateList;
            }
        }
       /* List<AggregateResult> districtResult = [Select State__c State_Id, COUNT(Id)TotalDistricts From District__c Where State__c IN : statesMap.keySet() Group By State__c];
        List<State__c> stateList = new List<State__c>();
        for(AggregateResult agg: districtResult){
            State__c objState = new State__c();
            objState.Total_Districts_Count__c = (Integer)agg.get('TotalDistricts');
            objState.Id = (Id)agg.get('State_Id');
            stateList.add(objState);
        } 
        if(!stateList.isEmpty()){
        update stateList; 
        } */
    }
}