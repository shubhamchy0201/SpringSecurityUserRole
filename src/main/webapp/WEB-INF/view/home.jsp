<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>

<head>
	<title>XYZ Company Home Page</title>
	<style>
	body{
	 text-align:center;
      font-size:20px;
       width: 50%;
          height: 42%;
          padding: 40px; /* set padding for all four sides */
          border: 3px solid #5A20CB; /* set border for all four sides */
          border-radius:30px;
          margin: 200px 400px;
          border-style: ridge;
          background-color:hsla(50, 33%, 25%, .75);
	}
	.private{

	}
	h1,p{
	Color:black;
	}
	</style>
</head>

<body>
	<h1>XYZ Company Home Page</h1>
	<hr>
	
	<p>
	Welcome to the XYZ company home page!
	</p>

	<hr>
	
	<!-- display user name and role -->
	
	<p>
		User: <security:authentication property="principal.username" />
		<br><br>
		Role(s): <security:authentication property="principal.authorities" />
	</p>
	
	<hr>
	<div class="private">
	<security:authorize access="hasRole('MANAGER')">

    		<!-- Add a link to point to /leaders ... this is for the managers -->

    		<p>
    			<a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
    			(Only for Manager peeps)
    		</p>

    	</security:authorize>


    	<security:authorize access="hasRole('ADMIN')">

    		<!-- Add a link to point to /systems ... this is for the admins -->

    		<p>
    			<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
    			(Only for Admin peeps)
    		</p>

    	</security:authorize>
	
	</div>

	
	
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
	
		<input type="submit" value="Logout" />
	
	</form:form>
	
</body>

</html>









