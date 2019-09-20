@isTest
private class NoticeControllerTest{
    @testsetup static void sampledata()
    {
        notice__c n=new notice__c(name='sample');
        insert n;
    }
static testMethod void createnotice()
    {
        Test.StartTest();
        PageReference pageRef =new pagereference('/a04/e?retURL=%2Fa04%2Fo'); // Add your VF page Name here
        Test.setCurrentPage(pageRef);
        NoticeController nc = new NoticeController();
        nc.createnotice();
        Test.StopTest();
    }
    static testMethod void Queryinfo()
    {
        notice__c noti=[select id from notice__c];        
        Test.StartTest();        
        NoticeController nc = new NoticeController();
        nc.noticeid=noti.Id;
        nc.Queryinfo();
        notice__c no=[select name from notice__c where id=:nc.noticeid];
        system.assertEquals(no.Id, nc.noticeid);
        Test.StopTest();
    }
    
}