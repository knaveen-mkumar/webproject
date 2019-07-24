<%@page import="com.irko.model.Book"%>
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
<title>IRKO-Search</title>
<link href="css/searchstyle.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Style-CSS -->
</head>
<body>
	<jsp:useBean id="search" class="com.irko.model.Search" ></jsp:useBean>
	<jsp:setProperty property="*" name="search"/>
	<div id="viewport">
		<form>
			<div class="logo">
				<img src="images/a.png" height="40" width="100"> 
			</div>
			<div class="form-inp">
				<input type="text" name="q" required title="search"
					placeholder="Search" class="searchtext"
					value='<jsp:getProperty property="q" name="search"/>'>
					<button type="submit">
						<img alt="" src="images/search.png">
					</button>
			</div>
		</form>
		<hr>
		<%
			search.processQueryString();
			ArrayList<Book> books = search.getBooks();
		%>
		<h4 style="margin-left: 100px"><%= books.size() %> Results found</h4>
		<div class="content">
			<%
				for(Book book:books){
			%>
			<div class="result">
				<table>
					<tr>
						<%
							if(!book.getImage().equals("")){
						%>
							<th>
								<img src="bookimages/<%= book.getImage()%>" class="thumbnail">
							</th>
						<%		
							}
						%>
						<td style="padding-left: 10px">
							<table>
								<tr>
									<td>
										<%= book.getBookName() %>
									</td>
								</tr>
								<tr>
									<td>
										<%= book.getAuthor() %>
									</td>
								</tr>
								<tr>
									<td>
										Rs. <%= book.getPrice() %> /-
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>