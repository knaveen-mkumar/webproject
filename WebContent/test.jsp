<%@page import="java.util.Stack"%>
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
<title>Insert title here</title>
</head>
<body>
	<form action="">
		<input type="text" name="sq"> <input type="submit"
			name="get" value="Get Book">
	</form>
	<%
		if (request.getParameter("get") != null) {
			String sq = request.getParameter("sq");
			String sqs[] = sq.split(" ");
			DAO dao = new DBImplementation();
			ArrayList<HashMap<String,String>> tokens = new ArrayList<>();
			System.out.println(sq);
			for(String s : sqs){
				HashMap<String,String> hashMap = new HashMap<>();
				String query = "select * from tokens where scemantic= '"
							+ s +"'";
				out.println(query+"<br>");
				System.out.println(query+"<br>");
				ResultSet resultSet = dao.getData(query);
				try {
					if (resultSet.next()) {
						hashMap.put("token",resultSet.getString("token"));
						hashMap.put("type",resultSet.getString("type"));
						tokens.add(hashMap);
					}
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
				
				query = "select * from books ";
				String whereClause = " where ";
				String joinClause = " inner join categories on categories.categoryId=books.categoryId ";
				boolean isJoin = false;
				if(tokens.size()!=0){
					HashMap<String,String> map = tokens.get(0);
					if(map.get("type").equals("category")){
						isJoin = true;
					}
					whereClause += map.get("type") + "='"+map.get("token")+"'";
					for(int i=1;i<tokens.size();i++){
						map = tokens.get(i);
						if(map.get("type").equals("category")){
							isJoin = true;
						}
						whereClause += " and "+map.get("type") + "='"+map.get("token")+"'";
					}
				}
				if(isJoin){
					query += joinClause;
				}
				query += whereClause;
				out.print(query+"<br>");
				resultSet = dao.getData(query);
				while(resultSet.next()){
					out.print(resultSet.getString("book")+"<br>");
				}
			}
			dao.closeConnection();
		}
	%>
</body>
</html>