<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.irko.dao.DBImplementation"%>
<%@page import="com.irko.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IRKO</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Style-CSS -->
</head>
<body>
	<div id="viewport">
		<div class="content">
		<div class="img-container">
			<img src="images/a.png">
		</div>
		<div class="form-container">
			<form action="search.jsp">
				<div class="form-inp">
					<input type="text" name="q" required title="search"
						placeholder="Search" class="searchtext">
				</div>
				<div class="form-sbm">
					<input type="submit" name="search" value="Search"
						class="btn-submit">
				</div>
			</form>
		</div>
		</div>
	</div>
</body>
</html>