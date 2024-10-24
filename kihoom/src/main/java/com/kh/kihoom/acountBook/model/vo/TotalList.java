package com.kh.kihoom.acountBook.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class TotalList {
	
	private String paymentDate;
	private int inAmount;
	private int outAmount;

}
