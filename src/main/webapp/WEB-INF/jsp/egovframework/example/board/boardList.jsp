<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<script type="text/javascript">
	/* 페이징과 글 목록 조회  */
	var currentPageNo = ${pageNo};
	 
	function linkPage(pageNo){
		
		location.href = "${pageContext.request.contextPath}/boardList.do?pageNo=" + pageNo; 
	}
</script>
	
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>	

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
	};
	
</style>
<body>
	<h3>&lt; 게시판 &gt;</h3>
	<div class="container">
		<table class="custom-table">
			<thead>
				<tr>
					<th>이름</th>
					<th>나이</th>
					<th>내용</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="list">
					<tr onclick="location.href='${pageContext.request.contextPath}/Detail.do?bno=' + ${list.bno};">
						<td><c:out value="${list.name }" /></td>
						<td><c:out value="${list.age }" /></td>
						<td><c:out value="${list.content }" /></td>
						<td><c:out value="${list.regdate }" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="button" class="btn" onclick='fn_goRg()'>게시글쓰기</button>
	</div>
	<div>
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/>
	</div>
</body>
<script>
function fn_goRg(){
	location.href='${pageContext.request.contextPath}/boardRegister.do';
}
</script>
</html>