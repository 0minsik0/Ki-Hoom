package com.kh.kihoom.account.vo;

import java.util.List;

public class Account {
	private String apiTranId;
	private String apiTranDtm;
	private String rspCode;
	private String rspMessage;
	private String userSeqNo;
	private String userCi;
	private String userName;
	private String resCnt;
	private List<AccountDetails> resList; // 여러 계좌 정보를 담기 위한 리스트
	private String inquiryCardCnt;
	private List<Object> inquiryCardList; // 카드 정보
	private String inquiryPayCnt;
	private List<Object> inquiryPayList; // 결제 정보
	private String inquiryInsuranceCnt;
	private List<Object> inquiryInsuranceList; // 보험 정보
	private String inquiryLoanCnt;
	private List<Object> inquiryLoanList; // 대출 정보
	
	public Account () {}

	public Account(String apiTranId, String apiTranDtm, String rspCode, String rspMessage, String userSeqNo,
			String userCi, String userName, String resCnt, List<AccountDetails> resList, String inquiryCardCnt,
			List<Object> inquiryCardList, String inquiryPayCnt, List<Object> inquiryPayList, String inquiryInsuranceCnt,
			List<Object> inquiryInsuranceList, String inquiryLoanCnt, List<Object> inquiryLoanList) {
		super();
		this.apiTranId = apiTranId;
		this.apiTranDtm = apiTranDtm;
		this.rspCode = rspCode;
		this.rspMessage = rspMessage;
		this.userSeqNo = userSeqNo;
		this.userCi = userCi;
		this.userName = userName;
		this.resCnt = resCnt;
		this.resList = resList;
		this.inquiryCardCnt = inquiryCardCnt;
		this.inquiryCardList = inquiryCardList;
		this.inquiryPayCnt = inquiryPayCnt;
		this.inquiryPayList = inquiryPayList;
		this.inquiryInsuranceCnt = inquiryInsuranceCnt;
		this.inquiryInsuranceList = inquiryInsuranceList;
		this.inquiryLoanCnt = inquiryLoanCnt;
		this.inquiryLoanList = inquiryLoanList;
	}

	public String getApiTranId() {
		return apiTranId;
	}

	public void setApiTranId(String apiTranId) {
		this.apiTranId = apiTranId;
	}

	public String getApiTranDtm() {
		return apiTranDtm;
	}

	public void setApiTranDtm(String apiTranDtm) {
		this.apiTranDtm = apiTranDtm;
	}

	public String getRspCode() {
		return rspCode;
	}

	public void setRspCode(String rspCode) {
		this.rspCode = rspCode;
	}

	public String getRspMessage() {
		return rspMessage;
	}

	public void setRspMessage(String rspMessage) {
		this.rspMessage = rspMessage;
	}

	public String getUserSeqNo() {
		return userSeqNo;
	}

	public void setUserSeqNo(String userSeqNo) {
		this.userSeqNo = userSeqNo;
	}

	public String getUserCi() {
		return userCi;
	}

	public void setUserCi(String userCi) {
		this.userCi = userCi;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getResCnt() {
		return resCnt;
	}

	public void setResCnt(String resCnt) {
		this.resCnt = resCnt;
	}

	public List<AccountDetails> getResList() {
		return resList;
	}

	public void setResList(List<AccountDetails> resList) {
		this.resList = resList;
	}

	public String getInquiryCardCnt() {
		return inquiryCardCnt;
	}

	public void setInquiryCardCnt(String inquiryCardCnt) {
		this.inquiryCardCnt = inquiryCardCnt;
	}

	public List<Object> getInquiryCardList() {
		return inquiryCardList;
	}

	public void setInquiryCardList(List<Object> inquiryCardList) {
		this.inquiryCardList = inquiryCardList;
	}

	public String getInquiryPayCnt() {
		return inquiryPayCnt;
	}

	public void setInquiryPayCnt(String inquiryPayCnt) {
		this.inquiryPayCnt = inquiryPayCnt;
	}

	public List<Object> getInquiryPayList() {
		return inquiryPayList;
	}

	public void setInquiryPayList(List<Object> inquiryPayList) {
		this.inquiryPayList = inquiryPayList;
	}

	public String getInquiryInsuranceCnt() {
		return inquiryInsuranceCnt;
	}

	public void setInquiryInsuranceCnt(String inquiryInsuranceCnt) {
		this.inquiryInsuranceCnt = inquiryInsuranceCnt;
	}

	public List<Object> getInquiryInsuranceList() {
		return inquiryInsuranceList;
	}

	public void setInquiryInsuranceList(List<Object> inquiryInsuranceList) {
		this.inquiryInsuranceList = inquiryInsuranceList;
	}

	public String getInquiryLoanCnt() {
		return inquiryLoanCnt;
	}

	public void setInquiryLoanCnt(String inquiryLoanCnt) {
		this.inquiryLoanCnt = inquiryLoanCnt;
	}

	public List<Object> getInquiryLoanList() {
		return inquiryLoanList;
	}

	public void setInquiryLoanList(List<Object> inquiryLoanList) {
		this.inquiryLoanList = inquiryLoanList;
	}

	@Override
	public String toString() {
		return "Account [apiTranId=" + apiTranId + ", apiTranDtm=" + apiTranDtm + ", rspCode=" + rspCode
				+ ", rspMessage=" + rspMessage + ", userSeqNo=" + userSeqNo + ", userCi=" + userCi + ", userName="
				+ userName + ", resCnt=" + resCnt + ", resList=" + resList + ", inquiryCardCnt=" + inquiryCardCnt
				+ ", inquiryCardList=" + inquiryCardList + ", inquiryPayCnt=" + inquiryPayCnt + ", inquiryPayList="
				+ inquiryPayList + ", inquiryInsuranceCnt=" + inquiryInsuranceCnt + ", inquiryInsuranceList="
				+ inquiryInsuranceList + ", inquiryLoanCnt=" + inquiryLoanCnt + ", inquiryLoanList=" + inquiryLoanList
				+ "]";
	}
	
	
}
