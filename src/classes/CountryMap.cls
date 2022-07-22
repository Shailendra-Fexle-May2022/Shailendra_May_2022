/*
 *  Purpose          :    This class is filling the Map dynamically.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/7/17
 *  Revision Logs    :    V_1.0 - Created -  2022/7/17
 */
public with sharing class CountryMap {
    static Map<String,Map<String, List<String>>> mapOfCountryWithStateNameAndDistrictName = new Map<String,Map<String, List<String>>>();

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This constructor is used to fill the Map and 
                         show the combination of Country, State,and District with passing alphabet in constructor.
    * Argument      :    String, Integer
    * Return        :    Void   
    */
    public void CountryMap(String firstLetter,Integer districtWordLength){ // ('U',10)
        // Filling the map 
        List<District__c> districtNameList =[Select Name, State__r.Name, State__r.Country__r.Name From District__c];
        List<State__c> stateNameList = [Select Name, Country__r.Name From State__c];
        List<Country__c> countryNameList = [Select Name From Country__c];
        Map<String, List<String>> CountryWithStateNameMap = new  Map<String, List<String>>();
        for(Country__c cont:countryNameList){
            List<String> nameofState = new List<String>();
            for(State__c states : stateNameList ){ 
                if(states.Country__r.Name== cont.Name){
                    nameofState.add(states.Name); 
                    if(!CountryWithStateNameMap.containskey(cont.Name)){
                        CountryWithStateNameMap.put(cont.Name,nameofState);  
                    }
                } 
                else{
                     CountryWithStateNameMap.values().add(nameofState);
                }
            }     
        }
        System.debug('Map of Country with States::'+ CountryWithStateNameMap);
        //Map of Country with States::{China=(Shanghai, Beijing), India=(Bihar, Assam, Rajasthan, Gujarat), Russia=(Adygea', Chechnya), US=(Washington, Utah, NewYork)}        
        Map<String,List<String>> StateWithDistrictNameMap = new Map<String,List<String>>();
        for(State__c states :stateNameList ){
            List<String> nameOfDistrict = new List<String>();
            for(District__c districts:districtNameList){
                if(districts.State__r.Name == states.Name){
                    nameOfDistrict.add(districts.Name);
                    if(!StateWithDistrictNameMap.containsKey(states.Name)){
                        StateWithDistrictNameMap.put(states.Name,nameOfDistrict);        
                        }
                    else{
                       StateWithDistrictNameMap.values().add(nameOfDistrict);
                    }
                }
            }
        }
       
        for(String countryName :CountryWithStateNameMap.keySet()){
             if(!mapOfCountryWithStateNameAndDistrictName.containsKey(countryName)){
                mapOfCountryWithStateNameAndDistrictName.put(countryName, new Map<String, List<String>>());
                 if(mapOfCountryWithStateNameAndDistrictName.containsKey(countryName)){
                     for(String stateName:CountryWithStateNameMap.get(countryName)){  
                       mapOfCountryWithStateNameAndDistrictName.get(countryName).put(stateName,new List<String>());
                         for(String districtName:StateWithDistrictNameMap.get(stateName)){
                              List<String> districtList = new List<String>();
                            if(mapOfCountryWithStateNameAndDistrictName.get(countryName).containsKey(stateName)){
                                districtList.add(districtName);
                                mapOfCountryWithStateNameAndDistrictName.get(countryName).get(stateName).addAll(districtList);
                            }        
                        }    
                    }
                }
            }
        }
        // Find the combination of Country, State,and District by passing the staring alphabet in constructor.
        try{
            List<String> districtStateCountryNameList = new List<String>();
            for(District__c dis:[SELECT Name,State__r.Name, State__r.Country__r.Name from District__c 
                                WHERE Name LIKE: firstLetter+'%' AND State__r.Name LIKE: firstLetter+'%' 
                                AND State__r.Country__r.Name LIKE: firstLetter+'%']){
                districtStateCountryNameList.add(dis.State__r.Country__r.Name);
                districtStateCountryNameList.add(dis.State__r.Name);
                districtStateCountryNameList.add(dis.Name);
                //System.debug(districtStateCountryNameList);                   
                System.debug('Name of Country ,State, District start with passing alpahbat in constructor::'+districtStateCountryNameList);
               //Name of Country ,State, District start with passing alpahbat in constructor::(US, Utah, Uinta)
            } 
            }Catch(QueryException error)
                {
                System.debug('There is no such type of country satrt with::'+ error.getMessage());
                }
        
            // Find the name of district which have length by using passing integer in constructor
            List<String> allDistrictNameList = new List<String>();
            for(District__c districtNameOnly :[Select Name from District__c]){
                if(districtNameOnly.Name.length()>=districtWordLength){
                    allDistrictNameList.add(districtNameOnly.Name);
                }
            }
            System.debug('Names of districts whose length is passed in contructor::'+allDistrictNameList); 
        //Names of districts whose length is passed in contructor::(Aurangabad, Shovgenovsky)

        //Filling of number of districts in state object
        List<AggregateResult> districtResult = [Select State__c State_Id, COUNT(Id)TotalDistricts From District__c Group By State__c];
            List<State__c> totalNoOfDistrictsList = new List<State__c>();
            for(AggregateResult agg: districtResult){
                State__c objState = new State__c();
                objState.Total_Districts__c = (Integer)agg.get('TotalDistricts');
                objState.Id = (Id)agg.get('State_Id');
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

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method used to call wrapper class variable and show JSON data fromat.
    * Argument      :    String
    * Return        :    Void
    */
    public static void wraperJsonMethod(String nameOfCountry){
        Country objCountry = new Country();
        objCountry.countryName = nameOfCountry;
        List<AggregateResult> stateResult = [Select COUNT(Name)TotalStates From State__c Where Country__r.Name =: nameOfCountry Group By Country__r.Name];
        objCountry.Total_Number_Of_States = (Integer)stateResult[0].get('TotalStates');
        List<AggregateResult> districtResult = [Select COUNT(Id)TotalDistricts From District__c Where State__r.Country__r.Name =: nameOfCountry Group By State__r.Country__r.Name];
        objCountry.Total_Number_Of_Districts = (Integer)districtResult[0].get('TotalDistricts');
        List<States> statesList = new List<States>();
        for(String state :mapOfCountryWithStateNameAndDistrictName.get(nameOfCountry).keySet()){
                States objState = new States();
                objstate.stateName = state;
                statesList.add(objState);
                List<Districts> districtsList = new List<Districts>();
                for(String nameOfDistrict:mapOfCountryWithStateNameAndDistrictName.get(nameOfCountry).get(state)){
                        Districts objDistricts = new Districts();
                        objDistricts.districtName = nameOfDistrict;
                        districtsList.add(objDistricts);
            }
                objstate.districts = districtsList; 
        }
        objCountry.states = statesList ;
        String jsonFormat = Json.serialize(objCountry);
        System.debug('Jason format of Country Map::'+jsonFormat); 
        Country__c contObj =[Select Name,Hieararchy__c From Country__c Where Name =:nameOfCountry];
        contObj.Hieararchy__c= jsonFormat;
        update contObj;     
    }   
}