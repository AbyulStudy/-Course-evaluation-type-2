<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.Utils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST_02</title>
<script type="text/javascript" src="./check.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
	
		<h1>교과목 조회/수정</h1>		
		<form method="get" name="form_insert">
		<table class="table__insert" border="1">
			<tr>
				<td>과목 코드</td>
				<td>과목명</td>
				<td>학점</td>
				<td>담당강사</td>
				<td>요일</td>
				<td>시작시간</td>
				<td>종료시간</td>
				<td>삭제</td>
			</tr>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String Professor = "";
	String week = "";
	SimpleDateFormat format = new SimpleDateFormat("HH시 mm분"); 
	String start = "";
	String end ="";
	try{
		String sql = "SELECT c.code, c.name cname, c.score, l.name lname, c.day, c.startTime, c.endTime " + 
					"FROM t1_class_tbl_02 c , t1_lecturer_tbl_02 l " + 
					"WHERE c.lecture = l.idx " +
					"ORDER BY code";
		conn = Utils.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			switch(rs.getString(5)){
			case "1":
				week = "월";
				break;
			case "2":
				week = "화";
				break;
			case "3":
				week = "수";
				break;
			case "4":
				week = "목";
				break;
			case "5":
				week = "금";
				break;
			case "6":
				week = "토";
				break;
			case "7":
				week = "일";
				break;
			}
			start = rs.getString(6);
			while(start.length() < 4){
				start = "0" + start;
			}
			end = rs.getString(7);
			while(end.length() < 4){
				end = "0" + end;
			}
			
			start = start.substring(0,2) + "시" + start.substring(2,4) + "분";
			end = end.substring(0,2) + "시" + start.substring(2,4) + "분";
			
%>
		
			<tr>
				<td><a href="modify.jsp?code=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td>	
				<td><%=rs.getString(2) %></td>	
				<td><%=rs.getString(3) %></td>	
				<td><%=rs.getString(4) %></td>	
				<td><%=week + "요일"%></td>		
				<td><%=start%></td>		
				<td><%=end%></td>							
				<td><a href="Action.jsp?code=<%=rs.getString(1) %>&mode=delete">삭제</a></td>
			</tr>
<%
		}
	} catch (Exception e){
		e.printStackTrace();
	}
%>
			
		</table>
		</form>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>