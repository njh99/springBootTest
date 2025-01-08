package com.kh.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.domain.Board;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		// locale, model 객체주입된것을 활용해서 출력
		Date date = new Date();
		DateFormat df = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formatedDate = df.format(date);
		model.addAttribute("작업시간", formatedDate);
		System.out.println("sysout" + model);
		return "home"; // WEB-INF/views/home.jsp로 찾아서 보여줌
	}
	
	@RequestMapping(value = "/memberInsert", method = RequestMethod.GET)
	public String memberInsert() {
		
		return "memberInsert"; // WEB-INF/views/home.jsp로 찾아서 보여줌
	}


	

	@GetMapping(value = "/gohome02")
	public String gohome2() {
		log.info("/gohome02");
		return "/home";
	}

	@GetMapping(value = "/mainPage")
	public String mainPage() {
		log.info("Get방식으로 보낸 메인페이지");
		return "mainPage";
	}
}
