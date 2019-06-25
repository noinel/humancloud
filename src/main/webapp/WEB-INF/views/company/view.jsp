<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Do you want to build a Snowman?</title>

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
<style>
body {
   background-color: #fafafa;
   text-align: center;
}
.title{
	text-align: center;
}

.my_container {
   display: inline-block;
   width: 100%;
   text-align: left;
   background-color: white;
   overflow: hidden;
}

footer {
   width: 100%;
   height: 100px;
}
.my_info{
	display: grid;
	grid-template-columns: 4fr 1fr;
}

.comment {
   display: grid;
   grid-template-columns: 1fr 4fr 1fr;
   background-color: white;
}

.comment div {
   border: 1px solid lightgray;
   padding: 5px;
}
table{
   border-top: 1px solid black;
}
.second-td{
   width:30%;
}
.info{
   padding: 30px;
}
.bio{
   height: 300px; 
   border: 1px solid lightgray;
   padding: 10px;
}
.content_box{
   display: grid;
   grid-template-columns: 5fr 1fr;
}
.my_phoyo{
	background-size: 100% 100%;
}
@media(max-width:900px){
	.containaer{
		width: 100%;
	}
}
</style>
</head>
<body>
   <div class="my_container">
   <br /><br />
      <div class="title">${companyResume.title }</div>
      <br />
      

      <input type="text" name="applicantResumeUser" id="num" value="${companyResume.user.id}" style="visibility: hidden">
      
    
      <div class="my_info">
	      <table class="table table-hover">
	         <thead>
	            <tr>
	               <th colspan="3">회사 정보</th>                           
	            </tr>
	         </thead>
	      
	         <tr class="first_tr">
	            <td class="second-td">회사 이름</td>
	            <td colspan="3">${companyResume.user.name }</td>
	            
	         </tr>
	         <tr>
	            <td class="second-td">연령 </td>
	            
	            <td>${companyResume.age }세 이상</td>
	         </tr>
	         <tr>
	            <td class="second-td">이메일</td>
	            <td>${companyResume.user.email }</td>
	         </tr>
	         <tr>
	            <td class="second-td">전화번호</td>
	            <td>${companyResume.user.phone }</td>
	         </tr>
	         
	         
	      </table>
	      <img alt="x" src="${companyResume.filePath}" class="my_phoyo" width="100%" height="100%">
      </div>
      <br />
      

      <table class="table table-hover" >
      <thead>
         <tr>
            <th colspan="3">우대 조건</th>
         </tr>
      </thead>
      <tbody>
         <tr class="first-tr">
            <td class="second-td">우대 지역</td>
            <td>${companyResume.wishAddress }</td>
         </tr>
         <tr>
            <td class="second-td">연봉</td>
            <td>${companyResume.salary }</td>
         </tr>
         <tr>
            <td class="second-td">학력</td>
            <td>${companyResume.education }</td>
         </tr>
         <tr>
            <td class="second-td">직종</td>
            <td>${companyResume.job }</td>
         </tr>
         <tr>
            <td class="second-td">경력</td>
            <td>${companyResume.experience }</td>
         </tr>
         <tr>
         	<td>위치</td>
            <td><a href="#" class="mapopen">${companyResume.user.addr }</a></td> <!-- 경력 추가 -->
         </tr>

      </tbody>
      </table>
      <br />
      <hr />
      <script>	
   			$('.mapopen').click(function(){
   		      	window.open('https://www.google.com/maps/place/${companyResume.user.addr }',"a","width=1000, height=800, left=500, top=50");
   		      	return false;
   		   });
      </script>
      
      <div class="info">
         <h3>회사 PR</h3>
         <hr />
         <div class="bio">${companyResume.user.bio }</div>
         <br />
         <hr />
         
      </div>
      
      <c:choose>
      		<c:when test="${companyResume.user.id eq user.id}">
      				<div></div>
      		</c:when>
      		<c:otherwise>
      			<div class="content_box">      
			         <input type="text" placeholder="댓글.." class="content form-control" id="content"/>
			         <input class="reply-tran btn btn-light" type="button" value="전송">
			    </div>
			    <div class="reply">
			         <div class="coment_box">
			            <c:forEach var = "item" items="${comment}">
			               <div class="comment">
			                  <div>${item.fromUser.username}</div>
			                  <div> ${item.content}</div>
			                  <div> ${item.createDate}</div>
			               </div>
			            </c:forEach>
			         </div>
			     </div>
      		</c:otherwise>
      </c:choose>
	         
         
   </div><!-- container -->
   <script>
    var coment_box = document.querySelector('.coment_box');
       $('.reply-tran').click(function(){
           var id = ${companyResume.user.id};
          
           var content_e = document.querySelector('.content');
           var content = content_e.value;
       
          

           $.ajax({
               url:'/comment/'+id,
               type:'POST',
               dataType : "json",
               contentType:"application/json",
               data: JSON.stringify({
                   content : content
               }),
               success:function(obj){                   
                   if(obj == 1){
                        alert('작성 완료');
                        reply(obj);
                   }                    
               },
               error:function(){
                 alert('error');
               }
           })
       })

       function reply(obj){
          var content_e = document.querySelector('.content');
           var content = content_e.value;
            let newDiv = document.createElement('div');
            newDiv.className = 'comment';
            newDiv.innerHTML = '<div> ${user.username} </div><div>'+content+'</div><div>'+getTimeStamp()+'</div>'
            coment_box.prepend(newDiv);
       }

       function getTimeStamp() {
         var d = new Date();
         var s =
           leadingZeros(d.getFullYear(), 4) + '-' +
           leadingZeros(d.getMonth() + 1, 2) + '-' +
           leadingZeros(d.getDate(), 2);
         return s;
       }

       function leadingZeros(n, digits) {
         var zero = '';
         n = n.toString();

         if (n.length < digits) {
           for (i = 0; i < digits - n.length; i++)
             zero += '0';
         }
         return zero + n;
       }
   </script>

   <!--------------------------------------- footer  -------------------------------------->
   <footer> </footer>
   <!--------------------------------------- footer  -------------------------------------->