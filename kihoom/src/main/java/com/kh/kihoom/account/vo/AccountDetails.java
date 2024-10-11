package com.kh.kihoom.account.vo;

public class AccountDetails {
	
	private String fintechUseNum;
	private String accountAlias;
	private String bankCodeStd;
	private String bankCodeSub;
	private String bankName;
	private String savingsBankName;
	private String accountNumMasked;
	private String accountSeq;
	private String accountHolderName;
	private String accountHolderType;
	private String accountType;
	private String inquiryAgreeYn;
	private String inquiryAgreeDtime;
	private String transferAgreeYn;
	private String transferAgreeDtime;
	private String payerNum;
	
	public AccountDetails() {}

	public AccountDetails(String fintechUseNum, String accountAlias, String bankCodeStd, String bankCodeSub,
			String bankName, String savingsBankName, String accountNumMasked, String accountSeq,
			String accountHolderName, String accountHolderType, String accountType, String inquiryAgreeYn,
			String inquiryAgreeDtime, String transferAgreeYn, String transferAgreeDtime, String payerNum) {
		super();
		this.fintechUseNum = fintechUseNum;
		this.accountAlias = accountAlias;
		this.bankCodeStd = bankCodeStd;
		this.bankCodeSub = bankCodeSub;
		this.bankName = bankName;
		this.savingsBankName = savingsBankName;
		this.accountNumMasked = accountNumMasked;
		this.accountSeq = accountSeq;
		this.accountHolderName = accountHolderName;
		this.accountHolderType = accountHolderType;
		this.accountType = accountType;
		this.inquiryAgreeYn = inquiryAgreeYn;
		this.inquiryAgreeDtime = inquiryAgreeDtime;
		this.transferAgreeYn = transferAgreeYn;
		this.transferAgreeDtime = transferAgreeDtime;
		this.payerNum = payerNum;
	}

	public String getFintechUseNum() {
		return fintechUseNum;
	}

	public void setFintechUseNum(String fintechUseNum) {
		this.fintechUseNum = fintechUseNum;
	}

	public String getAccountAlias() {
		return accountAlias;
	}

	public void setAccountAlias(String accountAlias) {
		this.accountAlias = accountAlias;
	}

	public String getBankCodeStd() {
		return bankCodeStd;
	}

	public void setBankCodeStd(String bankCodeStd) {
		this.bankCodeStd = bankCodeStd;
	}

	public String getBankCodeSub() {
		return bankCodeSub;
	}

	public void setBankCodeSub(String bankCodeSub) {
		this.bankCodeSub = bankCodeSub;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getSavingsBankName() {
		return savingsBankName;
	}

	public void setSavingsBankName(String savingsBankName) {
		this.savingsBankName = savingsBankName;
	}

	public String getAccountNumMasked() {
		return accountNumMasked;
	}

	public void setAccountNumMasked(String accountNumMasked) {
		this.accountNumMasked = accountNumMasked;
	}

	public String getAccountSeq() {
		return accountSeq;
	}

	public void setAccountSeq(String accountSeq) {
		this.accountSeq = accountSeq;
	}

	public String getAccountHolderName() {
		return accountHolderName;
	}

	public void setAccountHolderName(String accountHolderName) {
		this.accountHolderName = accountHolderName;
	}

	public String getAccountHolderType() {
		return accountHolderType;
	}

	public void setAccountHolderType(String accountHolderType) {
		this.accountHolderType = accountHolderType;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getInquiryAgreeYn() {
		return inquiryAgreeYn;
	}

	public void setInquiryAgreeYn(String inquiryAgreeYn) {
		this.inquiryAgreeYn = inquiryAgreeYn;
	}

	public String getInquiryAgreeDtime() {
		return inquiryAgreeDtime;
	}

	public void setInquiryAgreeDtime(String inquiryAgreeDtime) {
		this.inquiryAgreeDtime = inquiryAgreeDtime;
	}

	public String getTransferAgreeYn() {
		return transferAgreeYn;
	}

	public void setTransferAgreeYn(String transferAgreeYn) {
		this.transferAgreeYn = transferAgreeYn;
	}

	public String getTransferAgreeDtime() {
		return transferAgreeDtime;
	}

	public void setTransferAgreeDtime(String transferAgreeDtime) {
		this.transferAgreeDtime = transferAgreeDtime;
	}

	public String getPayerNum() {
		return payerNum;
	}

	public void setPayerNum(String payerNum) {
		this.payerNum = payerNum;
	}

	@Override
	public String toString() {
		return "AccountDetails [fintechUseNum=" + fintechUseNum + ", accountAlias=" + accountAlias + ", bankCodeStd="
				+ bankCodeStd + ", bankCodeSub=" + bankCodeSub + ", bankName=" + bankName + ", savingsBankName="
				+ savingsBankName + ", accountNumMasked=" + accountNumMasked + ", accountSeq=" + accountSeq
				+ ", accountHolderName=" + accountHolderName + ", accountHolderType=" + accountHolderType
				+ ", accountType=" + accountType + ", inquiryAgreeYn=" + inquiryAgreeYn + ", inquiryAgreeDtime="
				+ inquiryAgreeDtime + ", transferAgreeYn=" + transferAgreeYn + ", transferAgreeDtime="
				+ transferAgreeDtime + ", payerNum=" + payerNum + "]";
	}
	
	

}
