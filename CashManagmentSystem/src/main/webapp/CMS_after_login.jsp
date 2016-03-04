<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cash Management System</title>
    <!-- css -->
	<link rel="stylesheet" type="text/css" href="css/cms_login.css" />
    <link rel="stylesheet" type="text/css" href="css/magnific-popup.css" />
	<!-- scripts -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>
</head>
<body>
		<div class="header">
			<div class="signed">
                <p> Signed in as:
                	<%  org.springframework.context.ApplicationContext context = 
		     			new org.springframework.context.support.ClassPathXmlApplicationContext(
							"spring/application-config.xml");
		     		    com.bionic.edu.UsersService usersService = 
						(com.bionic.edu.UsersService) context.getBean("usersServiceImpl");
						String list = usersService.findByEmail(request.getParameter("eMail"));
						out.print(list);
				    %>
		     	</p>     
            </div>	
			<h1>Cash Management System</h1>	
		</div>
		
		<div id = "content">
			<div class="left">
	        	<ul class = menu>
	            	<li><a href="InfoPage.html">Information</a> </li>
	            	<li class="menu_drop"><a href="#">Display</a>
	                	<ul>
		                    <li><a href="List_of_Merchants.jsp">Merchants</a> </li>
		                    <li><a href="List_of_Customers.jsp">Customers</a> </li>
		                    <li><a href="List_of_Payments.jsp">Payments</a> </li>
		                </ul>    
		            </li>
		            <li><a href="#">Contacts</a> </li>
		         </ul>
		     </div>
            
            <div class="conCen">
                <img src="img/CMS.png" style="width:400px;height:300px;">
            </div>
	   </div>
       <div class="footer">
		  Cash Management System
       </div>
</body>
</html>