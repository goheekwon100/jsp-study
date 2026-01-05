<%@page import="org.apache.jasper.compiler.Node.ParamAction"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입정보</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>요청 파라미터 이름</th>
			<th>요청 파라미터 값</th>
		</tr>
		
		<%
			Enumeration<String> paramNames = request.getParameterNames();
			while (paramNames.hasMoreElements()) {
				String paramName = paramNames.nextElement();
				out.print("<tr>");
				out.print("<td>" + paramName + "</td>");
				
				
				out.print("<td>");
				String[] paramValues = request.getParameterValues(paramName);
				if (paramValues != null) {
					for (int i = 0; i < paramValues.length; i++) {
						out.println(" " + paramValues[i]);
					}
				}
				/* if ("hobby".equals(paramName)) {
					String[] paramValues = request.getParameterValues(paramName);
					for (int i = 0; i < paramValues.length; i++) {
						out.print(" " + paramValues[i]);
					}
				} else {
					String paramValue = request.getParameter(paramName);
					out.print(paramValue);
				} */
				out.print("</td>");
				
				out.print("</tr>");
			}
		%>
	</table>	
	
</body>
</html>