package com.irko.model;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.irko.dao.Constants;
import com.irko.dao.DAO;
import com.irko.dao.DBImplementation;

public class Search {
	private String q;
	private ArrayList<Token> whereTokens;
	private ArrayList<String> selectTokens;
	private List<String> fields;
	private String genQuery;

	public Search() {
		// TODO Auto-generated constructor stub
		whereTokens = new ArrayList<Token>();
		selectTokens = new ArrayList<String>();
		fields = Arrays.asList(Constants.FIELDS);
	}

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}

	public String getGenQuery() {
		return genQuery;
	}

	public void processQueryString() {
		DAO dao = new DBImplementation();
		System.out.println(q);
		//q = q.replaceAll("[^a-zA-Z0-9]", "");
		String qs[] = getQ().split(" ");
		String query = "";
		for (String s : qs) {
			query = "select * from tokens where scemantics = '" + s + "'";
			System.out.println(query);
			ResultSet resultSet = dao.getData(query);
			try {
				if (resultSet.next()) {
					String token = resultSet.getString("token");
					if (token.equals("count")) {
						token += "(*) as c";
					}
					
					if (fields.contains(token)) {
						selectTokens.add(token);
					} else {
						Token t = new Token();
						t.setToken(token);
						t.setType(resultSet.getString("type"));
						whereTokens.add(t);
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		genQuery = generateQuery();
		dao.closeConnection();
	}

	private String generateQuery() {

		String selectClause = "";
		String whereClause = "";
		String fromClause = " from books ";
		if (selectTokens.size() == 0) {
			selectClause = " * ";
		} else {
			selectClause = selectTokens.toString();
			int len = selectClause.length();
			selectClause = selectClause.substring(1, len - 1) + " ";
		}
		if (whereTokens.size() != 0) {
			whereClause = " where " + whereTokens.get(0).getType() + " = '" + whereTokens.get(0).getToken()+"' ";
			for (int i = 1; i < whereTokens.size(); i++) {
				whereClause += " and " + whereTokens.get(i).getType() + " = '" + whereTokens.get(i).getToken()+"' ";
			}
		}
		Token ct = new Token();
		ct.setType("category");
		if (whereTokens.contains(ct)) {
			fromClause += " inner join category on category.categoryId=books.categoryId ";
		}
		String query = "select " + selectClause + fromClause + whereClause;
		return query;
	}

	public ArrayList<Book> getBooks() {
		ArrayList<Book> books = new ArrayList<Book>();
		DAO dao = new DBImplementation();
		System.out.println(genQuery);
		ResultSet resultSet = dao.getData(genQuery);

		try {
			if (selectTokens.size() == 0) {
				while (resultSet.next()) {
					Book book = new Book();
					book.setBookId(resultSet.getInt("bookId"));
					book.setAuthor(resultSet.getString("author"));
					book.setBookName(resultSet.getString("bookName"));
					book.setPrice(resultSet.getFloat("price"));
					book.setImage(resultSet.getString("image"));
					books.add(book);
				}
			}
			else {
				while (resultSet.next()) {
					Book book = new Book();
					if(selectTokens.contains("bookId"))
						book.setBookId(resultSet.getInt("bookId"));
					if(selectTokens.contains("author"))
						book.setAuthor(resultSet.getString("author"));
					if(selectTokens.contains("bookName"))
						book.setBookName(resultSet.getString("bookName"));
					if(selectTokens.contains("price"))
						book.setPrice(resultSet.getFloat("price"));
					if(selectTokens.contains("count(*) as c"))
						book.setCount(resultSet.getInt("c"));
					if(selectTokens.contains("image"))
						book.setImage(resultSet.getString("image"));
					books.add(book);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dao.closeConnection();
		return books;
	}
}
