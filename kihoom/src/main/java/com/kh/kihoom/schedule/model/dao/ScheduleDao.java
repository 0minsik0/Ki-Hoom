package com.kh.kihoom.schedule.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kihoom.member.model.vo.Member;
import com.kh.kihoom.schedule.model.vo.CalendarMemo;
import com.kh.kihoom.scheduleData.model.vo.SubInformation;

@Repository
public class ScheduleDao {

	public List<CalendarMemo> getCalendarMemo(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectList("scheduleMapper.getCalendarMemo", m);
	}
	
	public int deleteCalendar(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("scheduleMapper.deleteCalendarMemo", m);
	}
	
	public int modifyCalendar(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("scheduleMapper.modifyCalendarMemo", m);
	}
	
	
	
	
}
