<%@page import="DBPKG.Utils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
	String code = request.getParameter("code");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String name = "";
	String score = "";
	String professor = "";
	String day = "";
	String start = "";
	String end = "";
	try{
		String sql = "SELECT * " + 
					"FROM t1_class_tbl_02 " + 
					"WHERE code = ?";
		conn = Utils.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, code);
		rs = pstmt.executeQuery();
		while(rs.next()){
			name = rs.getString(2);
			score = rs.getString(3);
			professor = rs.getString(4);
			day = rs.getString(5);
			start = rs.getString(6);
			end = rs.getString(7);
		}
		
		while(start.length() < 4) {
			start = "0" + start;
		}
		// start = start.substring(0,2) + "시" + start.substring(2,4) + "분";
		while(end.length() < 4) {
			end = "0" + end;
		}
		// end = end.substring(0,2) + "시" + end.substring(2,4) + "분";
	} catch(Exception e){
		e.printStackTrace();
	}
%>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
	
		<h1>교과목 수정</h1>
		
		<form action="Action.jsp" method="post" name="form_insert">
		<input type="hidden" name="mode" value="modify">
		<table class="table__insert" border="1">
			<tr>
				<td>과목 코드</td>
				<td><input type="text" name="code" style="width:100%;" readonly="readonly" value="<%= code%>"/></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td><input type="text" name="name" style="width:100%" value="<%=name %>" /></td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" name="score"style="width:100%" value="<%=score %>"/></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td>
					<select name="lecture" style="width:100%" >
						<option value=0>담당강사선택</option>
						<option value=1 <%if(professor.equals("1")) out.println("selected"); %>>김교수</option>
						<option value=2 <%if(professor.equals("2")) out.println("selected"); %>>이교수</option>
						<option value=3 <%if(professor.equals("3")) out.println("selected"); %>>박교수</option>
						<option value=4 <%if(professor.equals("4")) out.println("selected"); %>>우교수</option>
						<option value=5 <%if(professor.equals("5")) out.println("selected"); %>>최교수</option>
						<option value=6 <%if(professor.equals("6")) out.println("selected"); %>>임교수</option>
					</select>
				
				</td>
			</tr>
			<tr>
				<td>요일</td>
				<td>
					<input type="radio" id="mon" name="day" value="1" <%if(day.equals("1")) out.println("checked"); %>/>
					<label for="mon">월</label>
					<input type="radio" id="tus" name="day" value="2" <%if(day.equals("2")) out.println("checked"); %>/>
					<label for="tus">화</label>
					<input type="radio" id="wed" name="day" value="3" <%if(day.equals("3")) out.println("checked"); %>/>
					<label for="wed">수</label>
					<input type="radio" id="thu" name="day" value="4" <%if(day.equals("4")) out.println("checked"); %>/>
					<label for="thu">목</label>
					<input type="radio" id="fri" name="day" value="5" <%if(day.equals("5")) out.println("checked"); %>/>
					<label for="fri">금</label>
					<input type="radio" id="sat" name="day" value="6" <%if(day.equals("6")) out.println("checked"); %>/>
					<label for="sat">토</label>
					<input type="radio" id="sun" name="day" value="7" <%if(day.equals("7")) out.println("checked"); %>/>
					<label for="sun">일</label>
				</td>
			</tr>
			<tr>
				<td>시작시간</td>
				<td><input type="text" name="startTime" style="width:100%" value="<%=start %>"/></td>
			</tr>
			<tr>
				<td>종료시간</td>
				<td><input type="text" name="endTime" style="width:100%" value="<%=end %>"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="return modify()"/>
					<input type="button" value="목록" onclick="listLocation()"/>
				</td>
			</tr>
		</table>
		</form>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>