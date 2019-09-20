public class InquiryController {
    public id inquiryid {set; get;}
    public string inquirymail {set; get;} 
    public String subject {set;get;}
    public String body {set;get;} 
    public boolean flag {set;get;}
    public boolean ans {set;get;}
    public boolean flag1 {set;get;}
    public boolean flag2 {set;get;}
    public list<Student_Inquiry_Form__c> record {set;get;}  
    public list<Student_Inquiry_Form__c> recorddetail {set;get;}
    public InquiryController()
    {
        flag=false;
        flag1=false;
        flag2=false;
        record=[select id,name,email__c,Student_Name__c,answered__c from Student_Inquiry_Form__c];
        
    }
    public void reply(){ 
        
        if(ans==true)
        {
            
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.WARNING,'the query has been already answered'));
            system.debug(ans);
        } 
        else
        {
            flag=true;
            flag1=false;
            flag2=false;
        }
    }
    public void Queryinfo(){
        flag=false;
        flag1=false;
        flag2=true;
        recorddetail=[select name,email__c,Student_Name__c,Query__c,Contact_No__c,Answered__c from Student_Inquiry_Form__c where id=:inquiryid];
        system.debug(recorddetail);
    }
    
    public pagereference newinquiry()
    {
        pagereference pf=new pagereference('/a06/e?retURL=%2Fa06%2Fo');
        return pf;
    }
    
    public pagereference SendEmailresponse() //method will be called whenever send email button is clicked
    { 
        flag1=true;
        flag=false;
        flag2=false;
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject(subject);
        email.setToAddresses( new String[] {inquirymail} );//response will be sent to student email
        email.setPlainTextBody( body );        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});        
        system.debug(ans); 
        return null;
    }
    
}