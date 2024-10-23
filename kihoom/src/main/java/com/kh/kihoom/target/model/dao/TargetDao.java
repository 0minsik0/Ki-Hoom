package com.kh.kihoom.target.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kihoom.common.model.vo.PageInfo;
import com.kh.kihoom.target.model.vo.Target;

@Repository
public class TargetDao {

	public int targetCountList(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("targetMapper.targetCountList", memNo);
	}
	
	public ArrayList<Target> targetList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("targetMapper.targetList", memNo, rowBounds);
	}
}
