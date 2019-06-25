<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Do you want to build a snowman?</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/join.css">
<style>
	h2{
		margin-top: 30px;
	}
	.container >div{
		margin-top: 25px;
	}
	.search{
		display: grid;
		grid-template-columns: 1fr 1fr;
		grid-gap:20px;
	}
	.mypassword{
		display: grid;
		grid-template-columns: 1fr 1fr;
		grid-gap:20px;
	}
	@media(max-width:900px){
		.container{
			width: 100%;
		}
	}
	
</style>
</head>
<body>
	<nav class="nav blue darken-1">
		<a href="/">
			
		</a>
	</nav>
	<h2>My Page</h2>
	<form action="/user/update" name="myform" id="form" method="POST" onsubmit="join()">
		<div class="container">
			<input id="name" type="text" class="validate" name="id"value="${user.id}" style="display: none" readonly /> 
			<input id="rrn" type="text" class="validate" name="number" value="${user.number }" placeholder="생년월일" style="display: none" readonly /> 
			<input id="name" type="text" class="validate" name="gender" value="${user.gender}" style="display: none" readonly /> 
			<input id="name" type="text" class="validate" name="role" value="${user.role}" style="display: none" readonly />
			

			<div>
				<input id="name" type="text" class="form-control" name="name"
					value="${user.name}" readonly required="required" />
			</div>
			<div>
				<input id="username" type="text" class="form-control"
					name="username" value="${user.username }" readonly
					required="required" />
			</div>

			<div class="mypassword" style="display: none">
				<div><input id="pw1" type="password" class="pw1 form-control"
					name="password" placeholder="비밀번호" readonly required="required" /></div>
				<div><input id="pw2" type="password" class="pw2 form-control" readonly
					placeholder="비밀번호 확인" required="required" /></div>
			</div>

			<div class="search" style="display: none">

			
					<select class="form-control wishaddress" name="wishaddress"
						id="my_address" onchange="address()">
						
						<c:choose>
							<c:when test="${'applicant' eq user.role}">
								<option>거주지</option>
							</c:when>
							<c:otherwise>
								<option>회사 위치</option>
							</c:otherwise>
						</c:choose>
						
						
						
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
			

				
					<select class="form-control borough" id="borough"
						onchange="addrreadonly()">
						<option value="ㅋ">전체</option>
					</select>
				
			</div>
					<script>
					
						function addrreadonly() {
							document.querySelector('#detailaddr').readOnly = false;
							document.querySelector('#detailaddr').value= "";
							
						}
					</script>
				

			
			<div>
				<input id="detailaddr" type="tel" value="${user.addr }"
					class="form-control" name="addr" placeholder="상세 주소"
					readonly="readonly" required="required" />
			</div>


			<div>
				<input id="icon_telephone" type="tel" class="form-control phone"
					name="phone" value="${user.phone }" placeholder="전화번호" readonly
					required="required" />
			</div>
			<div>
				<input id="my_email" type="email" class="form-control email"
					name="email" value="${user.email }" placeholder="email" readonly
					required="required" />
			</div>

			<div>
				<select class="form-control" id="monthselector" id="month" style="display:none">
					<option value="0">신입</option>
					<option>경력</option>
				</select>
			</div>
				
			<div>
				<select name="month" class="form-control month1" id="month" style="display:none">
					<option value="1">1년 이상</option>
					<option value="3">3년 이상</option>
					<option value="5">5년 이상</option>
					<option value="7">7년 이상</option>
					<option value="10">10년 이상</option>
					<option value="15">15년 이상</option>
				</select>
			</div>
			
			<div class="monthnone">
				<c:choose>
					<c:when test="${user.month eq 0}">
						<input id="name" type="text" class="form-control month" name="month" value="0" placeholder="신입" readonly />
					</c:when>
					<c:otherwise>
						<input id="name" type="text" class="form-control month" name="month" value="${user.month}년 이상" readonly />	
					</c:otherwise>
				</c:choose>
			</div>
			<br/>
			<hr/>
			
			<c:choose>
				<c:when test="${'applicant' eq user.role}">
					<h3>자기 소개</h3><br/>
	            	<textarea name="bio" id="" class="form-control bio" cols="100" rows="10" placeholder="자기 소개" required="required" readonly >${user.bio}</textarea>
				</c:when>
				<c:otherwise>
					<h3>회사 PR</h3><br/>
            	<textarea name="bio" id="" class="form-control bio" cols="100" rows="10" placeholder="회사 소개" required="required" readonly >${user.bio}</textarea>
				</c:otherwise>
			</c:choose>
				
				
			</div>
		</div>
		<br />
		<input type="button" value="개인 정보 수정" id="change"
			class="btn btn-outline-secondary" /> 
		<input type="button" value="수정 완료" id="complate" style="display: none" onclick="call(this)" class="btn btn-outline-secondary" />
	</form>
	<!--------------------------------------- footer  -------------------------------------->
	<footer>
		<div class="footer">
			<a href="">회사소개</a> <a href="">찾아오시는길</a> <a href="">호원약관</a> <a
				href="">개인정보처리방침</a> <a href="">고객센터</a>
		</div>
	</footer>
	<!--------------------------------------- footer  -------------------------------------->
	<script>
		let pw1 = $('.pw1');
		let pw2 = $('.pw2');
		let mypassword = $('.mypassword');
		let search = $('.search');
		let detailaddress = document.querySelector('#detailaddr');
		let email = document.querySelector('.email');
		let phone = document.querySelector('.phone');
		let month = document.querySelector('.month');
		let bio = document.querySelector('.bio');
		
		$('#change').click(function() {
			
			document.querySelector('.pw1').readOnly = false;
			document.querySelector('.pw2').readOnly = false;
			phone.readOnly = false;
			email.readOnly = false;
			month.readOnly = false;
			bio.readOnly = false;
			mypassword.css("display", "grid");
			search.css("display", "grid");
			$('#monthselector').css("display", "block");
			$('#complate').css("display", "inline-block");
			$('#change').css("display", "none");
			$('.monthnone').css("display", "none");
		})
	</script>

	<script>
		function join() {

			
			var detailaddr = document.querySelector('#detailaddr');
			var my_address = document.querySelector('#my_address');
			var borough = document.querySelector('#borough');
			var pw1 = document.querySelector(".pw1");
			var pw2 = document.querySelector(".pw2");
			var month = document.querySelector('#month');
			var exp = document.querySelector('#exp');
			alert(exp.text());
			alert(month.value);
			if (pw1.value === pw2.value) {
				
				detailaddr.value = my_address.value + " " + borough.value + " "+ detailaddr.value;
				 if(exp.value == '신입'){
					 
                	 month.value = 0;
                 }
				return true;
			} else {
				pw1.value = "";
				pw2.value = "";
				pw1.focus();
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}

		}
	</script>

	<script>
		function address() {
			$('#borough').find('option').remove();

			var my_address_E = document.querySelector('#my_address');
			var my_address = my_address_E.value;

			$.ajax({
				url : '/addr/' + my_address,
				headers : {
					"Content-Type" : "application/json",
				},
				type : 'POST',
				data : JSON.stringify({
					'my_address' : my_address
				}),

				success : function(obj) {

					borough(obj);

				},
				error : function() {
					alert("error");
				}
			})

			function borough(obj) {
				var borough = document.querySelector('#borough');
				let newOption = document.createElement("option");
				newOption.className = "borough";
				newOption.innerHTML = "<option>전체</option>";
				borough.append(newOption);
				for (var i = 0; i < obj.length; i++) {
					let newOption = document.createElement("option");
					newOption.className = "borough";
					newOption.innerHTML = obj[i].borough;
					borough.append(newOption);
				}
			}

		}
	</script>
	<script>
         $("#monthselector").on("change", function(){
            	if($(this).val() == '경력'){
					$('.month1').css('display','block');
					
            	}else{
            		$('.month1').css('display','none');
               	}
         });

   </script>
	<script>
          function call(e){
              var form = document.myForm;            
              e.form.submit();
              alert("이력서 등록 완료");
          }
    </script>        


</body>
</html>