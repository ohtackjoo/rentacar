/**
 * js/member.js
 */

$(function(){
   //직접 입력인 경우 email3가 보이도록 지정
   $("#email2").change(function(){
      if($(this).val()=='etc'){
         $("#email3").val("");
         $("#email3").css("visibility","visible");
         $("#email3").focus();
      }else{
         $("#email3").css("visibility","hidden");
      }
   });

   $("#btnChkId").click(function(){
      //중복확인
      open("checkUserid.jsp?userid="+$("#userid").val(),"chk",
         "width=500,height=250,left=0,top=0,location=yes,resizable=yes");
   });
   
   $("#btnZipcode").click(function(){
      //우편번호 찾기
      open("../zipcode/zipcode.jsp","zip",
            "width=500,height=600,left=0,top=0,location=yes,resizable=yes");
   });
   
});

function validate_userid(userid){
   var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
   return pattern.test(userid);  //정규표현식을 만족하면 true, 아니면 false
    /*
   정규식  /^[a-zA-Z0-9_]+$/g
   a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 시작하거나 끝나야 한다는 의미
   닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미
    */
}

function validate_phone(ph){
   var pattern = new RegExp(/^[0-9]*$/g);
   return pattern.test(ph);  //정규표현식을 만족하면 true, 아니면 false
    /*  정규식  /^[0-9-]*$/g
      0 에서 9사이의 숫자나 -으로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
      닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복
   */
}

function validate_pwd(pwd){
   var pattern = new RegExp(/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{1,15}$/g);
   return pattern.test(pwd);  //정규표현식을 만족하면 true, 아니면 false
   //0~9나 a~z, A~Z, 특수문자를 모두 포함하여 1~15글자를 만족해야 하는 정규식
}