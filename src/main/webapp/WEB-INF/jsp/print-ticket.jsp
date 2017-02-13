<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@	page import="mypack.*"%>
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
<style>
.jumbotron {
	color: white;
	background-color: rgba(245, 47, 47, 0.84);
	overflow: visible;
	width: 30%;
	border-radius: 5px;
	padding-bottom: 10px;
}
.mticket {
    text-align: center;
    font-family: fantasy;
    font-size: large;
    color: aquamarine;
}
img {
	position: relative;
	top: 0px;
	height: 136px;
	float: left;
}
</style>
</head>
<body>
	<%
		Booking b = (Booking) request.getAttribute("booking");
	%>
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="jumbotron col-sm-6">
			<img alt="ticket" src="<%=baseUrl%>/resources/Images/ticket.ico">
			<span class="mticket">M-Ticket</span><br>
			Movie:
			<%=b.getMovie().getName()%><br> Date:
			<%=b.getShow().getDate()%><br> Show time:
			<%=b.getShow().getTime()%><br> Seats:
			<%
				String[] seats = b.getSeats();
				for (int i = 0; i < seats.length; i++)
					out.print(" S" + seats[i]);
			%>
			<br> Amount: Rs.
			<%=b.getShow().getPrice() * b.getSeats().length * 1.145%>
			<br>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<!-- jQuery -->
	<script type="text/javascript" src="<%=baseUrl%>resources/js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script type="text/javascript"
		src="<%=baseUrl%>resources/js/bootstrap.min.js"></script>
</body>
</html>