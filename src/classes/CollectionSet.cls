/**
 *  Purpose         :    This class is used to how to initialize and assign value to SetCollection
 *  Created By      :    Shailendra Sharma
 *  Created Date    :    2022/06/26
 *  Revision Logs   :    V_1.0 - Created - 2022/06/26
 **/
public with sharing class CollectionSet {
     /**
      * Created By    :    Shailendra Sharma
      * Purpose       :    This method is used to show the different method of SetCollection
      * Params        :    List<Integer>,Set<String>,Set<Integer>
      * Return        :    Void
      **/
    public static void setMethod(){
        // Creating and Initialization an Integer Set
        Set<Integer> s = new Set<Integer>();
        
        // Adding value to the Set
         s.add(2);
         s.add(5);
         s.add(9);
         s.add(2); //Duplicate Value
        System.debug(s);  // {2, 5, 9}
        
        // Initialization and assiging the value together
        Set<Integer> s1 = new Set<Integer>{3,4,7,8};
        System.debug(s1); // {3, 4, 7, 8}
        
        // Creating and Initialization an String Set
        Set<String> s2 = new Set<String>{'My','Name','Is', 'Shailendra'};
        System.debug(s2);   // {Is, My, Name, Shailendra} automatically sorted Set
       
        // Methods Of Set
        List<Integer> l = new List<Integer>{6,10,11,12};
        s.addAll(l);
        System.debug(s); //{2, 5, 6, 9, 10, 11, 12} automatically sorted in Set
        System.debug(s.size()); // 7
        System.debug(s.contains(12)); // True
        System.debug(s.contains(20)); // Flase
        System.debug(s.containsAll(l)); // True
        System.debug(s.retainAll(l)); // True (Contain only list values,discard other values)
        System.debug(s); //{6, 10, 11, 12}
        System.debug(s.remove(10)); // True, Remove the value from the Set
        System.debug(s);//{6, 11, 12}
        Set<Integer> s3 = s.clone();
        System.debug(s3); //{6, 11, 12}
        s.removeAll(l); // remove all list values
        System.debug(s); // {empty}
        System.debug(s.isEmpty()); //True
        
       // The set elements in strSet1 are copied from strSet
        Set<String> strSet = new Set<String>();
	strSet.add('item1');
	strSet.add('item2');
        System.debug(strSet);
	Set<String> strSet1 = new Set<String>(strSet);
        System.debug(strSet1);//{'item1''item2'}
        Set<String> strSet2 = new Set<String>{'Jaipur','Ajmer'};
        System.debug(strSet2.remove('udaipur')); // flase
        System.debug(strSet2.remove('Jaipur')); // true
        Set<String> myString = new Set<String>{'a','d'};
	Set<String> sString = new Set<String>{'c'};
	Set<String> rString = new Set<String>{'a', 'b', 'c'};
        Boolean result1;
        Boolean result2;
        result1 = myString.addAll(sString);
        result2 = myString.containsAll(rString);
        System.debug(result1);  //true
        System.debug(result2); // flase (all the elements of one Set must be inside other Set)
        System.debug(myString.equals(rString));   // flase (all the elements must be same)
    }
}
