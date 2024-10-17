package com.kh.kihoom.acountBook.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kihoom.acountBook.model.dao.AcountDao;
import com.kh.kihoom.acountBook.model.vo.Acount;
import com.kh.kihoom.common.model.vo.PageInfo;

@Service
public class AcountServiceImpl implements AcountService{
	
	@Autowired
	private AcountDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Acount> selectList(PageInfo pi) {
		return aDao.selectList(sqlSession);
	}

	@Override
	public int insertAcountBook(Acount a) {
		return 0;
	}

	
	
}
