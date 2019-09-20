public class StudentController {
    public list<student__c> student{set;get;}
    public list<student__c> studentdetail{set;get;}
    public id sid{set; get;}
    public string sname{set; get;}
    public boolean flag{set; get;}
    public boolean flag1{set; get;}
    public boolean flag2{set; get;}
    public boolean flag3{set; get;}
    public String stuname{set;get;}
    public String coursetype {set;get;}
    public String stuyear{set;get;}
    public String query;
    private apexpages.Standardcontroller controller;
    public StudentController (ApexPages.StandardController controller)
    {
        flag=true;
        flag1=false;
        flag2=false;
        this.controller=controller;
    }
    public pagereference search()
    { 
        query='Select id,name,Course_Type__c,Pursuing_Year__c,branch__c,Email__c,Backlogs__c,Father_s_Name__c,Student_ID__c,Status__c,Semester__c,Mobile_no__c,Father_s_Phone_no__c from student__c ';
        system.debug(stuname+''+coursetype+''+stuyear);
        if((stuname=='')&&(coursetype==NULL)&&(stuyear==NULL))
        {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Enter atleast One Value'));
        }
        else
        {
            flag1=true;
            flag2=false;
            flag3=false;
            if((stuname!='')&&(coursetype!=NULL)&&(stuyear!=NULL))
            {
                query = query + ' where name like \'%'+stuname+'%\' and Course_Type__c=\''+coursetype+'\' and Pursuing_Year__c=\''+stuyear+'\'';            
            }
            else
            {
                if((stuname!='')&&(coursetype!=NULL))
                {
                    query = query + ' where name like \'%'+stuname+'%\'and Course_Type__c=\''+coursetype+'\'';  
                }
                else 
                {
                    if((coursetype!=NULL)&&(stuyear!=NULL))
                    {
                        query = query +' where Course_Type__c=\''+coursetype+'\' and Pursuing_Year__c=\''+stuyear+'\'';
                    }
                    else{
                        if(stuname!='')
                        {
                            query = query + ' where name like \'%'+stuname+'%\'';  
                        }else{
                            if(coursetype!=NULL){
                                query = query + ' where Course_Type__c like \'%'+coursetype+'%\'';
                            }
                            else{
                                if(stuyear!=NULL){
                                    query = query + ' where Pursuing_Year__c like \'%'+stuyear+'%\'';
                                }
                                
                            }
                        }
                    }
                }
                student=database.query(query); 
            }
        }
        
        return null;
    }
    public void newstudent() //opens a new registration form
    {
        flag=true;
        flag1=false;
        flag2=true;  
        flag3=false;
    }
    public void clearresult() //clears the result pageblock
    {
        flag=true;
        flag1=false;
        flag2=false;
        flag3=false;
        /* Clearing the values after clicking search button*/
        stuname=null;
        coursetype=null;
        stuyear=null;
    } 
    public void spin() //Loading gif method
    {
        long now = datetime.now().gettime();
        while(datetime.now().gettime()-now<5000); // Busy loop for 5000 ms
    }
    public pagereference saveme() //save button functionality
    {
        controller.save();
        flag=true;
        flag1=false;
        flag2=false;
        flag3=false;
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Student Registered successfully'));
  
        return null;
    }
    public pagereference cancel() //save button functionality
    {
         flag=true;
        flag1=false;
        flag2=false;
        flag3=false;       
        return null;
    }  
    public void studentdetails()
    {
        flag=true;
        flag1=true;
        flag2=false;
        flag3=true;
        studentdetail=[Select name,Address__c,Admission_Type__c,Attendance__c,Available_Games__c,Backlogs__c,Blood_Group__c,Branch__r.name,Category__c,CGPA__c,Country__c,Course_Type__c,DOB__c,Eamcet_Rank__c,
                       Email__c,Father_s_Name__c,Father_s_occupation__c,Father_s_Phone_no__c,Fee_Reimbursement__c,Gender__c,Guardian_Name__c,Guardian_Relationship__c,Interested_Club__c,Intrested_Games__c,Intermediate_College_Name__c
                       ,Intermediate_Percentage__c,Mobile_no__c,Mother_s_occupation__c,Mother_s_Name__c,Mother_s_phone_no__c,Pincode__c,Pursuing_Year__c,School_Name__c,School_Percentage__c,Semester__c,State__c,Status__c,Student_ID__c
                       ,Year_of_School_Completion__c,Year_of_College_Completion__c from student__c where id=:sid and name=:sname];
        system.debug(sid);
    }
    
}