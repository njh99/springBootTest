package com.zeus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zeus.common.exception.BoardRecordNotFoundException;
import com.zeus.domain.Board;
import com.zeus.mapper.BoardMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Transactional
	@Override
	public void register(Board board) throws Exception {
		log.info("register");
		mapper.create(board);
	}

	@Override
	public Board read(Integer boardNo) throws Exception {
		log.info("read");
		Board board = mapper.read(boardNo);
		//사용자가 정의한 예외처리를 진행
		if(board == null){
			throw new BoardRecordNotFoundException(boardNo + "에 게시된글은 없는 글입니다. 확인 바랍니다.");
		}
		return board;
	}

	@Override
	@Transactional
	public void modify(Board board) throws Exception {
		log.info("modify");
		mapper.update(board);
	}

	@Override
	@Transactional
	public void remove(Integer boardNo) throws Exception {
		log.info("remove");
		mapper.delete(boardNo);
	}

	@Override
	public List<Board> list() throws Exception {
		log.info("list");
		return mapper.list();
	}

}
