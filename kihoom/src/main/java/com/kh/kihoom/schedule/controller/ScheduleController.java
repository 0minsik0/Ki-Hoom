package com.kh.kihoom.schedule.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.kh.kihoom.member.model.vo.Member;
import com.kh.kihoom.schedule.model.service.ScheduleService;
import com.kh.kihoom.schedule.model.vo.CalendarMemo;
import com.kh.kihoom.scheduleData.controller.APIController;
import com.kh.kihoom.scheduleData.model.vo.SubInformation;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService mService;
	
	
	/**
	 * @return 
	 * 스케줄화면
	 */
	@Autowired
	private APIController apiController; // 청약정보 API 컨트롤러 의존성 주입

	@RequestMapping("schedule.sc")
	public ModelAndView scheduleView(Member m, HttpSession session, ModelAndView mv) throws IOException {
	    // 기존의 캘린더 메모 가져오기
	    List<CalendarMemo> calendarMemo = mService.getCalendarMemo(m);
	    session.setAttribute("cMemo", calendarMemo);

	    // API를 통해 청약정보 가져오기
	    String jsonData = apiController.HousingSub(null); // APIController의 메소드 호출

	    // JSON 데이터를 객체로 변환 (Gson 등 사용)
	    List<SubInformation> subInfoList = parseJsonToSubInformation(jsonData);
	    mv.addObject("subInfoList", subInfoList); // JSP에 전달

	    mv.setViewName("schedule/scheduleView");
	    return mv;
	}

	//schedule.jsp 호출 시 자동으로 청약정보api도 호출해주는 메소드
		private List<SubInformation> parseJsonToSubInformation(String jsonData) {
		    // Gson을 사용하여 JSON 데이터를 SubInformation 리스트로 변환
		    Gson gson = new Gson();
		    JsonObject jsonObject = JsonParser.parseString(jsonData).getAsJsonObject();
		    JsonArray dataArray = jsonObject.getAsJsonArray("data");

		    List<SubInformation> subInfoList = new ArrayList<>();
		    for (JsonElement element : dataArray) {
		        SubInformation subInfo = gson.fromJson(element, SubInformation.class);
		        subInfoList.add(subInfo);
		    }

		    return subInfoList;
		}
		
		
	//일반메모 삭제 기능
	@RequestMapping("calendar.delete")
	public void deleteCalendar(Member m, HttpSession session, ModelAndView mv) {
		
		int result = mService.deleteCalendar(m);
		
		if(result>1) { //메모 삭제 성공
			
			
		}else { //실패
			
		}
	}
	
	//일반메모 수정 기능
	@RequestMapping("calendar.edit")
	public void modifyCalendar(Member m, HttpSession session, ModelAndView mv) {
		
		int result = mService.deleteCalendar(m);
		
		if(result>1) { //메모 삭제 성공
			
			
			
		}else { //실패
			
		}
	}

	
	
	

	
	
	
}
