package com.kh.kihoom.target.model.service;

import java.util.ArrayList;

import com.kh.kihoom.common.model.vo.PageInfo;
import com.kh.kihoom.target.model.vo.Target;

public interface TargetService {
	
	// 타겟 list
	int targetCountList(int memNo);
	ArrayList<Target> targetList(PageInfo pi, int memNo);

}
