@isTest
private class StudentControllerTest {
    @testsetup static void sampledata()
    {
        student__c st =new student__c(name='prasanna',course_type__c='B.Tech',pursuing_year__c='I',Mobile_no__c='9988774455',email__c='prasannana@gmail.com',Father_s_Name__c='nmae',
                                      Father_s_Phone_no__c='2255886644',Intermediate_Percentage__c=88,School_Percentage__c=78);
        insert st;
    }
    static testMethod void newstudent()
    {
        student__c s=new student__c();
        Test.StartTest();        
        ApexPages.StandardController sc = new ApexPages.StandardController(s);
        Studentcontroller ic = new Studentcontroller(sc);
        ic.newstudent();
        Test.StopTest();
    }
    static testMethod void clearresult()
    {
        student__c s=new student__c();
        Test.StartTest();        
        ApexPages.StandardController sc = new ApexPages.StandardController(s);
        Studentcontroller ic = new Studentcontroller(sc);
        ic.clearresult();
        Test.StopTest();
    }
    static testMethod void spin()
    {
        student__c s=new student__c();
        Test.StartTest();        
        ApexPages.StandardController sc = new ApexPages.StandardController(s);
        Studentcontroller ic = new Studentcontroller(sc);
        ic.spin();
        Test.StopTest();
    }
    static testMethod void saveme()
    {
        student__c s=new student__c();
        Test.StartTest();
        ApexPages.StandardController sc = new ApexPages.StandardController(s);
        Studentcontroller ic = new Studentcontroller(sc);
        ic.saveme();
        Test.StopTest();
    }
    static testMethod void cancelme()
    {
        student__c s=new student__c();
        Test.StartTest();
        ApexPages.StandardController sc = new ApexPages.StandardController(s);
        Studentcontroller ic = new Studentcontroller(sc);
        ic.cancel();
        Test.StopTest();
    }
    static testmethod void search() //name!=null coursetype!=null stuyear!=null
    {
        student__c s=new student__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Studentcontroller sc = new Studentcontroller(scc);
        sc.stuname='prasanna';
        sc.coursetype='B.Tech';
        sc.stuyear='I';
        sc.search();
        student__c stu=[select name,course_type__c,pursuing_year__c from student__c where name=:sc.stuname and course_type__c=:sc.coursetype and pursuing_year__c=:sc.stuyear];
        system.assertEquals(stu.name,sc.stuname);
    }
    static testMethod void search1() //name=prasanna coursetype=btech stuyear=null
    {
        student__c s=new student__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Studentcontroller sc = new Studentcontroller(scc);
        sc.stuname='prasanna';
        sc.coursetype='B.Tech';
        sc.stuyear=null;
        sc.search(); 
        student__c stu=[select name,course_type__c,pursuing_year__c from student__c where name=:sc.stuname and course_type__c=:sc.coursetype];
        system.assertEquals(stu.name,sc.stuname);
        system.assertEquals(stu.course_type__c,sc.coursetype);
        
    }  
    static testMethod void search2() //name=null coursetype=btech stuyear=I
    {
        student__c s=new student__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Studentcontroller sc = new Studentcontroller(scc);
        sc.stuname='';
        sc.coursetype='B.Tech';
        sc.stuyear='I';
        sc.search();
        student__c stu=[select name,course_type__c,pursuing_year__c from student__c where course_type__c=:sc.coursetype and pursuing_year__c=:sc.stuyear];
        system.assertEquals(stu.pursuing_year__c,sc.stuyear);
        system.assertEquals(stu.course_type__c,sc.coursetype);
        
    }
    static testMethod void search3() // name=null coursetype=null stuyear=I
    {
        student__c s=new student__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Studentcontroller sc = new Studentcontroller(scc);
        sc.stuname='';
        sc.coursetype=null;
        sc.stuyear='I';
        sc.search();
        student__c stu=[select name,course_type__c,pursuing_year__c from student__c where pursuing_year__c='I'];
        system.assertEquals(stu.pursuing_year__c,sc.stuyear);
    }  
    static testMethod void search4() //name=prasanna coursetype=null stuyear=null
    {
        student__c s=new student__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Studentcontroller sc = new Studentcontroller(scc);
        sc.stuname='prasanna';
        sc.coursetype=null;
        sc.stuyear=null;
        sc.search();
        student__c stu=[select name,course_type__c,pursuing_year__c from student__c where name=:sc.stuname];
        system.assertEquals(stu.name,sc.stuname);
    }  
    static testMethod void search5() //name=null coursetype=btech stuyear=null
    {
        student__c s=new student__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Studentcontroller sc = new Studentcontroller(scc);
        sc.stuname='';
        sc.coursetype='B.Tech';
        sc.stuyear=null;
        sc.search();
        student__c stu=[select name,course_type__c,pursuing_year__c from student__c where course_type__c=:sc.coursetype];
        system.assertEquals(stu.course_type__c,sc.coursetype);
    }  
    
    static testMethod void search7()
    {
        student__c s=new student__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Studentcontroller sc = new Studentcontroller(scc);
        sc.stuname='';
        sc.coursetype=null;
        sc.stuyear=null;
        sc.search();
        integer stu=[select count() from student__c where course_type__c=:sc.coursetype and name=:sc.stuname and pursuing_year__c=:sc.stuyear];
        system.assertEquals(stu,0);
    }  
    static testmethod void studentdetailmethod()
    {
        student__c sid=[select id from student__c];
        student__c s=new student__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Studentcontroller sc = new Studentcontroller(scc);
        sc.sid=sid.id;        
        sc.studentdetails();
        student__c det=[select name from student__c where id=:sc.sid];
        system.assertEquals(det.Id, sc.sid);
        test.stopTest();
        
    }
    
}