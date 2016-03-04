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
	<title>Merchant List after Add</title>
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
	                <li><a href="#formDelete" class="delete">Delete data</a></li>
	                <li><a href="Sort_Merchant.jsp">Sort data</a>
	       				<ul>
							<li><a href="List_of_Merchants_after_Sort_by_ID.jsp">ID</a></li>		                
	                		<li><a href="List_of_Merchants_after_Sort_by_Name.jsp">Name</a></li>
	                		<li><a href="List_of_Merchants_after_Sort_by_MinSum.jsp">Minimum Sum</a></li>
	                	</ul>
	                </li>
            	</ul>
            </li>
            <li><a href="#">Contacts</a> </li>
         </ul>
     	</center>
		</div>
		
		<div class="center">
		<h1>List of Merchants after Add</h1>
			<table>
			    <tr class="thead">
			    	<td>ID
			    	<td>Name
			    	<td>Bank
			    	<td>Charge
			    	<td>Minimum Sum
			    	<td>Swift
			    	<td>Account
			    </tr>
			    <%
			    	org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext ("spring/application-config.xml");
				    com.bionic.edu.MerchantService merchantService = (com.bionic.edu.MerchantService)context.getBean("merchantServiceImpl");
				    com.bionic.edu.Merchant merchant = new com.bionic.edu.Merchant();
				    merchant.setName(request.getParameter("name"));
				    merchant.setCharge(Double.valueOf(request.getParameter("charge")));
					merchant.setMinSum(Double.valueOf(request.getParameter("sum")));
					merchant.setBankName(request.getParameter("bank"));
					merchant.setSwift(request.getParameter("swift"));
					merchant.setAccount(request.getParameter("account"));
					merchantService.save(merchant);
					java.util.List<com.bionic.edu.Merchant> list = merchantService.findAll();
					for(com.bionic.edu.Merchant m : list){
					    out.print(m.getDataForWeb());
			    	}
			    %>
			</table>
			<div class="form">
                    <form id="formAdd" action="List_of_Merchants_after_Add.jsp" method="POST">
                    <h3>Add data</h3>
                        <p><input type="text" name="name" placeholder="Name" required="required"/></p>
                        <p><input type="text" name="charge" placeholder="Charge" required="required"/></p>
                        <p><input type="text" name="sum" placeholder="Sum" required="required"/></p>
                        <p><input type="text" name="bank" placeholder="Bank" required="required"/></p>
                        <p><input type="text" name="swift" placeholder="Swift" required="required"/></p>
                        <p><input type="text" name="account" placeholder="Account" required="required"/></p>
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