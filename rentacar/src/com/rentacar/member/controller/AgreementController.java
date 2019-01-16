package com.rentacar.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;

public class AgreementController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		/member/agreement.do => AgreementController => agreement.jsp로 포워드
		*/
		
		return "/member/agreement.jsp";	//포워드
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
