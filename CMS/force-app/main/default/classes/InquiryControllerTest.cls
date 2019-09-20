@isTest
private class InquiryControllerTest {
    @testsetup static void sampledata()
    {
        Student_Inquiry_Form__c i=new Student_Inquiry_Form__c(name='sample',Answered__c=true,email__c='sample@gmail.com',contact_no__c='1133225544');
        insert i;
    }
    static testMethod void reply()//if condition
    {
        Test.StartTest();
        InquiryController ic = new InquiryController();
        ic.reply();
        Test.StopTest();
    }
    static testMethod void reply1()// else condition
    {
        Test.StartTest();
        Student_Inquiry_Form__c sif=[select Answered__c from Student_Inquiry_Form__c ];
        InquiryController ic = new InquiryController();
        ic.ans=sif.Answered__c;
        ic.reply();
        Test.StopTest();
    }
    static testMethod void Queryinfo()
    {
        Student_Inquiry_Form__c samp=[select id from Student_Inquiry_Form__c];        
        Test.StartTest();        
        InquiryController si = new InquiryController();
        si.inquiryid=samp.id;
        si.Queryinfo();
        Student_Inquiry_Form__c sif=[select name from Student_Inquiry_Form__c where id=:si.inquiryid];
        system.assertEquals(sif.Id, si.inquiryid);
        Test.StopTest();
    }
    static testMethod void newinquiry()
    {
        Test.StartTest();
        pagereference pageRef=new pagereference('/a06/e?retURL=%2Fa06%2Fo'); // Add your VF page Name here
        Test.setCurrentPage(pageRef);
        InquiryController ic = new InquiryController();
        ic.newinquiry();
        Test.StopTest();
    }
    static testMethod void SendEmailresponse() 
    {
        Test.StartTest();
        Student_Inquiry_Form__c ssi=[select id,email__c from Student_Inquiry_Form__c];
        InquiryController ic = new InquiryController();
        ic.inquirymail=ssi.Email__c;
        ic.subject='hello';
        ic.body='test';
        ic.SendEmailresponse();
        Test.StopTest();
    }
       
    
}