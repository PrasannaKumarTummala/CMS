@isTest
private class MainControllerTest {
    static testMethod void student()
    {
        Test.StartTest();
        PageReference pageRef = Page.studentvf; // Add your VF page Name here
        Test.setCurrentPage(pageRef);
        MainController mc = new MainController();
        mc.student();
        Test.StopTest();
    }
    static testMethod void staff()
    {
        Test.StartTest();
        PageReference pageRef = Page.staffvf; // Add your VF page Name here
        Test.setCurrentPage(pageRef);
        MainController mc = new MainController();
        mc.staff();
        Test.StopTest();
    }
    static testMethod void notice()
    {
        Test.StartTest();
        PageReference pageRef = Page.noticesvf; // Add your VF page Name here
        Test.setCurrentPage(pageRef);
        MainController mc = new MainController();
        mc.notice();
        Test.StopTest();
    }
    static testMethod void inquiry()
    {
        Test.StartTest();
        PageReference pageRef3 = Page.inquiryvf; // Add your VF page Name here
        Test.setCurrentPage(pageRef3);
        MainController mc = new MainController();
        mc.inquiry();
        Test.StopTest();
    }
     static testMethod void home()
    {
        Test.StartTest();
        PageReference pageRef4 = Page.homepagevf; // Add your VF page Name here
        Test.setCurrentPage(pageRef4);
        MainController mc = new MainController();
        mc.home();
        Test.StopTest();
    }
}