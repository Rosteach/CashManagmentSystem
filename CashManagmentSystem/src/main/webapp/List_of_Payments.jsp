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
	<title>List of payments</title>
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
		                <li><a>Sort data</a>
			                <ul>
								<li><a href="#sortByID" class="sortByID">ID</a></li>		                
		                		<li><a href="#sortByDate" class="sortByDate">Date</a></li>
		                		<li><a href="#sortBySumpayed" class="sortBySumPayed">SumPayed</a></li>
		                	</ul>
		                </li>
	            	</ul>
	            </li>
	            <li><a href="#">Contacts</a> </li>
	         </ul>
	     	</center>
	</div>
	
	<div class="center">
	
		<h1>List of payments</h1>
		<table>
		    <tr class="thead">
		    	<td>ID
				<td>Date
				<td>Goods
				<td>SumPayed
				<td>CustomerID
				<td>MerchantID
		    </tr>
		    <%
		    	org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext ("spring/application-config.xml");
		    	com.bionic.edu.PaymentService paymentService = (com.bionic.edu.PaymentService)context.getBean("paymentServiceImpl");
				java.util.List<com.bionic.edu.Payment> list = paymentService.findAll();
				for(com.bionic.edu.Payment p : list){
				    out.print(p.getDataForWeb());
		    	}
		    %>
		</table>
		
		<div class="form">
                    <form id="formAdd" action="List_of_Payments_after_Add.jsp" method="POST">
                    <h3>Add data</h3>
                        <p><input type="text" name="Goods" placeholder="Goods" required="required"/></p>
                        <p><input type="text" name="ChargePayed" placeholder="ChargePayed" required="required"/></p>
                        <p><input type="text" name="SumPayed" placeholder="SumPayed" required="required"/></p>
                        <p><input type="text" name="CustomerID" placeholder="CustomerID" required="required"/></p>
                        <p><input type="text" name="MerchantID" placeholder="MerchantID" required="required"/></p>
                        <p><input type="date" name="date" placeholder="date" required="required"/></p>
						<button type="submit" >Add</button>
                    </form>
                    
                    <form id="formDelete" action="List_of_Payments_after_Delete.jsp" method="POST">
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