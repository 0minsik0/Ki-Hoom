package com.kh.kihoom.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Board {
	private int boardNo;
	private String boardTitle;
	private int memNo;
	private String boardWriter;
	private String boardContent;
	private String createDate;
	private String status;
	private int boardLike;
	private int boardCount;
	private int bCategoryNo;
	private String categoryName;
}
