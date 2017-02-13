<%@page import="mypack.Show,java.util.*"%>
<div class="row">
	<div class="col-sm-4">
		<h3>Select Show</h3>
	</div>
	
	<div class="container-fluid col-sm-7">
		<div class="tb">

			<%
				List<Show> list = (List<Show>) session.getAttribute("showlist2");
				ListIterator<Show> itr = list.listIterator();
				while (itr.hasNext()) {
					Show s = itr.next();
					out.print("<button type='button' class='button timebutton' id='button" + s.getShowid()
							+ "' onclick='sendInfo2(`" + s.getShowid() + "`)'>" + s.getTime().toString().substring(0, 5)
							+ "  <span class='cost'><span class='glyphicon fa fa-inr'></span> " + s.getPrice() + "</span></button>  ");
				}
			%>
		</div>

	</div>
</div>


<%-- <%@page import="mypack.Show,java.util.*"%>
<div class="row">
	<div class="col-sm-4">
		<h3>Select Show</h3>
	</div>
	
	<div class="container-fluid col-sm-8">
		<div class="tb">

			<%
				List<Show> list = (List<Show>) session.getAttribute("showlist2");
				ListIterator<Show> itr = list.listIterator();
				while (itr.hasNext()) {
					Show s = itr.next();
					out.print("<button type='button' class='button timebutton' id='button" + s.getShowid()
							+ "' onclick='sendInfo2(`" + s.getShowid() + "`)'>" + s.getTime().toString().substring(0, 5)
							+ "  <span class='cost'><span class='glyphicon fa fa-inr'></span> " + s.getPrice() + "</span></button>  ");
				}
			%>
		</div>

	</div>
</div>

 --%>
