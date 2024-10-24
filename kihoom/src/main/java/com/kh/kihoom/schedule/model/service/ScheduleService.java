package com.kh.kihoom.schedule.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kihoom.member.model.vo.Member;
import com.kh.kihoom.schedule.model.dao.ScheduleDao;
import com.kh.kihoom.schedule.model.vo.CalendarMemo;
import com.kh.kihoom.scheduleData.model.vo.SubInformation;

@Service
public class ScheduleService {
	
	@Autowired
	private ScheduleDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<CalendarMemo> getCalendarMemo(Member m) {
		
		
		List<CalendarMemo> calendarMemo = sDao.getCalendarMemo(sqlSession, m);
		
		
		return calendarMemo;
	}
	
	public int deleteCalendar(Member m) {
		int result = sDao.deleteCalendar(sqlSession, m);
		
		return result;
	}
	
	public int modifyCalendar(Member m) {
		int result = sDao.deleteCalendar(sqlSession, m);
		
		return result;
	}
		
	public List<SubInformation> getSubInformationList() {
	    
		List<SubInformation> subInformationList = sDao.getSubInformationList();
		
		
		// API를 호출하고 데이터를 파싱하여 SubInformation 리스트로 반환하는 로직 구현
	    // 이 부분에서 APIController의 메서드나 별도의 서비스 클래스를 호출하여 데이터를 가져옵니다.
	    return subInformationList; // 실제 데이터로 반환
	}


}
