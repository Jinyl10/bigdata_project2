package com.koreait.matjip.exception;

public class JjimException extends RuntimeException{

	public JjimException(String msg) {
		super(msg);
	}
	public JjimException(Throwable e) {
		super(e);
	}
	public JjimException(String msg, Throwable e) {
		super(msg, e);
	}
}
