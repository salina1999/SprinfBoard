<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<style>
	h3{
		text-align: 	center;
		margin: 	20px 20px;
	}
	
	table {
	    margin-left:auto; 
	    margin-right:auto;
	    text-align: center;
	}
	
	table, td, th {
	    border-collapse : collapse;
	    border : 1px solid black;
	}
</style>
<body>
	<div>
		<h3>&lt; 상세페이지 &gt;</h3>
		<table class="custom-table">
			<thead>
				<tr>
					<th>순번</th>
					<th>이름</th>
					<th>나이</th>
					<th>내용</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				 	<td>${DList.bno}</td>
				   	<td>${DList.name}</td>
				   	<td>${DList.age}</td>
				   	<td>${DList.content}</td>
				   	<td>${DList.regdate}</td>
				 </tr>
			 </tbody>
		</table>
	</div>
	<div>
		<button onclick="location.href='${contextPath}/boardUpdate.do?bno=' + ${DList.bno};">수정</button>
<%-- 		<button onclick="fn_ListDelete(${list.bno})">삭제</button> --%>
		<button onclick="fn_ListDelete(${DList.bno})">삭제</button>
		<button type="button" class="btn" onclick="location.href='${contextPath}/boardList.do';">목록</button>
	</div>
</body>
<script>
	function fn_ListDelete(bno){
		if(confirm('정말 삭제하시겠습니까?')) {   
	        $.ajax({
	            type : 'POST',
	            url : 'Delete.do',
	            data :	{"bno" : bno},
	            success : function(data){
	            	alert("삭제됐습니다");
	            	location.href = "${contextPath}/boardList.do";
	            },
	            error: function(request, status, error){
	                alert(error);
	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            },
	        });
		} else {
			return false;
		}
	}

</script>
</html>