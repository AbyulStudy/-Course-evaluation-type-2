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
	
		<h1>교과목 추가</h1>
		
		<form action="Action.jsp" method="post" name="form_insert">
		<input type="hidden" name="mode" value="insert">
		<table class="table__insert" border="1">
			<tr>
				<td>과목 코드</td>
				<td><input type="text" name="code" style="width:100%"/></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td><input type="text" name="name" style="width:100%"/></td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" name="score"style="width:100%"/></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td>
					<select name="lecture" style="width:100%">
						<option value=0>담당강사선택</option>
						<option value=1>김교수</option>
						<option value=2>이교수</option>
						<option value=3>박교수</option>
						<option value=4>우교수</option>
						<option value=5>최교수</option>
						<option value=6>임교수</option>
					</select>
				
				</td>
			</tr>
			<tr>
				<td>요일</td>
				<td>
					<input type="radio" id="mon" name="day" value="1" />
					<label for="mon" >월</label>
					<input type="radio" id="tus" name="day" value="2" />
					<label for="tus">화</label>
					<input type="radio" id="wed" name="day" value="3" />
					<label for="wed">수</label>
					<input type="radio" id="thu" name="day" value="4" />
					<label for="thu">목</label>
					<input type="radio" id="fri" name="day" value="5" />
					<label for="fri">금</label>
					<input type="radio" id="sat" name="day" value="6" />
					<label for="sat">토</label>
					<input type="radio" id="sun" name="day" value="7" />
					<label for="sun">일</label>
				</td>
			</tr>
			<tr>
				<td>시작시간</td>
				<td><input type="text" name="startTime" style="width:100%"/></td>
			</tr>
			<tr>
				<td>종료시간</td>
				<td><input type="text" name="endTime" style="width:100%"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="추가" onclick="valueChecked();"/>
					<input type="button" value="목록" onclick="listLocation()"/>
				</td>
			</tr>
		</table>
		</form>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>