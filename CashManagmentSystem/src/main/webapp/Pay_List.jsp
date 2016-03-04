<%@page import="org.apache.derby.security.SystemPermission"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/pay_list.css" />
	<link rel="stylesheet" type="text/css" href="css/magnific-popup.css" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="js/cms.js"></script>
<title>Pay List</title>
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
	        <li><a href="#">Contacts</a> </li>
	     </ul>   	
	</div>
	<div class="center">
				
		<div class="table">
			<h1>Pay List for Merchants</h1>	
			<span>Date Start:        Date End: </span>
			<table>
			    <tr class="thead">
			    	<td>MerchantID
			    	<td>MerchantName
			    	<td>MerchantsMinSum
			    	<td>SumPayed
			    	<td>NeedToSend
			    </tr>
			    <%
			        org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext(
						"spring/application-config.xml");
					com.bionic.edu.MerchantService merchantService = (com.bionic.edu.MerchantService) context
						.getBean("merchantServiceImpl"); 
					java.util.List<com.bionic.edu.Result> list = merchantService.generatePayList(java.sql.Timestamp.valueOf(request.getParameter("dateS")+" 00:00:00.0"),java.sql.Timestamp.valueOf(request.getParameter("dateF")+" 23:59:59.9"));
					for (com.bionic.edu.Result r: list) {
						out.print(r.getDataForWeb());
					}
			    %>
			</table>
			<br>
			<input class="comm" type="text" name="comm" placeholder="Commission"/>
			<br>
			<button class="GenTS">Generate Transfer Sum</button>
			
			
			<script type="text/javascript">
				//var tr = $("tr");
				//var td = $("td");
				//for(var i =0; i<=tr.lenght;i++){
				//$("tr.thead").style.background="red";
				//}
			</script>
			
		</div>
		
		<div class="tableAfter">
			<h1>Pay List for Merchants with Need to Send</h1>
			<table>
			    <tr class="thead">
			    	<td>MerchantID
			    	<td>MerchantName
			    	<td>MerchantsMinSum
			    	<td>SumPayed
			    	<td>NeedToSend
			    </tr>
			   <%
					for(com.bionic.edu.Result r : list){
						if(r.getMinSum()<=r.getSum()){
					    	r.setNeedToSend(r.getSum()*0.95);
						}
						out.print(r.getDataForWeb());
			    	}
			    %>
			</table>
		</div>
		<button class="Send">Send</button>
		<div class="tableAfterSend">
			<h1>List of Merchants after Send</h1>
			<table>
			    <tr class="thead">
				<td>ID
				<td>Name
				<td>Charge
				<td>Sent
			</tr>
            <%	
            	merchantService.updateSent(1,100.00);
            	/* for(com.bionic.edu.Result r : list){
            		merchantService.updateSent(r.getId(), r.getSum()*0.95);	
            	} */
            	java.util.List<com.bionic.edu.Merchant> listM = merchantService.findAll();
            	for (com.bionic.edu.Merchant m : listM) {
					out.print(m.getDataForWebWithSent());
				}	
			%> 
			</table>
		</div>
	</div>
	<div class="footer">
	        <p>Cash Management System</p>
	</div>
</body>
</html>