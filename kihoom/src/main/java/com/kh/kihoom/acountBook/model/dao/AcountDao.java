package com.kh.kihoom.acountBook.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kihoom.acountBook.model.vo.Acount;
import com.kh.kihoom.common.model.vo.PageInfo;

@Repository
public class AcountDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("acountMapper.selectListCount", memNo);
	}
	
	public ArrayList<Acount> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("acountMapper.selectList", memNo, rowBounds);
	}
	
	public int insertAcountBook(SqlSessionTemplate sqlSession, Acount a) {
		return sqlSession.insert("acountMapper.insertAcountBook", a);
	}
	
	public ArrayList<Acount> totalList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("acountMapper.totalList", memNo);
	}
	
	public ArrayList<Acount> mOutList(SqlSessionTemplate sqlSession, Acount a){
		return (ArrayList)sqlSession.selectList("acountMapper.mOutList", a);
	}
	
	public ArrayList<Acount> mInList(SqlSessionTemplate sqlSession, Acount a){
		return (ArrayList)sqlSession.selectList("acountMapper.mInList", a);
	}
	
	public ArrayList<Acount> monthList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("acountMapper.monthList", memNo);
	}
	
	public ArrayList<Acount> weekTotalListOut(SqlSessionTemplate sqlSession, Acount a){
		return (ArrayList)sqlSession.selectList("acountMapper.weekTotalListOut", a);
	}
	
	public ArrayList<Acount> weekTotalListIn(SqlSessionTemplate sqlSession, Acount a){
		return (ArrayList)sqlSession.selectList("acountMapper.weekTotalListIn", a);
	}

}
