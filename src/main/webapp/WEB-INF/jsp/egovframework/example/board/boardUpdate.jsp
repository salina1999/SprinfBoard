<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		<h3>&lt; 게시판수정 &gt;</h3>
		<form name="Bupdate" id="Bupdate" method="post">
			<input type="hidden" name="bno" id="bno" value="${list.bno}"/>
			<table>
	            <tr>
	                <th>이름</th>
	                <td><input type="text" name="name" id="name" value="${list.name}" placeholder="이름 입력" style="width: 500px"/></td>
	            </tr>
	            <tr>
	                <th>나이</th>
	                <td><input type="text" name="age" id="age" value="${list.age}" placeholder="나이 입력" style="width: 500px"/></td>
	            </tr>
	            <tr>
	                <th>내용</th>
	                <td><textarea  name="content" id="content" placeholder="내용 입력" style="width: 500px" rows="10" cols="10">${list.content}</textarea></td>
	            </tr>
        	</table>  
               	<button type="reset">다시작성</button> 
            	<button type="button" class="btn" onclick="fn_ListUpdate()">수정하기</button>
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/boardList.do';">목록</button>  
		</form>
	</div>
</body>

<script>
function fn_ListUpdate(){
	var Values = $("form[name=Bupdate]").serialize();
	if(confirm('등록하시겠습니까?')) {   
        $.ajax({
            type :		'POST',
            url :		'listUpdate.do',
            data :		Values,
            success :	function(result){
            				alert("수정 성공");
            				// console.log(data);
            				location.href = "${pageContext.request.contextPath}/boardList.do";
            			},
            error : 	function(e) {
                			console.log(e);
                			alert("잘못작성함");
                			location.href = "${pageContext.request.contextPath}/boardList.do";
                			return false;
            			}
        });
	} else {
		return false;
	}	
}
</script>
</html>