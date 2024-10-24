package com.kh.kihoom.member.model.vo;

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
public class Member {
	
	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String email;
	private String phone;
	private String birth;
	private Date enrollDate;
	private String status;
	private String snsId;

	
}
