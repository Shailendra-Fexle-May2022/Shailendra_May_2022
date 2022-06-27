/**
 *  Purpose         :    This class is used to how to initialize and assign value to MapCollection
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/06/26
 *  Revision Logs   :    V_1.0 - Created - 2022/06/26
 **/
public with sharing class CollectionMap {   
    /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to show the different method of MapCollection
      * Params        :    List<Account>,List<String>,Map<Integer,String>,Map<Id, Account>, Map<Integer, Account>
      * Return        :    Void
      **/
    public static void mapMethods(){
        // Creating and Initialization of Map
    	Map<Integer,String> mMap = new Map<Integer,String>();

        // Adding value to Map
         mMap.put(11,'Rohan');
         mMap.put(12,'Sahil');
         mMap.put(13, 'Kamlesh');
         System.debug(mMap);  //{11=Rohan, 12=Sahil, 13=Kamlesh}
         mMap.put(11,'Akash');
         System.debug(mMap); // {11=Akash, 12=Sahil, 13=Kamlesh}
         
         // Initialization and assiging the value together
         Map<Integer,String> myMap = new Map<Integer,String>{14 => 'Mohan', 15 => 'Muskan'};
         System.debug(myMap);  //{14=Mohan, 15=Muskan}
         
         // Methods Of Map
         mMap.putAll(myMap);
         System.debug(mMap); //{11=Akash, 12=Sahil, 13=Kamlesh, 14=Mohan, 15=Muskan}
         System.debug(mMap.get(11)); //Akash
         System.debug(mMap.get(14)); //Mohan
         Map<Integer,String> mMap1 = mMap.clone();
         System.debug(mMap1); //{11=Akash, 12=Sahil, 13=Kamlesh, 14=Mohan, 15=Muskan}
         List<String> s = new List<String>();
         s = mMap.values();
         System.debug(s); //(Akash, Sahil, Kamlesh, Mohan, Muskan)
         System.debug(mMap.keySet()); //{11, 12, 13, 14, 15}
         System.debug(mMap.containskey(4)); // flase
         System.debug(mMap.size()); // 5
         System.debug(mMap.isEmpty()); // flase
         mMap.remove(12); // remove the element at 12
         System.debug(mMap); //{11=Akash, 13=Kamlesh, 14=Mohan, 15=Muskan}
         System.debug(mMap.equals(mMap1)); // flase
         System.debug(mMap.isEmpty()); // flase
         
         List<Account> acc = [select Id,Name from Account];
         Map<Id, Account> accMap = new Map<Id, Account>(acc);
         System.debug(accMap);
         Account a = new Account( Name='Acme', BillingCity='New York');
         Map<Integer, Account> map1 = new Map<Integer, Account>();
         map1.put(1,a);
         System.debug(map1); //{1=Account:{Name=Acme, BillingCity=New York}}
         map1.get(1).BillingCity= 'San Francisco';
         System.debug(map1); //{1=Account:{Name=Acme, BillingCity=San Francisco}}
    }
}