package com.kh.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	
	@RequestMapping(value="/", method= RequestMethod.GET)
	public String home(Locale locale,Model model) {
		//locale, model 객체주입된것을 활용해서 출력
		Date date = new Date();
		DateFormat df = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formatedDate = df.format(date);
		model.addAttribute("작업시간", formatedDate);
		System.out.println("sysout"+model);
		return "home";  //WEB-INF/views/home.jsp로 찾아서 보여줌
	}


	@GetMapping(value="/ajaxhome")
	public String ajaxhome() {
		return "ajaxhome";
	}
	
	@GetMapping(value="/mainPage")
	public String mainPage() {
		log.info("Get방식으로 보낸 메인페이지");
		return "mainPage";
	}
}


