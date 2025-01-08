package com.kh.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.domain.Board;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class TestController {

	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String home(String name) {

		return "hello " + name; // WEB-INF/views/home.jsp로 찾아서 보여줌
	}

	@RequestMapping(value = "/getBoard", method = RequestMethod.GET)
	public @ResponseBody Board getBoard() {
		Board board = new Board();
		board.setBoardNo(0);
		;
		board.setTilte("Hello");
		board.setContent("zeus");
		;
		board.setWriter("kdj");
		;
		board.setRegDate(new Date());
		return board;
	}

	@RequestMapping(value = "/getBoardList", method = RequestMethod.GET)
	public @ResponseBody List<Board> getBoardList() {
		List<Board> boardList = new ArrayList<Board>();
		for (int i = 1; i <= 10; i++) {
			Board board = new Board();
			board.setBoardNo(i);
			;
			board.setTilte("Hello");
			board.setContent("zeus");
			;
			board.setWriter("kdj");
			;
			board.setRegDate(new Date());
			boardList.add(board);
		}
		return boardList;
	}

}
