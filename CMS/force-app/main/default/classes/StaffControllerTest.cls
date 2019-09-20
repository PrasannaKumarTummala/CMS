@isTest
private class StaffControllerTest {
    @testsetup static void sampledata()
    {
        staff__c st =new staff__c(name='prasanna',department__c='Academics',role__c='Attender',degrees__c='ssc',contact_no__c='9988556677');
        insert st;
    }
    static testMethod void newstaff()
    {
        staff__c s=new staff__c();
        Test.StartTest();        
        ApexPages.StandardController sc = new ApexPages.StandardController(s);
        Staffcontroller stc = new Staffcontroller(sc);
        stc.newstaff();
        Test.StopTest();
    }
    static testMethod void saveme()
    {
        staff__c s=new staff__c();
        Test.StartTest();
        ApexPages.StandardController sc = new ApexPages.StandardController(s);
        Staffcontroller stc = new Staffcontroller(sc);
        stc.saveme();
        Test.StopTest();
    }
      static testMethod void queryinfo()
    {
        staff__c s=new staff__c();
        Test.StartTest();
        ApexPages.StandardController sc = new ApexPages.StandardController(s);
        Staffcontroller stc = new Staffcontroller(sc);
        stc.queryinfo();
        Test.StopTest();
    }
    static testmethod void search() //name!=null department=null role=null
    {
        staff__c s=new staff__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Staffcontroller sc = new Staffcontroller(scc);
        sc.staffname='prasanna';
        sc.staffdept='Academics';
        sc.staffrole='Attender';
        sc.search();
        staff__c sta=[select name,department__c,role__c from staff__c where name=:sc.staffname and department__c=:sc.staffdept and role__c=:sc.staffrole];
        system.assertEquals(sta.name,sc.staffname);
    }
    static testMethod void search1() //name=prasanna department=Academics role=null
    {
        staff__c s=new staff__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Staffcontroller sc = new Staffcontroller(scc);
        sc.staffname='prasanna';
        sc.staffdept='Academics';
        sc.staffrole='';
        sc.search();
        staff__c sta=[select name,department__c,role__c from staff__c where name=:sc.staffname and department__c=:sc.staffdept];
        system.assertEquals(sta.name,sc.staffname);
        system.assertEquals(sta.department__c,sc.staffdept);
        
    }  
    static testMethod void search2()  //name=null department=Academics role=Attender
    {   
        staff__c s=new staff__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Staffcontroller sc = new Staffcontroller(scc);
        sc.staffname='';
        sc.staffdept='Academics';
        sc.staffrole='Attender';
        sc.search();
        staff__c sta=[select name,department__c,role__c from staff__c where department__c=:sc.staffdept and role__c=:sc.staffrole];
        system.assertEquals(sta.department__c,sc.staffdept);
        system.assertEquals(sta.role__c,sc.staffrole);
    }
    
    static testMethod void search3() // name=null  department=null role=Attender
    {
        staff__c s=new staff__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Staffcontroller sc = new Staffcontroller(scc);
        sc.staffname='';
        sc.staffdept='';
        sc.staffrole='Attender';
        sc.search();
        staff__c sta=[select name,department__c,role__c from staff__c where  role__c=:sc.staffrole];
        system.assertEquals(sta.role__c,sc.staffrole);
    }  
    static testMethod void search4() //name=prasanna department=null role=null
    {
        staff__c s=new staff__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Staffcontroller sc = new Staffcontroller(scc);
        sc.staffname='prasanna';
        sc.staffdept='';
        sc.staffrole='';
        sc.search();
        staff__c sta=[select name,department__c,role__c from staff__c where  name=:sc.staffname];
        system.assertEquals(sta.name,sc.staffname);
    }  
    static testMethod void search5() //name=null department=Academics role=null
    {
        staff__c s=new staff__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Staffcontroller sc = new Staffcontroller(scc);
        sc.staffname='';
        sc.staffdept='Academics';
        sc.staffrole='';
        sc.search();
        staff__c sta=[select name,department__c,role__c from staff__c where department__c=:sc.staffdept];
        system.assertEquals(sta.department__c,sc.staffdept);
    }  
    
    static testMethod void search7()
    {
        staff__c s=new staff__c();
        Test.StartTest();        
        ApexPages.StandardController scc = new ApexPages.StandardController(s);
        Staffcontroller sc = new Staffcontroller(scc);
        sc.staffname='';
        sc.staffdept='';
        sc.staffrole='';
        sc.search();
        integer sta=[select count() from staff__c where department__c=:sc.staffdept and name=:sc.staffname and role__c=:sc.staffrole];
        system.assertEquals(sta,0);
    }  
}