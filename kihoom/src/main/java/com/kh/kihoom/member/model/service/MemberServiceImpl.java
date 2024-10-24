package com.kh.kihoom.member.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kihoom.member.model.dao.MemberDao;
import com.kh.kihoom.member.model.vo.Member;

import lombok.Getter;
import lombok.NoArgsConstructor;




@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override  //로그인
	public Member loginMember(Member m) {
		
		Member loginUser = mDao.loginMember(sqlSession, m);
		
		return loginUser;
		
	}

	@Override //회원가입
	public int insertMember(Member m) {
		int result=mDao.insertMember(sqlSession, m);
		
		return result;
	}


	@Override //로그인(카카오)
	public Member KakaoLogin(Member m) {

		return mDao.kakaoLogin(sqlSession, m);
	}
	
	

	@Override //아이디 중복확인
	public int idCheck(Member m) {
		return mDao.idCheck(sqlSession, m);
	}


	@Override //아이디 찾기
	public List<Member> findId(Member m) {

		return mDao.findId(sqlSession, m);
	}
	

	@Override //비밀번호 찾기
	public Member findPwd1(Member m) {

		return mDao.findPwd1(sqlSession, m);
	}

	
	public Member findKakaoId(String memId) {
		
		return mDao.findKakaoId;
	}

	
	@Override
	public int KakaoJoin(Member m) {
		return 0;
	}

	
	@Override
	public int updatePassword(Member m) {
		
	    return mDao.updatePassword(sqlSession, m);
	}

	// 회원정보 수정
	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(String memId) {
		return mDao.deleteMember(sqlSession, memId);
	}
	
	
}
