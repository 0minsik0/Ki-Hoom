package com.kh.kihoom.acountBook.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 생성자
@Setter
@Getter
@ToString
public class Acount {
	
	private int memNo; // 유저 번호
	private String paymentDate; // 결제날짜 
	private String dealDivide; // 거래 구분
	private String dealType; // 거래 유형
	private String compendiums; // 결제내역명
	private int amount; // 금액

}
