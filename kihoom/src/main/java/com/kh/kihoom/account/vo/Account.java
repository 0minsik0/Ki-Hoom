package com.kh.kihoom.account.vo;

import java.util.List;

public class Account {
	private StringBuilder accList;
	
	public Account () {}

	public Account(StringBuilder accList) {
		super();
		this.accList = accList;
	}

	public StringBuilder getAccList() {
		return accList;
	}

	public void setAccList(StringBuilder accList) {
		this.accList = accList;
	}

	@Override
	public String toString() {
		return "Account [accList=" + accList + "]";
	}

	
}
