package com.kh.kihoom.acountBook.model.service;

import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kihoom.acountBook.model.dao.AcountDao;
import com.kh.kihoom.acountBook.model.vo.Acount;
import com.kh.kihoom.common.model.vo.PageInfo;
import com.kh.kihoom.member.model.vo.Member;

@Service
public class AcountServiceImpl implements AcountService{
	
	@Autowired
	private AcountDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount(int memNo) {
		return aDao.selectListCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<Acount> selectList(PageInfo pi, int memNo) {
		return aDao.selectList(sqlSession, pi, memNo);
	}
	
	@Override
	public int insertAcountBook(Acount a) {
		return aDao.insertAcountBook(sqlSession, a);
	}

	@Override
	public ArrayList<Acount> totalList(int memNo) {
		return aDao.totalList(sqlSession, memNo);
	}

	@Override
	public ArrayList<Acount> mOutList(Acount a) {
		return aDao.mOutList(sqlSession, a);
	}

	@Override
	public ArrayList<Acount> mInList(Acount a) {
		return aDao.mInList(sqlSession, a);
	}

	@Override
	public ArrayList<Acount> monthList(int memNo) {
		return aDao.monthList(sqlSession, memNo);
	}

	@Override
	public ArrayList<Acount> weekTotalListOut(Acount a) {
		return aDao.weekTotalListOut(sqlSession, a);
	}

	@Override
	public ArrayList<Acount> weekTotalListIn(Acount a) {
		return aDao.weekTotalListIn(sqlSession, a);
	}
	


	
}
