/*
 *  Purpose          :    This class is used to call trigger method.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/22
 *  Revision Logs    :    V_1.0 - Created - 2022/08/14
 */
public with sharing class StateTriggerHelper1 {

    public static Map<Id, Country__c> countryStateMap = new Map<Id, Country__c>();
	
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to increase district and state count on country.
    * Params        :    List<State__c>,Map<Id,State__c>
    * Return        :    Void
    */
    public static void increaseStateDistrictCountOnCountry(List<State__c> newList, Map<Id,State__c> oldMap) {
	
        if(newList != null && oldMap == null){
            for(State__c states: newList){
                if(states.Country__c != null){
                    countryStateMap.put(states.Country__c, new Country__c(Id=states.Country__c, Total_Districts_Trigger_Count__c = 0));   
                    System.debug(countryStateMap); 
                }
            }
        }    
		if(!countryStateMap.isEmpty()){
            updateCountCountry(countryStateMap);
        }     
    }

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to decrease district and state count on country.
    * Params        :    Map<Id,State__c>
    * Return        :    Void
    */
    public static void decreaseStateDistrictCountOnCountry(Map<Id, State__c> oldMap) {

        for(State__c states: oldMap.values()) {  
            System.debug(states); 
            if (oldMap.get(states.Id).Country__c!= null){
                System.debug(countryStateMap);
                countryStateMap.put(oldMap.get(states.Id).Country__c, new Country__c(Id=oldMap.get(states.Id).Country__c, Total_Districts_Trigger_Count__c = 0, Total_States_Trigger_Count__c = 0));
                System.debug(countryStateMap);
            }
        }
		if(!countryStateMap.isEmpty()){
            updateCountCountry(countryStateMap);
		}    
    }
  
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to update district and state count on country.
    * Params        :    List<State__c>,Map<Id,State__c>
    * Return        :    Void
    */
    public static void updateStateDistrictCountOnCountry(List<State__c> newList, Map<Id,State__c> oldMap) {

        for(State__c states: newList){
            if(oldMap.get(states.Id).Country__c != null && states.Country__c != oldMap.get(states.Id).Country__c|| oldMap.get(states.Id).Total_Districts_Count__c != states.Total_Districts_Count__c){
                countryStateMap.put(states.Country__c, new Country__c(Id=states.Country__c, Total_Districts_Trigger_Count__c = 0));
                countryStateMap.put(oldMap.get(states.Id).Country__c, new Country__c(Id=oldMap.get(states.Id).Country__c, Total_Districts_Trigger_Count__c = 0));
                System.debug(countryStateMap);
            }
        }
		if(!countryStateMap.isEmpty()){
            updateCountCountry(countryStateMap);
		}
    }

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to do aggregate query on state.
    * Params        :    Map<Id, Country__c>
    * Return        :    Void
    */
	public static void updateCountCountry(Map<Id, Country__c> countryStateMap){

       /* List<State__c> countryList = [Select Id,Name,Total_Districts_Count__c,(Select Id,Name From Districts__r),
                                            Country__r.Name,Country__r.Total_Districts_Trigger_Count__c,Country__r.Total_States_Trigger_Count__c From State__c where Country__r.Id IN:countryMap.keySet()];
        if(!countryList.isEmpty()){
            for(State__c count:countryList){
                count.Country__r.Total_States_Trigger_Count__c = State__c.size();
				count.Country__r.Total_Districts_Trigger_Count__c = count.Districts__r.size(); 	
            }
            if(!countryList.isEmpty()){
                update countryList;
            }
        }*/

        List<AggregateResult> stateList = [Select Country__c Country_Id,COUNT(Id)TotalStates, SUM(Total_Districts_Count__c)TotalDistricts 
                                                                    From State__c Where Country__r.Id IN : countryStateMap.keySet() Group By Country__c];
        List<Country__c> totalNoOfDistrictsAndStatesOnCountryList = new List<Country__c>();
			for(AggregateResult agg: stateList){
				Country__c objCountry = new Country__c();
                objCountry.Total_Districts_Trigger_Count__c = (Decimal)agg.get('TotalDistricts');
				objCountry.Total_States_Trigger_Count__c = (Integer)agg.get('TotalStates');
                objCountry.Id = (Id)agg.get('Country_Id');
                totalNoOfDistrictsAndStatesOnCountryList.add(objCountry);
            }   
            if(!totalNoOfDistrictsAndStatesOnCountryList.isEmpty()){
                update totalNoOfDistrictsAndStatesOnCountryList; 
            } 
	    new CountryMap();
            CountryMap.countryWrapperMethod('India');
    }
}
