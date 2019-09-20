public class NoticeController {
    public list<notice__c> recorddetail {get; set;}
    public list<notice__c> records {get; set;}
    public id noticeid{get; set;}
    public boolean flag{get; set;}
    public boolean flag1{get; set;}
    public NoticeController()
    {
        flag=true;
        flag1=false;
        records=[select name,description__c,Referring__c from Notice__c];
    }
    public void Queryinfo(){
        flag=true;
        flag1=true;
        recorddetail=[select name,description__c,Referring__c from Notice__c where id=:noticeid];
        system.debug(recorddetail);
    }
    public pagereference createnotice()
    {
        pagereference pg=new pagereference('/a04/e?retURL=%2Fa04%2Fo');
        pg.setRedirect(true);
        return pg;
    }
    
    
}