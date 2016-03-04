<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style_for_list.css" />
<title>Customer List</title>
</head>
<body>
	<div class="head">
		<center>
			<ul>
				<li><a href="index.html">HomePage</a></li>
				<li><a href="InfoPage.html">Information</a></li>
				<li><a href="#">Display</a>
					<ul>
						<li><a href="List_of_Merchants.jsp">Merchants</a></li>
						<li><a href="List_of_Customers.jsp">Customers</a></li>
						<li><a href="List_of_Payments.jsp">Payments</a></li>
					</ul></li>
				<li><a href="#">Capabilities</a>
					<ul>
						<li><a href="Add_Merchant.jsp">Add data</a></li>
						<li><a href="Delete_Merchant.jsp">Delete data</a></li>
						<li><a href="Sort_Merchant.jsp">Sort data</a></li>
					</ul></li>
				<li><a href="#">Contacts</a></li>
			</ul>
		</center>
	</div>

	<h1>Customers List</h1>
	<table>
		<tr>
			<td>id
			<td>Name
			<td>Address
			<td>eMail
			<td>ccNo
			<td>ccType
		</tr>
		<%
			org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext(
					"spring/application-config.xml");
			com.bionic.edu.CustomerService customerService = (com.bionic.edu.CustomerService) context
					.getBean("customerServiceImpl");
			com.bionic.edu.Customer customer = new com.bionic.edu.Customer();
			customer.setId(Integer.valueOf(request.getParameter("id")));
			customer.setName(request.getParameter("name"));
			customer.setAddress(request.getParameter("address"));
			customer.seteMail(request.getParameter("eMail"));
			customer.setCcNo(request.getParameter("ccNo"));
			customer.setCcType(request.getParameter("ccType"));
			customerService.save(customer);
			java.util.List<com.bionic.edu.Customer> list = customerService.findAll();
			for (com.bionic.edu.Customer c : list) {
				out.print(c.getDataForWeb());
			}
		%>
	</table>
</body>
</html>