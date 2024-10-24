package com.kh.kihoom.acountBook.model.service;

import java.util.ArrayList;

import org.json.simple.JSONObject;

import com.kh.kihoom.acountBook.model.vo.Acount;
import com.kh.kihoom.common.model.vo.PageInfo;
import com.kh.kihoom.member.model.vo.Member;

public interface AcountService {
	
	// 로그인한 사용자 인증 서비스
	
	// 인증한사람 토큰 발급 서비스
	
	// 가게부 리스트 페이지 서비스 (페이징처리)
	int selectListCount(int memNo);
	ArrayList<Acount> selectList(PageInfo pi, int memNo);
	
	// 입금,출금 내역 수기 작성 서비스
	int insertAcountBook(Acount a);
	
	// 월별 총 입출금 내역
	ArrayList<Acount> totalList(int memNo);
	
	// 월별 출금내역(현금/카드)
	ArrayList<Acount> mOutList(Acount a);
	
	ArrayList<Acount> mInList(Acount a);
	
	ArrayList<Acount> monthList(int memNo);
	
	ArrayList<Acount> weekTotalListOut(Acount a);
	
	ArrayList<Acount> weekTotalListIn(Acount a);
	

}
