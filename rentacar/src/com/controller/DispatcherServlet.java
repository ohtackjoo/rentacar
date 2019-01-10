package com.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/DispatcherServlet")
public class DispatcherServlet extends HttpServlet {
	//맵핑화일을 찾아 담당할 애를 찾아 일을 시키는 역할-보스역할!
	
   private static final long serialVersionUID = 1L;
   
   private Properties props;	//매핑파일을 저장할 컬렉션
   
   @Override
      public void init(ServletConfig config) throws ServletException {
	   //super.init(config);
	   //init에서 할일	(맵핑화일을 참고하기 위한 저장 작업)
	   //맵핑화일(CommandPro.properties)을 읽어서 Properties컬렉션에 저장(다른곳에서 쓸 수 있도록 클래스영역에서 선언)
	   	
	   //1. 매핑화일 읽어오기
	   String configFile=config.getInitParameter("configFile");
	   //=>CommandPro.properties
	   System.out.println("configFile="+configFile);
	   
	   //2. 물리적인 실제 경로 구하기
	   String realConfigFile
			   =config.getServletContext().getRealPath(configFile);
	   System.out.println("realConfigFile="+realConfigFile);
	   //3. Properties컬렉션에 저장한다.
	   props=new Properties();
	   
	   FileInputStream fis=null;
	   try {
		   fis=new FileInputStream(realConfigFile);
		   props.load(fis);	//load 메서드로 저장  -load(InputStream arg0)
      }catch(FileNotFoundException e) {
    	  e.printStackTrace();	//~까지 저장부분
      }catch(IOException e) {
    	  e.printStackTrace();
      }finally {
    	  try {
    		  fis.close();
    	  }catch(IOException e) {
    		  e.printStackTrace();
    	  }
      }
   }
   
   protected void doGet(HttpServletRequest request, 
		   HttpServletResponse response) throws ServletException, IOException {
      requestPro(request, response); 
   }

   protected void doPost(HttpServletRequest request, 
		   HttpServletResponse response) throws ServletException, IOException {
      requestPro(request, response); 
   }

   private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setCharacterEncoding("utf-8");
         //URI에서 명령어 추출         (담당자 구해 일 시키는 작업)
         //명령어에 해당하는 명령어처리 클래스 구하기
        
        //작업 요약 => 명령어 처리 클래스를 구하여 행당 클래스의 메서드를 호출한다.
        //상세 => 
        //-요청 URI에서 명령어만 추출하여 Properties컬렉션에서 키(명령어)에 해당하는 value 명령어 처리 클래스를 구한다.
        //-명령어 처리 클래스의 메서드를 호출한 후 뷰페이지를 리턴 받아서 포워드한다.
        
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
         
        //1. 요청 URI 얻어오기
        String uri=request.getRequestURI();	//=>mymvc/tips/book.do
        System.out.println("uri="+uri);
        
        //2. uri에서 Context Path를 제거해서 명령어 부분만 추출하기
        String contextPath=request.getContextPath();  //=> /mymvc (contextPath 길이:5 - 5부터 추출하면 명령어부분)
        System.out.println("contextPath="+contextPath);		//=>/tips/book.do
        System.out.println("uri.indexOf(contextPath)="+uri.indexOf(contextPath));
        
        String key="";
        if(uri.indexOf(contextPath)==0) {
        	key=uri.substring(contextPath.length());	//=>/tips/book.do
        }
        System.out.println("key="+key);	//명령어
                 
        //명령어에 해당하는 명령어 처리 클래스 얻어오기
        String commandStr=props.getProperty(key);	//문자열
        //=> com.tips.controller.BookController2
        System.out.println("명령어 처리 클래스:"+commandStr);
        
        try {
	        //문자열을 클래스로
	        Class commandClass=Class.forName(commandStr);	//문자를 클래스로 만들어주는
	        
	        //클래스를 인스턴스로
	        Controller controller=(Controller) commandClass.newInstance();
	        
	        //메서드 호출
	        String resultPage=controller.requestProcess(request, response);
	        System.out.println("resultPage="+resultPage+"\n");
	        
	        //forward/redirect여부에 따라 처리
	        //true면 완성된 페이지(.do)로 리다이렉트
	        if(controller.isRedirect()) {
	        	response.sendRedirect(contextPath+resultPage);	
	        	//=> /mymvc + /tips/book.do => /mymvc/tips/book.do
	        }else {
		        //false면 해당 뷰페이지(.jsp)로 포워드
		        RequestDispatcher dispatcher
		        	=request.getRequestDispatcher(resultPage);
		        dispatcher.forward(request, response);
	        
	        }
        }catch(ClassNotFoundException e) {
        	e.printStackTrace();
        } catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (Throwable e) {
			e.printStackTrace();
		}
   }
}
