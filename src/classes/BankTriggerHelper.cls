/*
 *  Purpose          :    This class is used to call trigger method.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/07/22
 *  Revision Logs    :    V_1.0 - Created - 2022/07/22
 */
public with sharing class BankTriggerHelper {

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to insert account number with account type prefix.
    * Params        :    List<Bank__c>
    * Return        :    Void
    */
    public static void insertPrefixInAccountNumber(List<Bank__c> nameList){
        for(Bank__c b:nameList){
            if(b.Account_Number__c == null){
                Integer accNumber = Integer.valueOf(1000000000 * Math.random());
                b.Account_Number__c = String.valueOf(accNumber);
            }
            if(b.Account_Number__c != null){
                if(b.Account_Type__c == 'Saving Account'){
                    b.Account_Number__c = 'SV' +'-'+ b.Account_Number__c;
                } 
                else if(b.Account_Type__c == 'Fixed Deposit'){
                    	b.Account_Number__c = 'FD' +'-'+ b.Account_Number__c;
                }else
                    b.addError('Type of account is required');
            }
        } 
    }

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to give an error meggage whenever someone wants to modify account number.
    * Params        :    List<Bank__c>
    * Return        :    Void
    */
    public static void updateAccountNumberMethod(List<Bank__c> nameList,Map<Id,Bank__c> oldAccountNo){
        for(Bank__c b:nameList){
            if(b.Account_Number__c != oldAccountNo.get(b.Id).Account_Number__c){
                    b.addError('Account Number can not be modify');
            }
        }
    }

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to send email notification.
    * Params        :    List<Bank__c>
    * Return        :    Void
    */
    public static void sendEmailNotification(List<Bank__c> bank){
    List<Messaging.Email> emailList = new List<Messaging.Email>();
        for(Bank__c b:bank){
             if(b.Email__c == null){
                b.Email__c.addError('Email should mot be blank.');
            }
            else if(b.Email__c != null){
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
    * Purpose       :    This method is used to send updated data notification email .
    * Params        :    List<Bank__c>
    * Return        :    Void
    */
    public static void sendEmailUpdateNotification(List<Bank__c> bank, Map<Id,Bank__c> oldPhoneNo){
    List<Messaging.Email> emailList = new List<Messaging.Email>();
        for(Bank__c b:bank){
             if(oldPhoneNo != null && b.Phone__c != oldPhoneNo.get(b.Id).Phone__c && b.Phone__c != null){
                if(b.Email__c == null){
                b.Email__c.addError('Email should not be blank.');
            	}
            	else if(b.Email__c != null){
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
        }
         Messaging.sendEmail(emailList); 
    }
}
