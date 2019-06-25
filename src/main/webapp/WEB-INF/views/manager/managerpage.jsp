<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Do you want to build a manager</title>
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<style>
    .nav{
        
        height: 80px;
        background-color: #fafafa;
    }
    .nav div> a{
        color: wheat;
        
    }
    .nav div{
        width: 100%;
        text-align: center;
    }
    body{
       background-color: #fafafa;
       text-align:center;
        height: 100vh;
    }
    .list{
        margin-top: 100px;
    }
    .container{
        margin-top: 50px;
    }
    .note{
        text-align: left;
    }
</style>

</head>
<body>
   <script>
      $(document).ready(function(){
         <c:choose>
            <c:when test="${user.role eq 'manager'}">
               alert("${user.username} 님 환영 합니다.!");   
            </c:when>
            <c:otherwise>
               alert("관리자 권한이 없습니다.");
               history.back();
            </c:otherwise>
         </c:choose>
         
      });
   </script>
   
    <nav class="nav blue darken-1">
        <div><a href="/">관리자 페이지 입니다.${user.role }</a></div>
    </nav>
    <div class="list">
       <input type="button" value="공지 사항 등록" class="btn btn-primary" id="write"  />
        <input type="button" value="공지 사항 목록" class="btn btn-primary" id="notelist"  />
        <input type="button" value="유저 목록" class="btn btn-primary" id="userlist" />
        <input type="button" value="이력서 목록" class="btn btn-primary" id='applicant'  />
        <input type="button" value="구인공고 목록" class="btn btn-primary" id='company'  />
    </div>
    <div class="container">
        <table class="table table-hover my_table">
            <thead class="my_thead">
                <tr>
                    <th>글 번호</th>
                    <th>제목</th>
                    <th>생성 일자</th>
                    
                </tr>
            </thead>
            <tbody class="my_tbody">
               <c:forEach var="item" items="${noticelist}">
                  <tr>                
                       <td>${item.id }</td>
                       <td><a href="#" class='notice' onclick="btnnotice(${item.id})">${item.title }</a></td>
                       <td>${item.createDate }</td>
                       <th><a href="/delete/${item.id }">삭제</a></th>
                   </tr>
               </c:forEach>
                
            </tbody>
            
        </table>
      
    </div>












<script>
let container = $('.container');

$('#notelist').click(function(){


    $('table').remove('.my_table');
    let table = document.createElement('table');
    table.className = 'table table-hover my_table'
    let thead = document.createElement('thead');
    let tbody = document.createElement('tbody');
    thead.innerHTML = "<tr><th>번호</th><th>제목</th><th>생성 일자</th></tr>";
    table.append(thead);
    <c:forEach var="item" items="${noticelist}">
       var tr = document.createElement("tr");
       tr.innerHTML = "<tr><td>${item.id }</td><td><a href='#' onclick='btnnotice(${item.id})' class='notice'>${item.title }</a></td><td>${item.createDate }</td><th><a href='/delete'>삭제</a></th></tr>";
       tbody.append(tr); 
    </c:forEach>

    table.append(tbody);
    container.append(table);
})
$('#userlist').click(function(){
   
    $('table').remove('.my_table');
    let table = document.createElement('table');
    table.className = 'table table-hover my_table'
    let thead = document.createElement('thead');
    let tbody = document.createElement('tbody');    
    thead.innerHTML = "<tr><th>번호</th><th>아이디</th><th>role</th></tr>";
    table.append(thead);
    <c:forEach var="item" items="${userlist}">
       var tr = document.createElement("tr");
       tr.innerHTML = "<td>${item.id}</td><td><a href='#'onclick='userlist(${item.id})'>${item.username}</a></td><td>${item.role}</td>";
       tbody.append(tr);       
    </c:forEach>
   table.append(tbody);
    container.append(table);
    
})
$('#applicant').click(function(){
   
    $('table').remove('.my_table');
    let table = document.createElement('table');
    table.className = 'table table-hover my_table'
    let thead = document.createElement('thead');
    let tbody = document.createElement('tbody');        
    thead.innerHTML = "<tr><th>번호</th><th>제목</th><th>생성 일자</th></tr>";
    table.append(thead);
    <c:forEach var="item" items="${userResumelist}">
       var tr = document.createElement("tr");
       tr.innerHTML = "<tr><td>${item.id}</td><td><a href='#' onclick='btnapplicant(${item.id})'>${item.title}</a></td><td>${item.user.name}</td></tr>";
       tbody.append(tr); 
       
    </c:forEach>

    
    
    
    table.append(tbody);
    container.append(table);
})
$('#company').click(function(){
   
    $('table').remove('.my_table');
    let table = document.createElement('table');
    table.className = 'table table-hover my_table'
    let thead = document.createElement('thead');
    let tbody = document.createElement('tbody');
    thead.innerHTML = "<tr><th>번호</th><th>제목</th><th>생성 일자</th></tr>";
    table.append(thead);
    <c:forEach var="item" items="${companyResumelist}">
       var tr = document.createElement("tr");
       tr.innerHTML = "<tr><td>${item.id}</td><td><a href='#' onclick='btncompany(${item.id})'>${item.title}</a></td><td>${item.user.name}</td></tr>";
       tbody.append(tr); 
    </c:forEach>

    
    table.append(tbody);
    container.append(table);
})

</script>  

<script>

   $('#write').click(function(){
      window.open('/manager/notice',"a","width=600, height=800, left=500, top=50");
      return false;
   });
   function btnnotice(id){
      id = Number(id);
      window.open('/manager/viewnote/'+id,"a","width=600, height=800, left=500, top=50");
      return false;
   }   
   
   function btncompany(id){
      id = Number(id);
      window.open('/view/company/'+id,"a","width=600, height=800, left=500, top=50");
      return false;
   }
   function btnapplicant(id){
      id = Number(id);
      window.open('/view/get/'+id,"a","width=600, height=800, left=500, top=50");
      return false;
      
   }
   function userlist(id){
      id = Number(id);
      window.open('/user/'+id,"a","width=600, height=800, left=500, top=50");
   }


</script>  
</body>
</html>