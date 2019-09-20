public class MainController {
    public boolean flag{set;get;}
    public boolean flag1{set;get;}
    public boolean flag2{set;get;}
    public boolean flag3{set;get;}
    public boolean flag4{set;get;}
    public MainController()
    {
        flag=true;
        flag1=false;
        flag2=false;
        flag3=false;
        flag4=false;        
    }
    public pagereference student()
    {
        flag=false;
        flag1=true;
        flag2=false;
        flag3=false;
        flag4=false;
        pagereference pf=new pagereference('/apex/studenttVF');
        return null;
    }
    public pagereference staff()
    {
        flag=false;
        flag1=false;
        flag2=true;
        flag3=false;
        flag4=false;
        pagereference pf=new pagereference('/apex/staffVF');
        return null;
    }
    public pagereference notice()
    {
        flag=false;
        flag1=false;
        flag2=false;
        flag3=true;
        flag4=false;
        pagereference pf=new pagereference('/apex/noticesVF');
        return null;
    }
    public pagereference inquiry()
    {
        flag=false;
        flag1=false;
        flag2=false;
        flag3=false;
        flag4=true;
        pagereference pf=new pagereference('/apex/InquiryVf');
        return null;
    }
    public pagereference home()
    {
        flag=true;
        flag1=false;
        flag2=false;
        flag3=false;
        flag4=false;
        pagereference pf=new pagereference('/apex/homepageVF');
        return null;
    }
}