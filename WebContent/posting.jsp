<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="common.jsp"%>
<meta charset="UTF-8">
<title>강의 평가 사이트 - 게시물 작성</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<% String category = request.getParameter("category"); %>
	<div class="container">
		<form name="postingform" action="posting" method="post">
			<input type="text" name="title" class="editor__title form-control form-control-lg" placeholder="제목을 입력하세요.">
			<input type="hidden" name="category">
			<input type="hidden" name="content">
			<div id="summernote"></div>
			<div style="margin-top: 5px;">
				<input type="button" class="btn btn-primary" onclick="onPosting()" value="글쓰기">
				<a href="board?category=${param.category}" class="btn btn-outline-primary">나가기</a>
			</div>
		</form>
	</div>
	
    <script>
            $(document).ready(function() {
                $('#summernote').summernote({
                	height: 400,
                    disableResizeEditor: true,
                    callbacks: { 
					    onImageUpload: function(files, editor, welEditable) {
						    sendFile(files[0], this);
						}
					}
				});
			});
            
            function sendFile(file, editor) {
    	 		data = new FormData();
    	 	    data.append("uploadFile", file);
    	 	    $.ajax({
    	 	        data : data,
    	 	        type : "POST",
    	 	        url : "ImageServlet",
    	 	        cache : false,
    	 	        contentType : false,
    	 	        processData : false,
    	 	        success : function(data) {
    	 	        	$(editor).summernote('editor.insertImage', data.url);
    	 	        }
    	 	    });
    	 	}
            
            function onPosting() {
            	var form = document.postingform;
            	var title = form.title.value;
            	var content = $("#summernote").summernote('code');
            	
            	if (title.length == 0) {
            		alert("제목을 입력해주세요!");
            		form.title.select();
            		return;
            	}
            	
            	if (content == '<p><br></p>') {
            		alert("내용을 입력해주세요!");
            		$("#summernote").summernote('focus');
            		return;
            	}
            	
            	form.category.value = '<%=category%>';
            	form.content.value = content;
            	form.submit();
            }
	</script>
</body>
</html>