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
			<div class="tableD">
				Date: <%out.print(request.getParameter("dateS"));%> - <%out.print(request.getParameter("dateF"));%>
			</div>
			<p>Commission 5%</p> 
			<!-- <input class="comm" type="text" name="comm" placeholder="Commission,%" required="required"/> -->
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
			<button class="GenTS">Generate Transfer Sum</button>
		</div>
		
		<div class="tableAfter">
			<h1>Pay List for Merchants with Need to Send</h1>
			<div class="tableD">
				Date: <%out.print(request.getParameter("dateS"));%> - <%out.print(request.getParameter("dateF"));%>
			</div> 
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
				<td>LastSent
			</tr>
            <%	
            	java.util.List<com.bionic.edu.Merchant> listM = merchantService.findAll();
            	for (com.bionic.edu.Merchant m : listM) {
            		for(com.bionic.edu.Result r : list){
                		if((r.getMinSum()<=r.getSum())&(m.getId()==r.getId())){
                			merchantService.updateSent(r.getId(), r.getSum()*0.95);
                			merchantService.updateLastSent(r.getId());
                		}
                	} 
					out.print(m.getDataForWebWithSent());
				}	
			%> 
			</table>
		</div>
	</div>
	<div class="footer">
	        <p>Cash Management System</p>
	</div>
	<!-- <script type="text/javascript">
		$(document).ready(function(){
			//if(document.getElementsByTagName("tr").value>=  )
			var temp ="";
			for(var i=6;i<10;i++){
				temp = document.getElementsByTagName("tr")[i];
				temp.getElementsByTagName("td")[4].style.background="#90EE90";
				var t = parseFloat(document.getElementsByTagName("td")[4].html());
				alert(t);
			}
		});
	</script> -->
</body>
</html>