package com.kh.kihoom.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.kihoom.schedule.model.service.ScheduleService;
import com.kh.kihoom.schedule.model.vo.CalendarMemo;

@RestController
@RequestMapping("/events")
public class CalendarController {

    @Autowired
    private ScheduleService scheduleService; // 메모 관련 서비스

    @GetMapping("/all")
    public List<CalendarMemo> getCalendarMemo() {
        return scheduleService.getCalendarMemo(); // DB에서 메모 또는 일정을 가져오는 서비스
    }
}

