package com.irko.model;

import java.util.ArrayList;

public class test {
	public static void main(String[] args) {
		ArrayList<Integer> integers = new ArrayList<Integer>();
		for(int i=0;i<10;i++) {
			integers.add(i);
		}
		System.out.println(integers.toString().substring(1,integers.toString().length()-1));
	}
}
