package com.kh.kihoom.acountBook.model.service;

import java.util.ArrayList;

import com.kh.kihoom.acountBook.model.vo.Acount;
import com.kh.kihoom.common.model.vo.PageInfo;

public interface AcountService {
	
	// 로그인한 사용자 인증 서비스
	
	// 인증한사람 토큰 발급 서비스
	
	// 가게부 리스트 페이지 서비스 (페이징처리)
	int selectListCount();
	ArrayList<Acount> selectList(PageInfo pi);
	
	// 입금,출금 내역 수기 작성 서비스
	int insertAcountBook(Acount a);
	

}
