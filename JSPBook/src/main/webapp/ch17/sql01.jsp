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
	<!-- SELECT 쿼리문 실행하기 -->
	<sql:setDataSource var="dataSource"
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/jspbookdb"
		user="root"
		password="test1234"
	/>
	
	<sql:query var="resultSet" dataSource="${dataSource}" sql="SELECT * FROM member">
	</sql:query>
	<!-- (참고) JSTL이 제공하는 Result 객체 -->
		
	<table border="1">
		<tr>
			<!-- items: 자바의 for-each 문과 같은 역할 -->
			<c:forEach var="columnName" items="${resultSet.columnNames}">
				<th style="width: 100px">
					<c:out value="${columnName}"></c:out>
				</th>
			</c:forEach>
			
			<c:forEach var="row" items="${resultSet.rowsByIndex}">
				<tr>
					<c:forEach var="column" items="${row}">
						<td>
							<c:if test="${column != null}">
								<c:out value="${column}"></c:out>
							</c:if>
							<c:if test="${column == null}">
								&nbsp;
							</c:if>
						</td>
					</c:forEach>
				</tr>			
			</c:forEach>
		</tr>
	</table>
</body>
</html>