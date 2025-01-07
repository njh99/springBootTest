package com.kh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/myboard")
public class myboardController {
	
	@GetMapping(value="/get", params="register")
	public String registerGet() {
		log.info("register 파라미터 get방식");
		return"/myboard/register";
	}
	
	@PostMapping(value="/post", params="register")
	public String registerPost() {
		log.info("register 파라미터 Post방식");
		return "/myboard/list";
	}
	@GetMapping(value="/get", params="modify")
	public String modifyGet() {
		log.info("register 파라미터 get방식");
		return"/myboard/modify";
	}
	
	@PostMapping(value="/post", params="modify")
	public String modifyPost() {
		log.info("modify Post방식");
		return"/myboard/list";
	}
	
	@GetMapping(value="/get", params="list")
	public String listGet() {
		log.info("list 파라미터 get방식");
		return "/myboard/list";
	}
	
	@GetMapping(value="/get", params="read")
	public String readGet() {
		log.info("read 파라미터 get방식");
		return "/myboard/read";
	}
	
	@GetMapping(value="/get", params="remove")
	public String removeGet() {
		log.info("remove 파라미터 get방식");
		return"/myboard/remove";
	}
	
	@PostMapping(value="/post", params="remove")
	public String removePost() {
		log.info("remove Post방식");
		return"/myboard/list";
	}
}
