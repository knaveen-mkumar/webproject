package com.irko.model;

public class Token {
	private int tokenId;
	private String token;
	private String type;
	public int getTokenId() {
		return tokenId;
	}
	public void setTokenId(int tokenId) {
		this.tokenId = tokenId;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return getType();
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		Token t = (Token) obj;
		return t.getType().equals(getType());
	}
}
