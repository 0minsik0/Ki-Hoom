package com.kh.kihoom.member.model.service;

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


	@Override //아이디 중복확인
	public int idCheck(String checkId) {
		return mDao.idCheck(sqlSession, checkId);
	}

	@Override //아이디 찾기
	public Member findId(Member m) {

		return mDao.findId(sqlSession, m);
	}

	@Override //비밀번호 찾기
	public Member findPwd(Member m) {

		return mDao.findPwd(sqlSession, m);
	}
	
	/*
	@Getter
	@NoArgsConstructor //역직렬화를 위한 기본 생성자
	@JsonIgnoreProperties(ignoreUnknown = true)
	public class KakaoTokenResponseDto {

	    @JsonProperty("token_type")
	    public String tokenType;
	    @JsonProperty("access_token")
	    public String accessToken;
	    @JsonProperty("id_token")
	    public String idToken;
	    @JsonProperty("expires_in")
	    public Integer expiresIn;
	    @JsonProperty("refresh_token")
	    public String refreshToken;
	    @JsonProperty("refresh_token_expires_in")
	    public Integer refreshTokenExpiresIn;
	    @JsonProperty("scope")
	    public String scope;
	}
	*/
}
