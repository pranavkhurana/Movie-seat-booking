<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="mypack.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<%
	String url = request.getRequestURL().toString();
	String baseUrl = url.substring(0, url.length() - request.getRequestURI().length())
			+ request.getContextPath() + "/";
%>
<link href="<%=baseUrl%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template CSS -->
<link href="<%=baseUrl%>/resources/css/modern-business.css"
	rel="stylesheet">
<!-- Theme CSS -->
<link href="<%=baseUrl%>/resources/css/custom.css" rel="stylesheet">
<!-- Datepicker CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

<!-- Custom Fonts -->
<link
	href="<%=baseUrl%>/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<style type="text/css">
body{
}
.jumbotron {
	padding-top:0px;
	padding-bottom:20px;
	text-align: center; width : 60%;
	border-radius: 15px;
}

.well {
	background-color: lightblue;
	width: 70%;
	margin-left: 15%;
	font-family: cursive;
}

.pricecontainer {
	float: right; text-align : left;
	width: 80%;
	text-align: left;
}

.prices {
	float: right;
}

table {
	font-size: medium;
}
button{
	float: right;
    color: #c20d0d;
    padding: 5px;
    font-size: small;
    margin-top: 20px;
}
</style>

</head>
<body>
	<%@include file="navigation-bar.jsp"%>

	<%
		Booking b = (Booking) request.getAttribute("booking");
		request.setAttribute("booking", b);
		session.setAttribute("booking", b);
	%>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class='col-sm-6 jumbotron'>

			<!-- <div class='page-header'>
				
			</div> -->
			<h2>Booking Summary</h2>
			<hr>
			<div class="well">
				<table>
					<col width="25%">
					<col width="25%">
					<tr>
						<td><span class="detailt">Movie</span></td>
						<td><span class="detail"><%=b.getMovie().getName()%></span></td>
					</tr>
					<tr>
						<td><span class="detailt">Date</span></td>
						<td><span class="detail"><%=b.getShow().getDate()%></span></td>
					</tr>
					<tr>
						<td><span class="detailt">Time</span></td>
						<td><span class="detail"><%=b.getShow().getTime()%></span></td>
					</tr>
					<tr>
						<td><span class="detailt">Seats</span></td>
						<td><span class="detail"> <%
 	String[] seats = b.getSeats();
 	for (int i = 0; i < seats.length; i++) {
 		out.print(" S" + seats[i]);
 	}
 %>
						</span></td>
					</tr>
				</table>
			</div>
			<div class="pricecontainer">

				<h4>
					<%=b.getSeats().length%>
					Tickets <span class="prices">Rs.<%=b.getShow().getPrice() * b.getSeats().length%></span>
				</h4>

				Taxes(14.5%) <span class="prices">Rs.<%=0.145 * b.getShow().getPrice() * b.getSeats().length%></span>
				<hr>
				<h4>
					Sub total<span class="prices"><b>Rs. <%=b.getShow().getPrice() * b.getSeats().length * 1.145%></b></span>
				</h4>

			</div>
			
			<div class="col-sm-12">
				<a id="print-button" href="print"><button>Make Payment</button></a>
			</div>
		</div>
		<div class="col-sm-4"></div>
	</div>
	<!-- jQuery -->
	<script type="text/javascript" src="<%=baseUrl%>resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script type="text/javascript"
		src="<%=baseUrl%>resources/js/bootstrap.min.js"></script>

</body>
</html>