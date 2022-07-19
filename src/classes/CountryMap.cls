public with sharing class CountryMap {
    static Map<String,Map<String, List<String>>> countryWithCountryNameMap = new Map<String,Map<String, List<String>>>();
	List<Country__c> countryList = new List<Country__c>();
    public void CountryMap(String firstLetter,Integer districtLength){
        // Filling the map 
        List<District__c> districtNameList =[Select Name, State__r.Name, State__r.Country__r.Name From District__c];
        List<State__c> stateNameList = [Select Name, Country__r.Name From State__c];
        List<Country__c> countryNameList = [Select Name From Country__c];
        Map<String, List<String>> stateNameWithCountryMap = new  Map<String, List<String>>();
        for(Country__c cont:countryNameList){
            List<String> nameofState = new List<String>();
            for(State__c states : stateNameList ){
                if(states.Country__r.Name== cont.Name){
                    nameofState.add(states.Name); 
                    // System.debug(nameofState);
                    if(!stateNameWithCountryMap.containskey(cont.Name)){
                        stateNameWithCountryMap.put(cont.Name,nameofState);  
                    } 
                else{
                     stateNameWithCountryMap.values().add(nameofState);
                }
              }
            }     
        }
        //System.debug('Map of Country with States::'+ stateNameWithCountryMap);
                
        Map<String,List<String>> districtNameWithStateList = new Map<String,List<String>>();
        for(State__c states :stateNameList ){
            // System.debug(states);
            List<String> nameOfDistrict = new List<String>();
            for(District__c districts:districtNameList){
                if(districts.State__r.Name == states.Name){
                    nameOfDistrict.add(districts.Name);
                    if(!districtNameWithStateList.containsKey(states.Name)){
                        districtNameWithStateList.put(states.Name,nameOfDistrict);        
                        }
                     else{
                       districtNameWithStateList.values().add(nameOfDistrict);
                    }
                }
            }
        }
       // System.debug('Map of States with Diatricts::'+districtNameWithStateList);
        
        for(String countryName :stateNameWithCountryMap.keySet()){
            // System.debug(countryName);
             if(!countryWithCountryNameMap.containsKey(countryName)){
                countryWithCountryNameMap.put(countryName, new Map<String, List<String>>());
              //  System.debug(countryWithCountryNameMap);
                 if(countryWithCountryNameMap.containsKey(countryName)){
                    // System.debug(countryWithCountryNameMap);
                     for(String stateName:stateNameWithCountryMap.get(countryName)){ 
                        //System.debug(stateName); 
                       countryWithCountryNameMap.get(countryName).put(stateName,new List<String>());
                        //System.debug(countryWithCountryNameMap);
                         for(String districtName:districtNameWithStateList.get(stateName)){
                              List<String> districtList = new List<String>();
                         if(countryWithCountryNameMap.get(countryName).containsKey(stateName)){
                             districtList.add(districtName);
                             countryWithCountryNameMap.get(countryName).get(stateName).addAll(districtList);
                         }  
                             
                        }
                           
                     }
                 }
             }
         }
        // System.debug('Map of Country::'+countryWithCountryNameMap); 

        // Find the combination of Country, State,and District by passing the staring alphabet in constructor.
        try{
        List<String> districtStateCountryNameList = new List<String>();
        for(District__c dis:[Select Name,State__r.Name, State__r.Country__r.Name from District__c 
                            where Name LIKE: firstLetter+'%' and State__r.Name LIKE: firstLetter+'%' 
                            and State__r.Country__r.Name LIKE: firstLetter+'%']){
            districtStateCountryNameList.add(dis.State__r.Country__r.Name);
            districtStateCountryNameList.add(dis.State__r.Name);
            districtStateCountryNameList.add(dis.Name);
            //System.debug(districtStateCountryNameList);                   
            System.debug('Name of Country ,State,District start with passing alpahbat::'+districtStateCountryNameList);                      
        } 
        }Catch(Exception error)
            {
            System.debug('There is no such type of country satrt with::'+firstLetter);
            }
    
        // Find the name of district which have length by using passing integer in constructor
        List<String> allDistrictNameList = new List<String>();
        for(District__c districtNameOnly :[Select Name from District__c]){
            if(districtNameOnly.Name.length()>=districtLength){
                allDistrictNameList.add(districtNameOnly.Name);
            }
        }
        System.debug('Names of districts whose length is passed in contructor::'+allDistrictNameList); 

        //Filling of number of districts in state object
        List<AggregateResult> districtResult = [Select State__c State_Id, COUNT(Id)TotalDistricts From District__c Group By State__c];
            List<State__c> totalNoOfDistrictsList = new List<State__c>();
            for(AggregateResult agg: districtResult){
                State__c objState = new State__c();
                objState.Total_Districts__c = (Integer)agg.get('TotalDistricts');
                objState.Id = (Id)agg.get('State_Id');
                
               // objState.Total_Districts__c = totalDistricts;
                //objState.Id = stateId ;
                totalNoOfDistrictsList.add(objState);
            }   
            if(!totalNoOfDistrictsList.isEmpty()){
               update totalNoOfDistrictsList; 
            }

        //Filling of number of districts and states in country object
        List<AggregateResult> stateResult = [Select Country__c Country_Id,COUNT(Id)TotalStates, SUM(Total_Districts__c)TotalDistricts From State__c Group By Country__c];
            List<Country__c> totalNoOfDistrictsAndStatesList = new List<Country__c>();
			for(AggregateResult agg: stateResult){
				Country__c objCountry = new Country__c();
                objCountry.Total_Districts__c = (Decimal)agg.get('TotalDistricts');
				objCountry.Total_States__c = (Integer)agg.get('TotalStates');
                objCountry.Id = (Id)agg.get('Country_Id');
                
                // objState.Total_Districts__c = totalDistrict;
                // objState.Id = stateId ;
                totalNoOfDistrictsAndStatesList.add(objCountry);
            }   
            if(!totalNoOfDistrictsAndStatesList.isEmpty()){
                update totalNoOfDistrictsAndStatesList; 
            }
    }  
     // Wrapper Classes         
    public class Country{
        public String countryName{get; set;}
        public List<States> states{get; set;}
        public Integer Total_Number_Of_States{get; set;}
        public Integer Total_Number_Of_Districts{get; set;}
    }    
    public class States{
        Public List<Districts> districts{get; set;}
        Public string stateName{get; set;}
    }
    public class Districts {
        Public String districtName{get; set;}
    }
    public static void countryWraperMethod(String nameOfCountry){
        Country objCountry = new Country();
        objCountry.countryName = nameOfCountry;
        List<AggregateResult> stateResult = [Select COUNT(Name)TotalStates From State__c Where Country__r.Name =: nameOfCountry Group By Country__r.Name];
        objCountry.Total_Number_Of_States = (Integer)stateResult[0].get('TotalStates');
        List<AggregateResult> districtResult = [Select COUNT(Id)TotalDistricts From District__c Where State__r.Country__r.Name =: nameOfCountry Group By State__r.Country__r.Name];
        objCountry.Total_Number_Of_Districts = (Integer)districtResult[0].get('TotalDistricts');
        List<States> statesList = new List<States>();
        // System.debug(objCountry);
        for(String state :countryWithCountryNameMap.get(nameOfCountry).keySet()){
                States objState = new States();
                objState.stateName = state;
                statesList.add(objState);
                //System.debug(statesList);
                List<Districts> districtsList = new List<Districts>();
                for(String nameOfDistrict:countryWithCountryNameMap.get(nameOfCountry).get(state)){
                        Districts objDistricts = new Districts();
                        objDistricts.districtName = nameOfDistrict;
                        districtsList.add(objDistricts);
            }
                objState.districts = districtsList;
               // System.debug(objState); 
        }
        objCountry.states = statesList ;
        System.debug('Wrapper Country Class'+objCountry);
        String jsonFormat = Json.serialize(objCountry);
        System.debug('Jason format of Country Map::'+jsonFormat);
       Country__c contObj =[Select Name,Hieararchy__c From Country__c Where Name =:nameOfCountry];
       contObj.Hieararchy__c= jsonFormat;
       update contObj;
    }   
}