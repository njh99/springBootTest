package com.kh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping(value="/")
	public String home() {
		return "home";  //WEB-INF/views/home.jsp로 찾아서 보여줌
	}
}