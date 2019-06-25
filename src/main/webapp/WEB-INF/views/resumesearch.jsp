<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Do you want to build a Snowman?</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Popper JS -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="/css/style.css">
<style>
       
      
        
        .container_b{
        	background-color: background-color: #fafafa;
        }
        .resumesearch_info{
           display: grid;
           grid-template-columns: 1fr 2fr 2fr 2fr;
           background-color: white;
           height: 100px; 
           border: 1px solid lightgray;
           margin-top: 10px;
        }
        .resumesearch_info div{
            padding: 30px;
        }
        .img{
        	width: 100%;
        	height: 60px;
        }
        .container_b{
        	
        }
        @media(max-width:900px){
        	.container{
        		width: 100%;
        		margin: 0;
        	}
            .resumesearch_info{
                grid-template-columns: 1fr 1fr 1fr;
            }
            .img{
                display: none;
            }
            span{
                display: none;
            }
        }
    </style>
</head>

<body >
   <script type="text/javascript">
      $(document).ready(function() { 
         <c:if test="${user.role eq 'manager'}">
             location.href = '/manager';
         </c:if>
      });
      
   </script>
   <script>
    function searchOnchange() {
        $("#borough").find("option").remove();

        let city_E = document.querySelector("#city");
        let city = city_E.value;
        $.ajax({
            url: '/addr/'+city,
            headers: { // Http header
            "Content-Type": "application/json"
            },
            type: 'post',
            data: JSON.stringify({
            'city': city
            }),
            success: function (obj) {
              
               borough(obj);
            },
            error: function () {
               alert("error");
            }
        })
        function borough(obj) {

        let select = $("#borough");

            for (var i = 0; i < obj.length; i++) {
            let newOption = document.createElement("option");
                newOption.className = "gugun";
                newOption.innerHTML = obj[i].borough;
               
                select.append(newOption);
            }
        }
    }
</script>
<script>                  
         function jobchang(){
            $('#smalljob').find('option').remove();
            
            var bigOrthogonal_E = document.querySelector('#bigjob');
             var bigOrthogonal = bigOrthogonal_E.value;
            
             
             $.ajax({
                url:'/job/'+bigOrthogonal,
                headers:{
                   "Content-Type":"application/json",
                },
                type: 'POST',
                data: JSON.stringify({
                   'bigOrthogonal': bigOrthogonal
                }),
                
                success: function(obj){                                                              
                   smalljob(obj);                                
                },
                error: function(){
                   alert("error");
                }
             })
             
             function smalljob(obj){
                var smalljob = document.querySelector('#smalljob');
                
                for(var i = 0; i< obj.length; i++){
                   let newOption = document.createElement("option");
                   newOption.className = "s_job";
                   newOption.innerHTML = obj[i].smallJob;
                   smalljob.append(newOption);
                }
             }
             
         }
</script>
<div class="background_img">
   <div class="logo"><a href="/user/main" class="nav-a" style="text-decoration: none"><h1 style="color:white">Human Cloud System</h1></a></div>

    <div class="nav">

      <div class="ban bancitysearch">
      <div>
        <div class="my_nav">
         
            <div class="My_citysearch">      
            <c:choose>
               <c:when test="${user.role eq 'applicant'}">
                  <form action="/search/company/wishaddress" class="search_city" method="POST">
                  <div class="input-field col s6 darken-1">
                        <select id="city" name="city" class="form-control" onchange="searchOnchange()" >
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
                    <div class="input-field col s12">
                        <select id="borough" name="gu" class="form-control">
                            <option value="*" class="gugun">전체</option>
                        </select>
                    </div>
                    <button class="btn btn btn-outline-secondary" type="submit" name="action">검색</button>
                </form>
               </c:when>
               <c:otherwise>
                  <form action="/search/applicant/wishaddress" class="search_city" method="POST">
                  <div class="input-field col s6 darken-1">
                        <select id="city" name="city" class="form-control" onchange="searchOnchange()" >
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
                    <div class="input-field col s12">
                        <select id="borough" name="gu" class="form-control">
                            <option value="*" class="gugun">전체</option>
                        </select>
                    </div>
                    <button class="btn btn btn-outline-secondary" type="submit" name="action">검색</button>
                </form>
               </c:otherwise>
            </c:choose>  
                
                                    
            </div>
                                  
            <div class="mene">
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                <c:choose>
                   <c:when test="${ 'applicant' eq user.role}">
                      <li><a href="#" class="nav-a newresume">이력서 등록</a></li>
                   </c:when>
                   <c:otherwise>
                      <li><a href="#" class="nav-a newresume_company">구인공고 등록</a></li>
                   </c:otherwise>
                </c:choose>                    
                    <li><a href="#" class="nav-a btnjobban">직종검색</a></li>
                </ul>
            </div>
            
        
         </div>
         </div>
        </div>
        <div class="ban banjobsearch" style="width:0px">
        <div class="my_nav">
         
            <div class="My_citysearch">     
               <c:choose>
                  <c:when test="${user.role eq 'applicant' }">
                     <form action="/search/company/job" class="search_city" method="POST">
                          <div class="job input-field col s6 darken-1">            
                            <select class="form-control bigOrthogonal" name="bigOrthogonal" id="bigjob" onchange="jobchang()" required="required">
                                 <option value="게임 GAME">게임 GAME</option>
                                 <option value="웹개발">웹개발</option>
                                 <option value="응용프로그램개발">응용프로그램개발</option>
                                 <option value="시스템개발">시스템개발</option>
                                 <option value="서버 네트워크 보안">서버 네트워크 보안</option>
                                 <option value="ERP 시스템분석 설계">ERP 시스템분석 설계ㄴ</option>
                                 <option value="데이터베이스DBA">데이터베이스DBA</option>
                                 <option value="퍼블리싱UI개발">퍼블리싱UI개발</option>
                                 <option value="통신 모바일">통신 모바일</option>
                                 <option value="웹기획PM">웹기획PM</option>
                                 <option value="IT디자인 컴퓨터 교육">IT디자인 컴퓨터 교육</option>
                                 <option value="웹마스터QA 테스터">웹마스터QA 테스터</option>
                                 <option value="동영상 편집코덱">동영상 편집코텍</option>
                                 <option value="인공지능AI빅데이터">인공지능AI빅데이터</option>
                                <option value="하드웨어 소프트웨어">하드웨어 소프트웨어</option>
                                <option value="컨텐츠 사이트운영">컨텐츠 사이트운영</option>
                                <option value="웹디자인">웹디자인</option>                        
                            </select>
                        </div>
                        <div class="input-field col s12">
                            <select class="form-control" name="job" id="smalljob" required="required">
                                <option value="전체" class="s_job">전체</option>                    
                            </select>
                        </div>
                          <button class="btn btn btn-outline-secondary" type="submit" name="action">검색</button>
                      </form>
                  </c:when>
                  <c:otherwise>
                        <form action="/search/applicant/job" class="search_city" method="POST">
                          <div class="job input-field col s6 darken-1">            
                            <select class="form-control bigOrthogonal" name="bigOrthogonal" id="bigjob" onchange="jobchang()" required="required">
                                 <option value="게임 GAME">게임 GAME</option>
                                 <option value="웹개발">웹개발</option>
                                 <option value="응용프로그램개발">응용프로그램개발</option>
                                 <option value="시스템개발">시스템개발</option>
                                 <option value="서버 네트워크 보안">서버 네트워크 보안</option>
                                 <option value="ERP 시스템분석 설계">ERP 시스템분석 설계ㄴ</option>
                                 <option value="데이터베이스DBA">데이터베이스DBA</option>
                                 <option value="퍼블리싱UI개발">퍼블리싱UI개발</option>
                                 <option value="통신 모바일">통신 모바일</option>
                                 <option value="웹기획PM">웹기획PM</option>
                                 <option value="IT디자인 컴퓨터 교육">IT디자인 컴퓨터 교육</option>
                                 <option value="웹마스터QA 테스터">웹마스터QA 테스터</option>
                                 <option value="동영상 편집코덱">동영상 편집코텍</option>
                                 <option value="인공지능AI빅데이터">인공지능AI빅데이터</option>
                                <option value="하드웨어 소프트웨어">하드웨어 소프트웨어</option>
                                <option value="컨텐츠 사이트운영">컨텐츠 사이트운영</option>
                                <option value="웹디자인">웹디자인</option>                        
                            </select>
                           </div>
                           <div class="input-field col s12">
                               <select class="form-control" name="job" id="smalljob" required="required">
                                   <option value="전체" class="s_job">전체</option>                    
                               </select>
                           </div>
                             <button class="btn btn btn-outline-secondary" type="submit" name="action">검색</button>
                         </form>
                  </c:otherwise>
               </c:choose>    
                                
            </div>
                                  
            <div class="mene">
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                <c:choose>
                   <c:when test="${ 'applicant' eq user.role}">
                      <li><a href="#" class="nav-a newresume">이력서 등록</a></li>
                   </c:when>
                   <c:otherwise>
                      <li><a href="#" class="nav-a newresume_company">구인공고 등록</a></li>
                   </c:otherwise>
                </c:choose>                    
                    <li><a href="#" class="nav-a btncityban">지역 검색</a></li>
                </ul>
            </div>
            
        
         </div>
         
        </div>
    </div>
    
    <div class="ban_menu">
       <div style="display:inline-block">
          <div>
             <a href="/user/${user.id }" class="ban_mypage"><div><b>내 정보</b></div></a>
             <a href="#" class="newresume"><div><b>이력서등록</b></div></a>
             <a href="#" class="ban_resumelist"><div><b>이력서목록</b></div></a>
             <a href="/logout"><div><b>로그 아웃</b></div></a>
          </div>
       </div>
    </div>            
    </div>
    <script>
       $('.btnjobban').click(function(){
          $('.bancitysearch').css("width","0px");
          $('.banjobsearch').css("width","80%");
          return false;
          
        });
        $('.btncityban').click(function(){
           $('.banjobsearch').css("width","0px");
           $('.bancitysearch').css("width","80%");
           return false;
          
        });
    </script>
   
   
   <div class="bandiv">
      
   </div>
   
   
    <script>      
      let mypage = $('.ban_mypage');
      let resumelist = $('.ban_resumelist');   
      let notice = $('.ban_notice');
     let bandiv = document.querySelector('.bandiv');
     let check = 1;

    
      resumelist.click(function(){

         if(check==1){
        $('.bandiv').find('.newprentdiv').remove();
          
          
        
         $('.bandiv').css('height','150px');
         var newprentdiv = document.createElement('div');
         newprentdiv.className ='newprentdiv';
      <c:choose>
         <c:when test="${ 'applicant' eq user.role}">
         
            <c:forEach var="item" items="${companyResume}">
               var newdiv = document.createElement('div');
               newdiv.innerHTML = "<a href='/view/company/${item.id }'><div>${item.title}</div></a>";
               newprentdiv.append(newdiv);
            </c:forEach>
            bandiv.append(newprentdiv);
         </c:when>
         <c:otherwise>
            <c:forEach var="item" items="${applicantResume}">
               var newdiv = document.createElement('div');
               newdiv.innerHTML = "<a href='/view/get/${item.id }'><div>${item.title}</div></a>";
               newprentdiv.append(newdiv);
            </c:forEach>
            bandiv.append(newprentdiv);
         </c:otherwise>
      </c:choose>
      check=0
      return false;      
         }else if(check == 0){
            $('.bandiv').css('height','0px');
            check=1;
            return false;
         }
         });

   
         notice.click(function(){
            check=1;
            $('.bandiv').css('height','0px');
            $('.bandiv').css('height','150px');

            

            
         });

   </script>     


<div class="container_b">
    
    <h3>검색 결과</h3>
    <hr/>
    <div>

        <div class="search">
                <c:choose>
                        <c:when test="${user.role eq 'applicant'}">
                           <c:forEach var="item" items="${companyResumeO}">
                              <div>
                                 
                                 <div class="resumesearch_info">
                                 <img src="${item.filePath}" alt="x" class="img">
                                    <div><a href="#" class="btncompany(${item.id })" onclick="return btncompany(${item.id })">${item.title}</a></div>
                                    <div>${item.job}</div>
                                    <div>${item.salary}만원</div>
                                 </div>
                              </div>
                           </c:forEach>
                        </c:when>
                        <c:otherwise>
                           <c:forEach var="item" items="${applicantResumeO}">
                              <div>
                                 
                                 <div class="resumesearch_info">
                                 <img src="${item.filePath}" alt="x" class="img">
                                    <div><a href="#" class="btnapplicant(${item.id })" onclick="return btnappilcant(${item.id })">${item.title}</a></div>
                                    <div>${item.job}</div>
                                    <div>${item.salary}만원</div>
                                 </div>
                              </div>
                           </c:forEach>
                        </c:otherwise>
                     </c:choose>
        </div>
    </div>
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
   $('.newresume').click(function(){
      window.open('/resume',  "a","width=600, height=800, left=500, top=50");    
      return false;      
   });
   $('.newresume_company').click(function(){
      window.open('/resume/company',  "a","width=600, height=800, left=500, top=50");
      return false;
   });
   
   
   
</script>
<script>


   function btncompany(id){
      id = Number(id);
      window.open('/view/company/'+id,"a","width=600, height=800, left=500, top=50");
      return false;
   }
   function btnappilcant(id){
      id =Number(id);
      window.open('/view/get/'+id,"a","width=600, height=800, left=500, top=50");
      return false;
   }
   function noticelist(id){
      id = Number(id);
      window.open('/manager/viewnote/'+id,"a","width=600, height=800, left=500, top=50");
      return false;
   }

</script>
    
</body>

</html>