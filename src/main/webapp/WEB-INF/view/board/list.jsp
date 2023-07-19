<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="../common/head.jspf" %>
	<style>
		td, th	{ text-align: center; }
	</style>
</head>
<body>
	<%@ include file="../common/top.jspf" %>
	
    <div class="container" style="margin-top: 80px;">
        <div class="row">
        	<%@ include file="../common/aside.jspf" %>
        
        	<!-- ======================== main ======================== -->
        	<div class="col-sm-9">
        		<h3><strong>게시글 목록</strong></h3>
        		<hr>
        		<table class="table table-condensed table-hover" style="margin-bottom: 50px;">
        			<tr class="table-secondary">
        				<th style="width: 8%;">ID</th>
        				<th style="width: 50%;">제목</th>
        				<th style="width: 10%;">글쓴이</th>
        				<th style="width: 24%;">날짜/시간</th>
        				<th style="width: 8%;">조회수</th>
        			</tr>
        		<c:forEach var="board" items="${boardList}">
        			<tr>
        				<td>${board.bid}</td>
        				<td>
        					<a href="/bbs/board/detail?bid=${boardbid}">${board.title}
        					<c:if test="${board.replyCount ge 1}">
        						<span class="text-danger">[${board.replyCount}]</span>
        					</c:if>
        					</a>
        				</td>
        				<td>${board.uname}</td>
        				<td>${board.modTime}</td>
        				<td>${board.viewCount}</td>
        			</tr>
        		</c:forEach>
        		</table>
        	</div>
        	<!-- ======================== main ======================== -->
        </div>
    </div>
	
	<%@ include file="../common/bottom.jspf" %>
</body>
</html>