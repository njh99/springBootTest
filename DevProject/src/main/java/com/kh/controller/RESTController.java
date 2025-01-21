package com.kh.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.domain.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController // @Controller + @ResponseBody
public class RESTController {

	@GetMapping("blog")
	public User httpGet() {
		User user = User.builder().id(1).userName("zeus").password("123456").email("hello@naver.com").build();
		return user;
	}

	@PostMapping("blog")
	//@RequestBody => 자바객체를 JSON 방식으로 바꿔서 브라우저에게 보낸다.
	//@ResponseBody => 브라우저가 JSON으로 보내면 자바 객체로 변환.
	public List<User> httpPost(@RequestBody User user) {
		List<User> list = new ArrayList<User>();
		list.add(user);
		list.add(user);
		return list;
	}

	@PutMapping("blog")
	public String httpPut(@RequestBody User user) {
		return "Put 요청처리"+user.toString();
	}

	@DeleteMapping("blog")
	public String httpDelete(@RequestParam int id) {
		return "Delete 요청처리"+id;
	}

}
