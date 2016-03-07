package com.bionic.edu;



import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.inject.Inject;
import javax.inject.Named;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@Named
public class Application{
    @Inject
    MerchantService merchantService;
    @Inject
    UsersService usersService;
    @SuppressWarnings("resource")
    public static void main(String[] args) {
        ApplicationContext context = new 	ClassPathXmlApplicationContext("spring/application-config.xml");
        Application application = (Application)context.getBean("application");
        //application.printMerchantName(1);
        //application.printUsersName("rospavlenko@gmail.com");
        //application.UpdateSent(1,100.00);
        //Date d =new Date(0);   
        //application.UpdateLastSent(1);
     }
    public void printMerchantName(int id){
        Merchant m1 = merchantService.findById(id);
        System.out.println("name = " + m1.getName());     
    }
    public void printUsersName(String eMail){
        String u = usersService.findByEmail(eMail);
        System.out.println("name = " + u);     
    }
    public void UpdateSent(int id, double sent){
        merchantService.updateSent(id,sent);    
    }
    public void UpdateLastSent(int id){
        merchantService.updateLastSent(id);    
    }
}
