package com.koreait.matjip.exception;

public class ShopException extends RuntimeException{
	
	public ShopException(String msg) {
		super(msg);
	}
	
	public ShopException(Throwable e) {
		super(e);
	}
	
	public ShopException(String msg, Throwable e) {
		super(msg, e);
	}
	

}
