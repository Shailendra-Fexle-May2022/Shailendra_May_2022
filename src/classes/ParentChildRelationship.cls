/*
 *  Purpose          :    This class is show child to parent and parent to child query.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/11
 *  Revision Logs    :    V_1.0 - Created - 2022/07/11
 */
public with sharing class ParentChildRelationship {
    
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is showing child to parent and parent to child query.
    * Params        :    Void
    * Return        :    Void
    */
    public static void parentChildRelationshipQueryForStandardObject(){

        //Parent to Child Quiers of relationship,Parent=>Account,Child=>Contact
        List<Account> accList  = [Select Name, (Select Name from Contacts) from Account Where Name = 'Jackson Account'];
        if(!accList.isEmpty()){
             for(Account act : accList ){
            System.debug('Name:'+ act);//Name:Account:{Name=Jackson Account, Id=0015i00000JCE0MAAX},            							//Name:Account:{Name=Jackson Account, Id=0015i00000JCDzdAAH}
            }  
        }
        else{
            System.debug('There is no such type of record available in the list');
        }
            

        //Child to Parent Quiers of relationship,Parent=>Account,Child=>Contact
        List<Contact> conList = [Select FirstName, LastName, Account.Name,
                                        Account.Industry from Contact Limit 2 ];
        if(!conList.isEmpty()){
             for(Contact con : conList){
             System.debug('Account Name:' + con);//Account Name:Contact:{FirstName=Manish, LastName=Sharma, Id=0035i000008opTKAAY},|Account Name:Contact:{FirstName=Joe, LastName=Smith, AccountId=0015i00000JCE0MAAX, Id=0035i000008oodxAAA}
            System.debug('Account Name:' + con.Account.Name);//Account Name:null,Account Name:Jackson Account
            System.debug('Industry:' + con.Account.Industry);//Industry:null,Industry:null
        }   
        }
        else{
            System.debug('There is no such type of record available in the list');
        }        
           
        // Parent to child
        //Select Name,Phone__c,(Select Name,Phone from Contacts__r) from School__c
        //Select Name,Phone,NumberOfEmployees,(Select Name,Phone__C,Number_of_Employees__c from Companies__r) from Account Where Name = 'SahilFexle'
          // Child to Parent
                                               
    }
    public static void parentToChildRelationshipQueryForStandardAndCustomObject(){
         //Parent to Child Quiers of relationship,Parent=>School,Child=>Contact
         List<School__c> schoolList = [Select Name,Phone__c,(Select Name,Phone from Contacts__r) from School__c];
        if(!schoolList.isEmpty()){
             for(School__c school: schoolList){
              System.debug('School Details with Contact Details:' + school);//School Details with Contact Details::School__c:{Name=MYOWN SCHOOL, Phone__c=01413269915, Id=a0J5i000005QFOjEAO},School Details with Contact Details:School__c:{Name=SMS SCHOOL, Phone__c=O14165587, Id=a0J5i000005QIsyEAG}  
             }   
        }
        else{
            System.debug('There is no such type of record available in the list');
        }
        
        //Parent to Child Quiers of relationship,Parent=>Account,Child=>Company
        List<Account> accList =[Select Name,Phone,NumberOfEmployees,(Select Name,Phone__C,Number_of_Employees__c from Companies__r)
                                from Account Where Name = 'AnkurFexle'];
        if(!accList.isEmpty()){
             for(Account acc: accList){
          		System.debug('Account Details with Company Details:' + acc);////Account Details with Company Details:Account:{Name=AnkurFexle, Phone=9982876350, NumberOfEmployees=150, Id=0015i00000JCEtpAAH}   
        	}
        }
        else{
            System.debug('There is no such type of record available in the list');
        }
        
    
    }
    public static void childToParentRelationshipQueryForStandardAndCustomObject(){
      //Child to Parent Quiers of relationship,Parent=>Account,Child=>Company
      List<Company__c> companyList = [Select Name,Phone__C,Number_of_Employees__c, Account__r.Name,Account__r.Phone,Account__r.NumberOfEmployees from Company__c Where Name = 'FEXLE SERVICES PVT.LTD'];
        if(!companyList.isEmpty()){
             for(Company__c company: companyList){
              System.debug('Company Details with Account Details:' + company);//Company Details with Account Details:Company__c:{Name=FEXLE SERVICES PVT.LTD, Phone__c=2334546366, Number_of_Employees__c=250, Account__c=0015i00000JCDzdAAH, Id=a0K5i0000025uNvEAI}   
            }
        }
        else{
            System.debug('There is no such type of record available in the list');
        }
        
       //Child to Parent Quiers of relationship,Parent=>School,Child=>Contact  
        
     List<Contact> conList = [Select Name,Phone,School__r.Name,School__r.Phone__c from Contact Where Name = 'Shailendra Sharma'];
        if(!conList.isEmpty()){
             for(Contact contact: conList){
          System.debug('Contact Details with School Details:' + contact);//Company Details with Account Details:Contact Details with School Details:Contact:{Name=Shailendra Sharma, School__c=a0J5i000005QIsyEAG, Id=0035i000006djGeAAI} 
        }
        }
        else{
            System.debug('There is no such type of record available in the list');
        }
        
    }  
}