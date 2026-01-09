<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>구구단</h3>
	
	<table>
		<c:forEach var="j" begin="1" end="9" step="1">
			<tr>
				<c:forEach var="i" begin="2" end="9" step="1">
					<td style="width:100px">${i} * ${j} = ${i * j}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	<br>
	
	<!-- (참고) varStatus 속성: 반복 상태를 담는 특별한 객체
		반복문이 몇 번째 반복인지, 마지막 반복인지, 혹은 인덱스 정보 등 반복 관련 정보를 얻고 싶을 때 사용 -->
	
	<c:forEach var="i" begin="2" end="5" varStatus="loop">
		i=${i},
		index=${loop.index},
		count=${loop.count},
		first=${loop.first},
		last=${loop.last},
		<br>
	</c:forEach>		
		
	
</body>
</html>