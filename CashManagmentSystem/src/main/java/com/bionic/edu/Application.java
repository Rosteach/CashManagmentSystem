package com.bionic.edu;

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
        application.printUsersName("rospavlenko@gmail.com");
     }
    public void printMerchantName(int id){
        Merchant m1 = merchantService.findById(id);
        System.out.println("name = " + m1.getName());     
    }
    public void printUsersName(String eMail){
        String u = usersService.findByEmail(eMail);
        System.out.println("name = " + u);     
    }
}
