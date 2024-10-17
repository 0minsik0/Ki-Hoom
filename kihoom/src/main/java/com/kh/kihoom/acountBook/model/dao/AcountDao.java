package com.kh.kihoom.acountBook.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kihoom.acountBook.model.vo.Acount;

@Repository
public class AcountDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("acountMapper.selectListCount");
	}
	
	public ArrayList<Acount> selectList(SqlSessionTemplate sqlSession){
		return sqlSession.selectMap("acountMapper.selectList", null, )
	}

}
