<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="mypack.Show,java.util.*,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String url = request.getRequestURL().toString();
	String baseUrl = url.substring(0, url.length() - request.getRequestURI().length())
			+ request.getContextPath() + "/";

	List<Show> list = (List<Show>) session.getAttribute("showlist");
	//for(Show s:list)System.out.print(s.getDate()+" ");System.out.println("");
	Collections.sort(list);

	//for(Show s:list) System.out.print(s.getDate()+" ");System.out.println("");
	ListIterator<Show> itr = list.listIterator();
	Set<Date> dateset = new LinkedHashSet<Date>();
	while (itr.hasNext()) {
		Show s = itr.next();
		dateset.add(s.getDate());
		//System.out.print(s.getDate()+" ");
	}
	Iterator<Date> itr2 = dateset.iterator();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.container-fluid {
	padding: 30px;
	text-align: center;
}
/* .db,.tb{
	float:right;
} */
.button {
	margin: 10px;
	font-size: medium;
	background-color: white;
	border-color: #5bc0de;
	color: #5bc0de;
	max-width: 150px;
	font-size: medium;
	border-radius: 12px;
}

h3 {
	padding: 40px;
	padding-left: 70px;
}

.datebutton:hover {
	background-color: #5bc0de;
	color: white;
}

button:FOCUS {
	transition: shadow 2s, transform 1s, background-color 3s, color 2s;
	outline: none;
}

.cost {
	font-size: x-small;
	color: gray;
}

.tb {
	padding: 10px;
}

.timebutton {
	padding: 10px;
}

.screen {
	background-color: grey;
	padding-left: 50px;
	padding-right: 50px;
}

.rownumber {
	color: #c77e7e;
	font-size: xx-small;
}

hr {
	width: 50%;
}

.vertical {
	transform: rotate(270deg);
}

input[type=submit] {
	background-color: #5bc0de;
	border: none font-size:medium;
	padding: 10px;
	color: white;
}
/*** custom checkboxes ***/
input[type=checkbox] {
	display: none;
} /* to hide the checkbox itself */
input[type=checkbox]+label:before {
	font-family: FontAwesome;
	display: inline-block;
}

input[type=checkbox]+label:before {
	content: "\f096";
	color: #5bc0de;
} /* unchecked icon */
input[type=checkbox]+label:before {
	letter-spacing: 10px;
} /* space between checkbox and label */
input[type=checkbox]:checked+label:before {
	content: "\f0c8";
	color: #5bc0de;
} /* checked icon */
input[type=checkbox]:disabled+label:before {
	content: "\f0c8";
	color: #d5d0d0;
} /* checked icon */
.seatscontainer label {
	font-size: 30px;
}
</style>
<!-- Bootstrap Core CSS -->

<link
	href="<%=baseUrl %>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template CSS -->
<link
	href="<%=baseUrl %>/resources/css/modern-business.css"
	rel="stylesheet">
<!-- Theme CSS -->
<link href="<%=baseUrl %>/resources/css/custom.css"
	rel="stylesheet">
<!-- Datepicker CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

<!-- Custom Fonts -->
<link
	href="<%=baseUrl %>/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View slots</title>
</head>
<body <%Date firstdate = itr2.next();
			boolean first = true;%>
	onload=<%="document.getElementById('button" + firstdate + "').click()"%>>
	<%@include file="navigation-bar.jsp"%>
	<div class="row">

		<div class="col-sm-4">
			<h3>Choose Date</h3>
		</div>
		<div class="container-fluid col-sm-7">
			<div class="db">
				<%
					while (itr2.hasNext()) {
						Date d;
						if (!first)
							d = itr2.next();
						else
							d = firstdate;
						first = false;
						out.print("<button type='button' class='button datebutton' id='button" + d.toString()
								+ "' onclick='sendInfo(`" + d.toString() + "`)'>");
						out.print(d + " " + new SimpleDateFormat("EE").format(d) + "</button> ");
					}
				%>
			</div>

		</div>
	</div>

	<div id="1"></div>
	<div id="2"></div>


	<!-- jQuery -->
	<script type="text/javascript" src="<%=baseUrl%>resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script type="text/javascript"
		src="<%=baseUrl%>resources/js/bootstrap.min.js"></script>

	<!-- custom script -->
	<script type="text/javascript" src="<%=baseUrl%>resources/js/custom.js"></script>

</body>
</html>