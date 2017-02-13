<%	
	String url1 = request.getRequestURL().toString();
	String baseUrl1 = url1.substring(0, url1.length() - request.getRequestURI().length())+ request.getContextPath() + "/";
%>

<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=baseUrl1%>">MovieTime</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="<%=baseUrl1%>#now-showing">Now Showing</a>
                    </li>
                    <li>
                        <a href="<%=baseUrl1%>#top-chart">Top Chart</a>
                    </li>
                    <li>
                        <a href="<%=baseUrl1%>#trailers">Trailers</a>
                    </li>
                    <li>
                        <a href="<%=baseUrl1%>admin">Admin</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
