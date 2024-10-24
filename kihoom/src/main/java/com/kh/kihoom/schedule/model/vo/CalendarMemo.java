package com.kh.kihoom.schedule.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor  // 기본생성자
@AllArgsConstructor   //전체 매개변수 생성
@Setter              //setter취급
@Getter              //getter
@ToString          //tostring
public class CalendarMemo {  //캘린더 일반 메모
	
	private int memoNo;				//메모 고유 번호
	private String memoTitle;		//메모 제목
	private String memoContent;		//메모 내용
	private Date createDate;		//작성일
	private String status;			//회원 고유 번호
	private int memNo;				//메모 상태
	private Date memoDate;          //메모 (해당 캘린더 날짜)
}
