package com.kh.kihoom.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kihoom.member.model.vo.Member;


@Repository
public class MemberDao {

	
	

	//로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
		
	}
	
	
	//회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
		
	}
	

	//아이디 중복확인
	public int idCheck(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.idCheck", m);
	}
	
	//아이디 찾기
	public List<Member> findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("memberMapper.findId", m);
	}
	

	
	//비밀번호 찾기
	public Member findPwd1(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findPwd", m);
	}

	
	public Member kakaoLogin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.kakaoLogin", m);
	}
	
	public Member findKakaoId(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("memberMapper.findKakaoId", 뭐로하지?);
	};
	
	public int kakaoJoin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.kakaoJoin", m);
	}
	
	public int updatePassword(SqlSessionTemplate sqlSession, Member m) {
	    return sqlSession.update("memberMapper.updatePwd", m);
	}
	
}
