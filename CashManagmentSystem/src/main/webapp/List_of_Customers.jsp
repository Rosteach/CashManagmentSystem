<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/style_for_list.css" />
		<link rel="stylesheet" type="text/css" href="css/magnific-popup.css" />
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    	<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
    	<script type="text/javascript" src="js/cms.js"></script>
	<title>List of Customers</title>
</head>
<body>
	<div class="head">
		 	<center>
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
		                		<li><a href="#sortByAddress" class="sortByAddress">Address</a></li>
		                	</ul>
		                </li>
	            	</ul>
	            </li>
	            <li><a href="#">Contacts</a> </li>
	         </ul>
	     	</center>
	</div>
	<div class="center">
		<h1>List of Customers</h1>
		<table>
		    <tr class="thead">
		    	<td>id
		    	<td>Name
		    	<td>Address
		    	<td>eMail
		    	<td>ccNo
		    	<td>ccType
		    </tr>
		    <%
		    	org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext ("spring/application-config.xml");
		    	com.bionic.edu.CustomerService customerService = (com.bionic.edu.CustomerService)context.getBean("customerServiceImpl");
				java.util.List<com.bionic.edu.Customer> list = customerService.findAll();
				for(com.bionic.edu.Customer c : list){
				    out.print(c.getDataForWeb());
		    	}
		    %>
		</table>
		
		<div id="sortByID">
				<h1>List of Merchants sorted by ID</h1>
			<table>
				<tr class="thead">
					<td>ID
		    		<td>Name
		    		<td>Address
		    		<td>eMail
		    		<td>ccNo
		    		<td>ccType
				</tr>
	          <%
					list = customerService.getSortedByID();
					for (com.bionic.edu.Customer c : list) {
						out.print(c.getDataForWeb());
					}
				%>			
			</table>
		</div>
		
		<div id="sortByName">
				<h1>List of Merchants sorted by Name</h1>
			<table>
				<tr class="thead">
					<td>ID
		    		<td>Name
		    		<td>Address
		    		<td>eMail
		    		<td>ccNo
		    		<td>ccType
				</tr>
	          <%
					list = customerService.getSortedByName();
					for (com.bionic.edu.Customer c: list) {
						out.print(c.getDataForWeb());
					}
				%>			
			</table>
		</div>
		<div id="sortByAddress">
				<h1>List of Merchants sorted by Address</h1>
			<table>
				<tr class="thead">
					<td>ID
		    		<td>Name
		    		<td>Address
		    		<td>eMail
		    		<td>ccNo
		    		<td>ccType
				</tr>
	          <%
					list = customerService.getSortedByAddress();
					for (com.bionic.edu.Customer c: list) {
						out.print(c.getDataForWeb());
					}
				%>			
			</table>
		</div>
		
		<div class="form">
                    <form id="formAdd" action="List_of_Merchants_after_Add.jsp" method="POST">
                    <h3>Add data</h3>
                        <p><input type="text" name="name" placeholder="Name" required="required"/></p>
                        <p><input type="text" name="address" placeholder="Address" required="required"/></p>
                        <p><input type="text" name="eMail" placeholder="eMail" required="required"/></p>
                        <p><input type="text" name="ccNo" placeholder="ccNo" required="required"/></p>
                        <p><input type="text" name="ccType" placeholder="ccType" required="required"/></p>
						<button type="submit" >Add</button>
                    </form>
                    
                    <form id="formDelete" action="List_of_Merchants_after_Delete.jsp" method="POST">
                    <h3>Delete data</h3>
                        <p><input type="text" name="id" placeholder="ID" required="required"/></p>
                        <button type="submit">Delete</button>
                    </form>
        </div>
	</div>
	<div class="footer">
	        <p>Cash Management System</p>
	</div>
</body>
</html>