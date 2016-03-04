<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="style_for_list.css" />
	<title>Payment List after Delete</title>
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
	            		<li><a href="Add_Payment.jsp">Add data</a></li>
		                <li><a href="Delete_Payment.jsp">Delete data</a> </li>
		                <li><a href="Sort_Payment.jsp">Sort data</a> </li>
	            	</ul>
	            </li>
	            <li><a href="#">Contacts</a> </li>
	         </ul>
	     	</center>
	</div>
	<h1>Payment List after Delete Data</h1>
		<table>
			<tr>
				<td>ID
				<td>Date
				<td>Goods
				<td>ChargePayed
				<td>SumPayed
				<td>CustomerID
				<td>MerchantID
			</tr>
			<%
	    	org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext ("spring/application-config.xml");
	    	com.bionic.edu.PaymentService paymentService = (com.bionic.edu.PaymentService)context.getBean("paymentServiceImpl");
	    	paymentService.remove(Integer.valueOf(request.getParameter("id")));
			java.util.List<com.bionic.edu.Payment> list = paymentService.findAll();
			for(com.bionic.edu.Payment p : list){
			    out.print(p.getDataForWeb());
	    	}
	  		%>
		</table>
</body>
</html>