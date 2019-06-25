<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Do you want to build a Snowman?</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
body{
    text-align: center;
    background-color: #fafafa;
}
nav{
height: 150px;
position: relative;
background-color: rgb(112, 148, 228);
}
.container{
    text-align: left;
    padding: 100px;
}
.my_nav{
    background-color: rgb(51, 103, 214);
    width: 100%;
    position: fixed;
    height: 100px;
    display: grid;
    padding: 10px;
    z-index: 1;
    text-align: center;
    }
.nav-a{
	color: white;
}
.logo{
  padding: 25px;
}
.small_container{
    width: 60%;
}
.userid_{
    grid-gap: 10px;
    display: grid;    
    grid-template-columns: 3fr 1fr;
}
.search{
	display: grid;
	grid-template-columns: auto auto;
	grid-gap: 10px;
}
.twopassword{
    grid-gap: 10px;
    display: grid;    
    grid-template-columns: auto auto;
}
.small_container > div{
    margin-top: 30px;
}
</style>
</head>
<body>
	<nav class="blue darken-1">   
        <div class="my_nav">
           <div class="logo"><a href="" class="nav-a">IT</a></div>              
        </div>   
    </nav>


    <div class="container">  
    <form action="/user/create" name="form" id="form" method="POST" onsubmit="return join()">
              
        
                
        <div class="small_container">
                <div class="userid_">
                        <input id="username" type="text" class="username form-control" name="username" placeholder="아이디" required="required"/>                                                               
                        <input type="button" class="btn btn-light" onclick="validateDuplicateID()" style="color:black" value="중복확인" >
                    </div>   
           
                <div><input id="name" type="text" class="form-control" name="name" placeholder="이름" required="required"/></div>                                                                                                    
                         
                <div class="twopassword">
                    <input id="pw1" type="password" class="pw1 form-control" name="password" placeholder="패스워드" required="required"/>
                    <input id="pw2" type="password" class="pw2 form-control" placeholder="패스워드 확인" required="required"/>
                </div>    
                                                                       
                 <div class="search">
                 
                 	<div>
                      <select class="form-control wishaddress" name="wishaddress" id="my_address" onchange="address()">
                            <option>거주지</option>                            
                            <option value="서울">서울</option>
                            <option value="부산">부산</option>
                            <option value="울산">울산</option>
                            <option value="인천">인천</option>
                            <option value="광주">광주</option>
                            <option value="강원">강원</option>
                            <option value="경북">경북</option>
                            <option value="대전">대전</option>
                            <option value="대구">대구</option>
                            <option value="전북">전북</option>
                            <option value="전남">전남</option>
                            <option value="경기">경기</option>
                            <option value="경남">경남</option>
                            <option value="충북">충북</option>
                            <option value="충남">충남</option>
                            <option value="제주">제주</option>
                      </select>
                    </div>
                    
                    <div>
                      <select class="form-control borough" id="borough" onchange="detailaddress()">
                          <option value="ㅋ">전체</option>
                      </select>
                    </div>
                    
                  </div>
                <div><input id="detailaddr" type="tel" class="form-control" name="addr" placeholder="상세 주소" readonly="readonly" required="required"/></div> 
                                                                                                                                                                              
                <div><input id="telephone" type="tel" class="form-control" name="phone" placeholder="전화번호" required="required"/></div>                                                                                
                <div><input id="my_email" type="email" class="form-control" name="email" placeholder="이메일" required="required"/></div>                                                    
                <div><input id="rrn" type="text" class="form-control" name="number" placeholder="생년월일(-없이 입력하시오)" required="required"/></div>
                            
                    
                <div>
                    <select name="gender" class="form-control" id="">
                        <option>여자</option>
                        <option>남자</option> 
                    </select>
                </div>
                <div>
                    <select class="form-control" id="monthselector">
                        <option>신입</option>
                        <option>경력</option> 
                    </select>
                </div>
             	<div>
             		<select name="month" class="form-control month" id="month" style="display:none">
                        <option value="1">1년 이상</option>
                        <option value="3">3년 이상</option>
                        <option value="5">5년 이상</option>
                        <option value="7">7년 이상</option>
                        <option value="10">10년 이상</option>
                        <option value="15">15년 이상</option> 
                    </select>
             	</div>
                   
        </div>   
            <div><input type="text" name="role" value="applicant" style="visibility: hidden" readonly required="required"/> </div>
            <hr />
            <h3>자기 소개</h3>
            <textarea name="bio" id="" cols="100" rows="10"></textarea>
                                                                
                                       
               
         <div><input type="submit" value="회원가입" class="btn btn-light" /> </div>
    </form>
</div>
    <!--------------------------------------- footer  -------------------------------------->
    <footer>
        <div class="footer">
            <a href="">회사소개</a>
            <a href="">찾아오시는길</a>
            <a href="">호원약관</a>
            <a href="">개인정보처리방침</a>
            <a href="">고객센터</a>
        </div>
    </footer>
    <!--------------------------------------- footer  -------------------------------------->
    <script>
            var check = 1;
             function validateDuplicateID(){
                 var username_element = document.querySelector(".username");
                 var username = username_element.value;
               
                
                 $.ajax({
                     url:'/checkid/'+username,
                     headers: { // Http header
                         "Content-Type": "application/json",                    
                     },
                     type: 'POST',
                     data: JSON.stringify({
                         'username': username
                     }),
                     success: function (obj) {
                         if(1 == obj){
                             alert("사용가능한 아이디 입니다."); 
                             check=0;                
                         }else{
                             alert("중복된 아이디가 있습니다.");
                           
                         }
                     },
                     error: function () {               
                         alert("error");
                        
                     }
                 })        
             }
         
             function join(){
               var detailaddr = document.querySelector('#detailaddr');
               var my_address = document.querySelector('#my_address');
               var borough = document.querySelector('#borough');
               var month = document.querySelector('#month');
               	
                 if(check == 1){
                    alert("아이디 중복체크를 해주세요");
                     return false;
                 }
                 var pw1 = document.querySelector(".pw1");
               var pw2 = document.querySelector(".pw2");
               
              
         
                 if(pw1.value === pw2.value){
                     if(month.value == null){
                    	 month.value = 0;
                     }
                	 
                	 detailaddr.value =  my_address.value +" "+ borough.value +" "+ detailaddr.value;
                	 
                     return true;
                 }else{
                     pw1.value = "";
                     pw2.value = "";
                     pw1.focus();
                     alert("비밀번호가 일치하지 않습니다.");
                     return false;
                 }
                 
                 
             }
             
             
         </script>
         <script>                  
	         function address(){
	            $('#borough').find('option').remove();
	            
	            var my_address_E = document.querySelector('#my_address');
	             var my_address = my_address_E.value;
	            
	             
	             $.ajax({
	                url:'/addr/'+my_address,
	                headers:{
	                   "Content-Type":"application/json",
	                },
	                type: 'POST',
	                data: JSON.stringify({
	                   'my_address': my_address
	                }),
	                
	                success: function(obj){
	                                                           
	                   borough(obj);
	                   
	                
	                },
	                error: function(){
	                   alert("error");
	                }
	             })
	             
	             function borough(obj){
	                var borough = document.querySelector('#borough');
	                let newOption = document.createElement("option");
	                newOption.className = "borough";
	                newOption.innerHTML = "<option>전체</option>";
	                borough.append(newOption);
	                for(var i = 0; i< obj.length; i++){
	                   let newOption = document.createElement("option");
	                   newOption.className = "borough";
	                   newOption.innerHTML = obj[i].borough;
	                   borough.append(newOption);
	                }
	             }
	             
	         }
         </script>
         
         
         <script>
         		function detailaddress(){
         			         			
         			document.querySelector('#detailaddr').readOnly = false;      
         		}
         		
         </script>
         <script>
	         $("#monthselector").on("change", function(){
	            	if($(this).val() == '경력'){
						$('.month').css('display','block');
		           	};
	         });
         </script>
         
</body>
</html>