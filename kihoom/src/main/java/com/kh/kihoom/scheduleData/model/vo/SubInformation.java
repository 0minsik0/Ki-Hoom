package com.kh.kihoom.scheduleData.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class SubInformation {
		
	//수정해야함
	    private String houseManageNo; //주택관리번호
	    private String pblancNo;  //공고번호
	    private String houseNm; //주택명
	    private String houseSecd; //주택구분코드
	    private String houseSecdNm; //주택구분코드명
	    private String houseDtlSecd; //주택상세구분코드
	    private String houseDtlSecdNm; //주택상세구분코드명
	    private String searchHouseSecd; //주택구분(0202오피스텔,0203민간임대)
	    private String hssplyZip; //공급위치우편번호
	    private String hssplyAddres; //공급위치주소
	    private int totSuplyHshldco; // 공급규모
	    private String rcritPblancDe; // 모집공고일
	    private String subscrptRceptBgnde; // 청약접수시작일
	    private String subscrptRceptEndde; // 청약접수종료일
	    private String przwnerPresnatnDe; // 당첨자발표일
	    private String cntrctCnclsBgnde; // 계약시작일
	    private String cntrctCnclsEndde; // 계약종료일
	    private String hmpgAdres; // 홈페이지주소
	    private String bsnsMbyNm; // 사업주체명(시행사)
	    private String mdhsTelno; // 문의처
	    private String mvnPrearngeYm; // 입주예정년월
	    private String pblancUrl; // 모집공고상세 URL
}
