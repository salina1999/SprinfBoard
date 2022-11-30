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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<style>
	h3{
		text-align: center;
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
	<form id="writeForm" name="writeForm" method="post">
        <div>
        	<h3>&lt; 글쓰기 &gt;</h3>
            <div>
                <table>
                    <tr>
                        <th>이름</th>
                        <td><input style="width: 500px" type="text" id="name" name="name" /></td>
                    </tr>
                    <tr>
                        <th>나이</th>
                        <td><input style="width: 500px" type="text" id="age" name="age" /></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea style="width: 500px" rows="10" cols="10" id="content" name="content"></textarea></td>
                    </tr>
                </table>     
            </div>
        </div>
       
	    <button id="btn3" class="btn" type="reset">reset</button>  
		<button id="btn" class="btn" type="button">등록</button>
		<button id="btn2" class="btn" type="button">취소</button>
    </form>

</body>

<script>
	$(document).ready(function() {
		$("#btn").click(function() {
			var Values = $("form[name=writeForm]").serialize();
			if(confirm('등록하시겠습니까?')) {   
		        $.ajax({
		            type :		'POST',
		            url :		'insertBoard.do',
		            data :		Values,
		            /* dataType : 	"text", */
		            //async :		false,
		            success :	function(data){
		            				alert("등록 성공");
		            				console.log("asda");
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
		});
	});
	$("#btn2").click(function() {
		alert("취소하시겠습니까?");
		document.location.href="${pageContext.request.contextPath}/boardList.do";
		return false;
	});

	
	
	/* function btn() {
	alert('클릭');
	if(confirm('정말 저장하시겠습니까?')) {   
   
	} */
</script>
</html>