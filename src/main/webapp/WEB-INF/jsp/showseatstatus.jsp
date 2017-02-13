<%@page import="mypack.Show"%>
<div class="row" style="background-color:rgba(176, 218, 208, 0.16)">
	
	<div class="container-fluid col-sm-12">
	
	<h3>Pick your Seats</h3>
	
	<hr>
		<div class="seatscontainer">
			<span class="screen">Screen</span>
			<br/><br/>
			<%
				String url = request.getRequestURL().toString();
				String baseUrl = url.substring(0, url.length() - request.getRequestURI().length())
						+ request.getContextPath() + "/";

				Show show = (Show) request.getAttribute("show");
				String seatstatus = show.getSeatstatus();

				out.print("<form action='" + baseUrl + "payment' method='get'>");
				int jmax;
				for (int i = 0, k = 0; i < 8; i++) {
					
					out.print("<span class='vertical rownumber'>S"+i+"</span>");
					
					if (i < 2 || i == 7){
						jmax = 8; out.print("<span style='padding-left:32px'></span>");
					}
					else
						jmax = 10;

					for (int j = 0; j < jmax; j++) {
					
						if (j == jmax / 2)
							out.print("<span style='padding-left:20px'></span>");
						if (seatstatus.charAt(k++) == '1') {
							out.print(
									"<input type='checkbox' id='cb" + (k - 1) + "' name='seat' value='" + (k - 1) + "'> ");
							out.print("<label for='cb" + (k - 1) + "'></label>");
						} else {
							out.print("<input type='checkbox' class='disabledcheckbox' id='cb" + (k - 1)
									+ "' name='seat' disabled='disabled'> ");
							out.print("<label for='cb" + (k - 1) + "'></label>");
							//out.print("<input type='checkbox' checked='checked' disabled='disabled' > ");
						}

					}
					
					if (i < 2 || i == 7){
						jmax = 8; out.print("<span style='padding-left:32px'></span>");
					}
					
					out.print("<br/>");
				}
				out.print("<hr>");
				out.print("<input type='hidden' name='showid' value='" + show.getShowid() + "'>");
				out.print("<input type='submit' value='Book Seats'>");
			%>

		</div>

	</div>
</div>

</form>
