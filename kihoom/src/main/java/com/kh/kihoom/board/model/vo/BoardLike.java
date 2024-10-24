package com.kh.kihoom.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class BoardLike {
	
	private int boardNo;
	private int likeCount;
	private String memNo;
	private int likeCheck;

}
