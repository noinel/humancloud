<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
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
	.container{
		margin-top: 100px;
	}
</style>
</head>
<body>
	
    <div class="container">
    	<h3>공지 사항 등록</h3>
            <form action="/manager/write" method="POST" name="myForm" onsubmit="">
                <br /><input type="text" style="width:100%" class="form-control form-control-lg" name="title"  placeholder="제목" required="required"/><br />
            
                   <div class="form-group note">
					  <label for="comment">Comment:</label>
					  <textarea class="form-control" rows="8" id="comment" name="content" required="required"></textarea>
					</div>
                    
                <input type="button" value="등록" onclick="call(this)" class="bb btn btn-dark" />
            </form>
        </div>
    <script>
		function call(e){
			var form = document.myForm;            
            e.form.submit();
			alert('등록 하였습니다');
			opener.location.reload();
		}
		
    
        $('#summernote').summernote({
                height: 300,                 // set editor height
                minHeight: null,             // set minimum height of editor
                maxHeight: null,             // set maximum height of editor
                focus: true                  // set focus to editable area after initializing summernote
            });
        $('.dropdown-toggle').dropdown();
    </script>
</body>
</html>