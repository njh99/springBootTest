package com.project.exception;

//사용자가 정의 예외처리
public class NotEnoughCoinException extends Exception {
	private static final long serialVersionUID = 1L;

	public NotEnoughCoinException(String msg){
		
	super(msg);
	}

}
