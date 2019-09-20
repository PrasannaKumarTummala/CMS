public class Staffcontroller {
    public list<Staff__C> staff {set;get;}
    public String staffname{set;get;}
    public String staffdept {set;get;}
    public String staffrole{set;get;}
    public String query;
    public Boolean flag{set;get;}
    public Boolean flag1{set;get;}
    public Boolean flag2{set;get;}
    private apexpages.Standardcontroller controller;
     public Staffcontroller(ApexPages.StandardController controller)
    {
        flag=true;
        flag1=false;
        flag2=false;
        this.controller=controller;
    }
     public pagereference search()
    {   
        query='Select name,Department__c,role__c,Designation__c,Contact_no__c,salary__c,Email__c,Gender__c from staff__c '; 
        if((staffname=='')&&(staffdept=='')&&(staffrole==''))
        {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Enter atleast one field to filter'));
        }
        else
        {
            flag1=true;
            flag2=false;
            if((staffname!='')&&(staffdept!='')&&(staffrole!=''))
            {
                query = query + ' where name like \'%'+staffname+'%\' and Department__c=\''+staffdept+'\' and role__c=\''+staffrole+'\'';            
            }
            else
            {
                if((staffname!='')&&(staffdept!=''))
                {
                    query = query + ' where name like \'%'+staffname+'%\'and Department__c=\''+staffdept+'\'';  
                }
                else 
                {
                    if((staffdept!='')&&(staffrole!=''))
                    {
                        query = query +' where Department__c=\''+staffdept+'\' and role__c=\''+staffrole+'\'';
                    }
                    else{
                        if(staffname!='')
                        {
                            query = query + ' where name like \'%'+staffname+'%\'';  
                        }else{
                            if(staffdept!=''){
                                query = query + ' where Department__c like \'%'+staffdept+'%\'';
                            }
                            else{
                                if(staffrole!=''){
                                    query = query + ' where role__c like \'%'+staffrole+'%\'';
                                }                        
                            }
                        }
                    }
                }
                staff=database.query(query); 
            }
        }
        
        return null;
    }
    
    public void newstaff() //Refers to the new student registration form
    {
        flag1=false;
        flag2=true;
        
    }
    public void queryinfo()
    {
        flag1=true;
        flag2=false;
    }
    public pagereference saveme()
    {
        controller.save();
        pagereference pg=page.staffvf;
        pg.setRedirect(true);  
        return pg;
    }    
}