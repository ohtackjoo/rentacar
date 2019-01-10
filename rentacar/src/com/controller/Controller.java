package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//BookController2와 TravelController2에서 공통적으로 쓰이는 코드들을 문제가 생기지 않게 모아놂

public interface Controller {
	public String requestProcess(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable;
	
	//forward인지 redirect인지 여부를 리턴
	public boolean isRedirect();
	
	
}
