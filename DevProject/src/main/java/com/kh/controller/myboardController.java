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
	
	@GetMapping("/register")
	public String registerGet() {
		log.info("register Get방식");
		return"success";
	}
	
	@PostMapping("/register")
	public String registerPost() {
		log.info("register Post방식");
		return "success";
	}
	@GetMapping("/modify")
	public String modifyGet() {
		log.info("modify Get방식");
		return "success";
	}
	
	@PostMapping("/modify")
	public String modifyPost() {
		log.info("modify Post방식");
		return "success";
	}
	@GetMapping("/list")
	public String listGet() {
		log.info("list Get방식");
		return "success";
	}
	
	@PostMapping("/remove")
	public String remove() {
		log.info("modify Post방식");
		return "success";
	}
}
