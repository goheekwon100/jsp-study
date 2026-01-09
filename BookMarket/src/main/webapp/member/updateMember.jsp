<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 수정</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<script type="text/javascript">
		function checkForm(e) {
			if (!document.newMember.curPassword.value) {
				alert("기존 비밀번호를 입력하세요.");
				e.preventDefault();
				return;
			}
			if (document.newMember.changePassword.value !== document.newMember.changePassword_confirm.value) {
				alert("변경 비밀번호를 동일하게 입력하세요.");
				e.preventDefault();
				return;
			}
		}
	</script>
</head>
<body>
	<sql:setDataSource var="dataSource"
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/bookmarketdb"
		user="root"
		password="test1234"
	/>
	
	<sql:query var="resultSet" dataSource="${dataSource}">
		SELECT * FROM member WHERE id = ?
		<sql:param value="${sessionScope.loginId}"></sql:param>
	</sql:query>

	<div class="container py-4">
		<%@ include file="../menu.jsp" %>
    
    <jsp:include page="/title.jsp">
    	<jsp:param value="회원 수정" name="title"/>
    	<jsp:param value="Member Update" name="sub"/>
    </jsp:include>
    
    <c:if test="${not empty resultSet.rows}">
    	<c:set var="row" value="${resultSet.rows[0]}"/>
    	<c:set var="mailParts" value="${fn:split(row.mail, '@')}" />
    	<c:set var="mail1" value="${mailParts[0]}" />
    	<c:set var="mail2" value="${mailParts[1]}" />
    	<c:set var="birthParts" value="${fn:split(row.birth, '/')}" />
    	<c:set var="year" value="${birthParts[0]}" />
    	<c:set var="month" value="${birthParts[1]}" />
    	<c:set var="day" value="${birthParts[2]}" />
    
    	<div class="row align-items-md-stretch">
	    	<form name="newMember" action="./processUpdateMember.jsp" method="post" onsubmit="checkForm(event)">
					<div class="mb-3 row">
						<label class="col-sm-2">아이디</label>
						<div class="col-sm-3">
							<input name="id" type="text" class="form-control" value="${row.id}" readonly>
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2">기존 비밀번호</label>
						<div class="col-sm-3">
							<input name="curPassword" type="password" class="form-control" placeholder="기존 비밀번호 입력">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">변경 비밀번호</label>
						<div class="col-sm-3">
							<input name="changePassword" type="password" class="form-control" placeholder="변경시 입력">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">변경 비밀번호 확인</label>
						<div class="col-sm-3">
							<input name="changePassword_confirm" type="password" class="form-control">
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2">성명</label>
						<div class="col-sm-3">
							<input name="name" type="text" class="form-control" value="${row.name}">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">성별</label>
						<div class="col-sm-2">
							<input name="gender" type="radio" value="남" ${row.gender == "남" ? 'checked' : '' }> 남 
							<input name="gender" type="radio" value="여" ${row.gender == "여" ? 'checked' : '' }> 여
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">생일</label>
						<div class="col-sm-10">
						  <div class="row">
						  	<div class="col-sm-2">
									<input type="text" name="birthyy" maxlength="4" class="form-control" value="${year}" size="6"> 
								</div>
								<div class="col-sm-2">
									<select name="birthmm" class="form-select" >
										<option value="">월</option>
										<option value="01" ${month == '01' ? "selected" : ''}>1</option>
										<option value="02" ${month == '02' ? "selected" : ''}>2</option>
										<option value="03" ${month == '03' ? "selected" : ''}>3</option>
										<option value="04" ${month == '04' ? "selected" : ''}>4</option>
										<option value="05" ${month == '05' ? "selected" : ''}>5</option>
										<option value="06" ${month == '06' ? "selected" : ''}>6</option>
										<option value="07" ${month == '07' ? "selected" : ''}>7</option>
										<option value="08" ${month == '08' ? "selected" : ''}>8</option>
										<option value="09" ${month == '09' ? "selected" : ''}>9</option>
										<option value="10" ${month == '10' ? "selected" : ''}>10</option>
										<option value="11" ${month == '11' ? "selected" : ''}>11</option>
										<option value="12" ${month == '12' ? "selected" : ''}>12</option>
									</select> 
								</div>
								<div class="col-sm-2">
									<input type="text" name="birthdd" maxlength="2" class="form-control" value="${day}" size="4">
								</div>
							</div>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">이메일</label>
						<div class="col-sm-10">
						  <div class="row">
								<div class="col-sm-4">
									<input type="text" name="mail1" maxlength="50" class="form-control" value="${mail1}">
								</div> @
								<div class="col-sm-3">
									<select name="mail2" class="form-select">
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
									</select>
								</div>
							</div>		
						</div>		
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">전화번호</label>
						<div class="col-sm-3">
							<input name="phone" type="text" class="form-control" placeholder="phone">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">주소</label>
						<div class="col-sm-5">
							<input name="address" type="text" class="form-control" placeholder="address">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary">회원수정</button>
							<a href="deleteMember.jsp" class="btn btn-danger">회원탈퇴</a>
							<p>${param.id}</p>
						</div>
					</div>
				</form>
 			</div>
    </c:if>
    
   	<%@ include file="../footer.jsp" %>
	</div>
</body>
</html>