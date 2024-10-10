package com.kh.kihoom.board.model.vo;

import java.sql.Date;

public class Board {
	
	private int boardNo;
	private String boardTitle;
	private int memNo;
	private String boardWriter;
	private String boardContent;
	private Date createDate;
	private String status;
	private int boardCount;
	private int bcategoryNo;
	private int declarationCount;
	
	public Board() {}

	public Board(int boardNo, String boardTitle, int memNo, String boardWriter, String boardContent, Date createDate,
			String status, int boardCount, int bcategoryNo, int declarationCount) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.memNo = memNo;
		this.boardWriter = boardWriter;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.status = status;
		this.boardCount = boardCount;
		this.bcategoryNo = bcategoryNo;
		this.declarationCount = declarationCount;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public int getBcategoryNo() {
		return bcategoryNo;
	}

	public void setBcategoryNo(int bcategoryNo) {
		this.bcategoryNo = bcategoryNo;
	}

	public int getDeclarationCount() {
		return declarationCount;
	}

	public void setDeclarationCount(int declarationCount) {
		this.declarationCount = declarationCount;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", memNo=" + memNo + ", boardWriter="
				+ boardWriter + ", boardContent=" + boardContent + ", createDate=" + createDate + ", status=" + status
				+ ", boardCount=" + boardCount + ", bcategoryNo=" + bcategoryNo + ", declarationCount="
				+ declarationCount + "]";
	}
	
	

}
