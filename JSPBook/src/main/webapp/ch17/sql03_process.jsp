<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- UPDATE 쿼리문 실행하기 -->
	<sql:setDataSource var="dataSource"
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/jspbookdb"
		user="root"
		password="test1234"
	/>
	
	<sql:update var="result" dataSource="${dataSource}" sql="UPDATE member SET name = ? WHERE id = ? AND passwd = ?">
		<sql:param value="${param.name}" />
		<sql:param value="${param.id}" />
		<sql:param value="${param.passwd}" />
	</sql:update>
	
	결과: <c:out value="${result}" />
	
	<!-- JSTL 버전의 동적 include: 해당 JSP의 실행 결과(HTML)를 가져와 붙임 -->
	<c:import url="sql01.jsp"></c:import>
	
	<%-- <c:import var="content" url="sql01.jsp"></c:import> <!-- 바로 출력되지 않고 변수에 저장됨 --> --%>
</body>
</html>