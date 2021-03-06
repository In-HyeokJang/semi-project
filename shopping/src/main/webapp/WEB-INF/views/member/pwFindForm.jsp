<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>비밀번호 찾기 처리</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  	$(function(){
  		$("#btn").click(function(){
  			if($("#id").val() == ''){
  				alert("아이디를 입력하세요");
  				$("#id").focus();
  				return;
  				
  			}esls if($("#mname").val()==''){
  			alert("이름을 입력하세요");
  			$("#mname").focus();
  			return;
  		}
  			//alert($("#mname").val() + ","+ $("#email").val());
  			//비동기 통신 요청 pwfind() 호출
  			//msg로 나오게 만듬
  			pwfind($("#id").val(),$("#mname").val())
  				.then(text => $("#msg").text(text))
  				.catch(console.log);
  		});
  	});
  	
  	//비동기 통신을 처리하는 함수 선언
  	function pwfind(id,mname){
  		return fetch(`/member/pwfindex?id=\${id}&mname=\${mname}`)
  				.then(response => response.text())
  				.catch(console.log);
  	}
  </script>
</head>
<body>
<div class="container">

<h1 class="col-sm-offset-2 col-sm-10">비밀번호 찾기</h1>
  <form class="form-horizontal" >
    <input type="hidden" name="rurl" value="${param.rurl}">    
    <input type="hidden" name="contentno" value="${param.contentno}">    
    
    <input type="hidden" name="nPage" value="${param.nPage}">    
    
        
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">id</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="id" 
        placeholder="Enter id" name="id" required="required">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="mname">이름</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mname" 
        placeholder="Enter mname" name="mname" required="required">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="button" class="btn btn-default" id="btn">찾기</button>
        <button type="button" class="btn btn-default"
         onclick="location.href='agree'">회원가입</button>
        <button type="button" class="btn btn-default"
        onclick = "location.href='/member/idfind'">아이디 찾기</button>
      </div>
    </div>
   <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
      <span id="msg"></span>
      </div>
      </div>
  </form>

</div>
</body>
</html>