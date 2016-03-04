<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/style_for_list.css" />
		<link rel="stylesheet" type="text/css" href="css/magnific-popup.css" />
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    	<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
    	<script type="text/javascript" src="js/cms.js"></script>
		<title>List of Merchants</title>
	</head>

	<body>
			
	 <div class="head">
	 	
         <ul>
            <li><a href="index.html">HomePage</a> </li>
            <li><a href="InfoPage.html">Information</a> </li>
            <li><a href="#">Display</a> 
            	<ul>
	                <li><a href="List_of_Merchants.jsp">Merchants</a> </li>
	                <li><a href="List_of_Customers.jsp">Customers</a> </li>
	                <li><a href="List_of_Payments.jsp">Payments</a> </li>
	            </ul> 
            </li>
            <li><a href="#">Capabilities</a>
            	<ul>
            		<li><a href="#formAdd" class="add">Add data</a></li>
	                <li><a href="#formDelete" class="delete">Delete data</a> </li>
	                <li><a href="#">Sort data</a>
						<ul>
							<li><a href="#sortByID" class="sortByID">ID</a></li>		                
	                		<li><a href="#sortByName" class="sortByName">Name</a></li>
	                		<li><a href="#sortByMinSum" class="sortByMinSum">Minimum Sum</a></li>
	                	</ul>
	                </li>
            	</ul>
            </li>
            <li><a href="#">Contacts</a> </li>
         </ul>
     	
     </div>   
     
  
	 <div class="center">
		
        <h1>List of Merchants after Send</h1>
		<table>
			<tr class="thead">
				<td>ID
				<td>Name
				<td>Charge
				<td>Sent
			</tr>
            <%	
          		org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext(
					"spring/application-config.xml");
				com.bionic.edu.MerchantService merchantService = (com.bionic.edu.MerchantService) context
					.getBean("merchantServiceImpl");
				java.util.List<com.bionic.edu.Merchant> list = merchantService.findAll();
				for (com.bionic.edu.Merchant m : list) {
					out.print(m.getDataForWeb());
				}
			%>         
						
		</table>
		
    </div>
    <div class="footer">
        <p>Cash Management System</p>
    </div>
	</body>
</html>