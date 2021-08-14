<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<script>

$(function(){
	 $("#createRoom").on("click", function(){
		 window.open("popup", "a", "width=400, height=300, left=100, top=50"); 
	 })
})

</script>


</head>
<body>

<div class = container>
	<table class="table" align ="center">
	  <thead class="thead-dark">
	    <tr>
	      <th scope="col">방 번호</th>
	      <th scope="col">방 제목</th>
	      <th scope="col">인원수</th>
	      <th scope="col">생성 날짜</th>
	    </tr>
	  </thead>
	  <tbody class = "room-list">
	  	
	  	<c:forEach var="item" items="${list }">
	 	<tr>
	  			<td>${item.rnum }
	  			<td><a href = "toChat?roomid=${item.roomid }" >${item.title }</a>
	  			<td>${item.count}
	  			<td>2021-08-05
	  	</tr> 
	  	</c:forEach>
	  
	  </tbody>
	  <tfoot>
	  	<tr>
	  		<td></td>
	  		<td></td>
	  		<td></td>
	  		<td><button type="button" class="btn btn-info" id = createRoom >방 만들기</button></td>
	  	</tr>
	  </tfoot>
	</table>
</div>
</body>
</html>