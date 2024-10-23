package com.kh.kihoom.target.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kihoom.common.model.vo.PageInfo;
import com.kh.kihoom.target.model.dao.TargetDao;
import com.kh.kihoom.target.model.vo.Target;

@Service
public class TargetServiceImpl implements TargetService{
	
	@Autowired
	private TargetDao tDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int targetCountList(int memNo) {
		return tDao.targetCountList(sqlSession, memNo);
	}

	@Override
	public ArrayList<Target> targetList(PageInfo pi, int memNo) {
		return tDao.targetList(sqlSession, pi, memNo);
	}

}
