/*
 *  Purpose          :    This class is used to call trigger method.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/22
 *  Revision Logs    :    V_1.0 - Created - 2022/07/22
 */
public with sharing class BankTriggerHandler {

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to send email notification.
    * Params        :    List<Bank__c>
    * Return        :    Void
    */
    public static void sendEmailNotification(List<Bank__c> bank){
        List<Messaging.Email> emailList = new List<Messaging.Email>();
        for(Bank__c b:bank){
            if(b.Email__c != null){
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                String[] toaddress = new String[]{b.Email__c};
                    emailMsg.setToAddresses(toaddress);
                	String emailSub = 'Welcome' + b.Name; 
                	emailMsg.setSubject(emailSub);
                	String disName = 'Axis Bank';
                	emailMsg.setSenderDisplayName(disName);
                	String content = 'Hi '+' '+ b.Name + ',<br/><br/>'+ 'Congratulation <br/><br/>'+
                        'You acccount has been successfully created <br/><br/>'+
                        'Your Phone Number :: '+b.Phone__c +' <br/><br/>'+
                        'Your Account No :: '+b.Account_Number__c +' <br/><br/>'+ 
                        'Type of Account ::'+b.Account_Type__c  +'<br/><br/>'+
                        'Thank You!<br/><br/>';
                	emailMsg.setHtmlBody(content);
                	emailList.add(emailMsg);             
            }
        }
        Messaging.sendEmail(emailList); 
    }

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to send email  updated data notification.
    * Params        :    List<Bank__c>
    * Return        :    Void
    */
     public static void sendEmailUpdateNotification(List<Bank__c> bank){
        List<Messaging.Email> emailList = new List<Messaging.Email>();
        for(Bank__c b:bank){
            if(b.Email__c != null){
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                String[] toaddress = new String[]{b.Email__c};
                    emailMsg.setToAddresses(toaddress);
                	String emailSub = 'Welcome' + b.Name; 
                	emailMsg.setSubject(emailSub);
                	String disName = 'Axis Bank';
                	emailMsg.setSenderDisplayName(disName);
                	String content = 'Hi '+' '+ b.Name + ',<br/><br/>'+ 'Congratulation <br/><br/>'+
                        'You Phone Number has been successfully updated <br/><br/>'+
                        'Your Phone Number :: '+b.Phone__c +' <br/><br/>'+
                        'Thank You!<br/><br/>';
                	emailMsg.setHtmlBody(content);
                	emailList.add(emailMsg);             
            }
        }
        Messaging.sendEmail(emailList); 
    }
}