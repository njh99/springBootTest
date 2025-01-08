package com.kh.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.domain.Board;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {

	@PutMapping("/{boardno}")
	public ResponseEntity<String> modify(@PathVariable("boardno") int boardno, Model model, @RequestBody Board board ) {
		log.info("boardno =" + boardno);
		log.info("board =" + board.toString());

		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	@PostMapping("/{boardno}")
	public ResponseEntity<String> modifyPost(@PathVariable("boardno") int boardno, Model model,
			@RequestBody Board board) {
		log.info("boardno =" + boardno);
		log.info("board =" + board.toString());

		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	@GetMapping(value = "/{boardno}", produces = "application/json")
	public ResponseEntity<Board> boardGetOne(@PathVariable("boardno") int boardno) {
		log.info("boardno =" + boardno);
		Board board = new Board();
		board.setTilte("제목");
		board.setContent("내용입니다.");
		board.setWriter("홍길동");
		board.setRegDate(new Date());
		ResponseEntity<Board> entity = new ResponseEntity<Board>(board, HttpStatus.OK);

		return entity;
	}
}