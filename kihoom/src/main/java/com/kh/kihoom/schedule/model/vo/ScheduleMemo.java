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
public class ScheduleMemo {  //캘린더 청약정보 관련 메모
	
	private int memoNo;             //메모 고유 번호
	private String memoTitle;   	//메모 제목
	private String memoContent; 	//메모 내용
	private Date createDate;		//메모 작성일
	private String status;			//메모 상태(status)
	private int memNo;				//회원번호
	private int subNo;				//청약청보 번호
		
}
