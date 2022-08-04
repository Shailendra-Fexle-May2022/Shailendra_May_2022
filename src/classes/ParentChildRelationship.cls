/*
 *  Purpose          :    This class is showing child to parent and parent to child query.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/17
 *  Revision Logs    :    V_1.0 - Created - 2022/07/17
 */
public with sharing class ParentChildRelationship {

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is showing child to parent and parent to child query for standard object.
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
    }

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is showing parent to child query for standard  and custom object.
    * Params        :    Void
    * Return        :    Void
    */
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

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is showing child to parent  query for standard  and custom object.
    * Params        :    Void
    * Return        :    Void
    */
    public static void childToParentRelationshipQueryForStandardAndCustomObject(){
        //Child to Parent Quiers of relationship,Parent=>Account,Child=>Company
        List<Company__c> companyList = [Select Name,Phone__C,Number_of_Employees__c, Account__r.Name,Account__r.Phone,
                                            Account__r.NumberOfEmployees from Company__c Where Name = 'FEXLE SERVICES PVT.LTD'];
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
    
    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is showing child to parent  query for custom object.
    * Params        :    Void
    * Return        :    Void
    */
    public static void customObjectRelationshipQuery(){
        //Child to Parent Quiers of relationship,Parent=>SoqlQueryTest2,Child=>SoqlQueryTest2
        List<SoqlQueryTest2__c> test2List = [Select Name,Phone__c,SoqlQueryTest1__r.Name,SoqlQueryTest1__r.Phone__c,SoqlQueryTest1__r.MailId__c From SoqlQueryTest2__c];
         if(!test2List.isEmpty()){
             for(SoqlQueryTest2__c soql: test2List){
                System.debug('SoqlQueryTest2__c Details with SoqlQueryTest1__c Details:' + soql);//SoqlQueryTest2__c Details with SoqlQueryTest1__c Details:SoqlQueryTest2__c:{Name=Visnu, Phone__c=12345666, SoqlQueryTest1__c=a0L5i000002qlfyEAA, Id=a0M5i000000GlcwEAC} 
            }
        }
        else{
            System.debug('There is no such type of record available in the list');
        } 
        //Parent to Child Quiers of relationship,Parent=>SoqlQueryTest2,Child=>SoqlQueryTest2
        List<SoqlQueryTest1__c> test1List = [Select Name,Phone__c,MailId__c,(Select Name,Phone__c From SoqlQueriesTest2__r) From SoqlQueryTest1__c];
        if(!test1List.isEmpty()){
             for(SoqlQueryTest1__c soql: test1List){
                System.debug('SoqlQueryTest1__c Details with SoqlQueryTest2__c Details:' + soql);//SoqlQueryTest1__c Details with SoqlQueryTest2__c Details:SoqlQueryTest1__c:{Name=MohanDas, Phone__c=5645634646, MailId__c=mu@gmail.com, Id=a0L5i000002qlfyEAA} 
            }
        }
        else{
            System.debug('There is no such type of record available in the list');
        } 
    }
}