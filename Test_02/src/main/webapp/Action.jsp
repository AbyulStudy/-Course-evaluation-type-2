<%@page import="DBPKG.Utils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("UTF-8");
	String mode = request.getParameter("mode");	

	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "";
	String code = request.getParameter("code");
	String name = request.getParameter("name");
	String score = request.getParameter("score");
	String lecture = request.getParameter("lecture");
	String day = request.getParameter("day");
	String startTime = request.getParameter("startTime");
	String endTime = request.getParameter("endTime");
	System.out.println("code : " + code);
	System.out.println("name : " + name);
	System.out.println("score : " + score);
	System.out.println("lecture : " + lecture);
	System.out.println("day : " + day);
	System.out.println("startTime : " + startTime);
	System.out.println("endTime : " + endTime);
	try{
		conn = Utils.getConnection();
		
		switch(mode){
		case "insert":
			System.out.println("insert");
			sql = "INSERT INTO t1_class_tbl_02 " + 
					"VALUES(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.setString(2, name);
			pstmt.setString(3, score);
			pstmt.setString(4, lecture);
			pstmt.setString(5, day);
			pstmt.setString(6, startTime);
			pstmt.setString(7, endTime);
			pstmt.executeUpdate();
			%>
			<jsp:forward page="insert.jsp"></jsp:forward>
			<%			
			break;	
			
		case "modify": 
			System.out.println("modify");
			sql = "UPDATE t1_class_tbl_02 SET " + 
			"name=?,score=?,lecture=?,day=?,startTime=?,endTime=? " + 
			"WHERE code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, score);
			pstmt.setString(3, lecture);
			pstmt.setString(4, day);
			pstmt.setString(5, startTime);
			pstmt.setString(6, endTime);
			pstmt.setString(7, code);
			
			pstmt.executeUpdate();
			%>
			<jsp:forward page="modify.jsp"></jsp:forward>
			<%		
			break;
		case "delete":
			System.out.println("delete");
			sql = "DELETE FROM t1_class_tbl_02 WHERE code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			
			pstmt.executeUpdate();
			%>
			<jsp:forward page="list.jsp"></jsp:forward>
			<%	
			break;
		}

				
	
	} catch(Exception e){
		e.printStackTrace();
	}
	
	
%>
