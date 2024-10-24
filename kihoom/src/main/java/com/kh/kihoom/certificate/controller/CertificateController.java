package com.kh.kihoom.certificate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CertificateController {

	@RequestMapping("certificateMain.ce")
	public String certificateMain() {
		
		return "certificate/certificateMain";
	}
	
}
