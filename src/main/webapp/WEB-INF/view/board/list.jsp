<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="../common/head.jspf" %>
	<style>
		td, th	{ text-align: center; }
	</style>
	<script>
		function search() {
			const field = $('#field').val();
			const query = $('#query').val();
			console.log("search()", field, query);
		}
	</script>
</head>
<body>
	<%@ include file="../common/top.jspf" %>
	
    <div class="container" style="margin-top: 80px;">
        <div class="row">
        	<%@ include file="../common/aside.jspf" %>
        
        	<!-- ======================== main ======================== -->
        	<div class="col-sm-9">
        		<table class="table table-sm table-borderless">
                    <tr class="d-flex">
                        <td class="col-6" style="text-align: left;">
                            <h3><strong>게시글 목록</strong>
                                <span style="font-size: 0.6em;">
                                    <a href="#" class="ms-5"><i class="far fa-file-alt"></i> 글쓰기</a>
                                </span>
                            </h3>
                        </td>
                        <td class="col-2">
                            <select class="form-select me-2" id="field" name="f">
                                <option value="title" selected>제목</option>
                                <option value="content">본문</option>
                                <option value="uname">글쓴이</option>
                            </select>
                        </td>
                        <td class="col-3">
                            <input class="form-control me-2" type="search" placeholder="검색할 내용" id="query" name="q">
                        </td>
                        <td class="col-1">
                            <button class="btn btn-outline-primary" onclick="search()">검색</button>
                        </td>
                    </tr>
                </table>
        		<hr>
        		<table class="table mt-2" style="margin-bottom: 50px;">
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