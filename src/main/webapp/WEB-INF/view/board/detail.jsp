<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newline", "\n"); %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="../common/head.jspf" %>
	<style>
		td, th	{ text-align: center; }
		.disabled-link	{ pointer-events: none; }
	</style>
</head>
<body>
	<%@ include file="../common/top.jspf" %>
	
    <div class="container" style="margin-top: 80px;">
        <div class="row">
        	<%@ include file="../common/aside.jspf" %>
        
        	<!-- ======================== main ======================== -->
			<div class="col-sm-9">
                <h3><strong>게시글 상세 조회</strong>
                    <span style="font-size: 0.6em;">
                        <a href="/bbs/board/list?p=${currentBoardPage}&f=&q=" class="ms-5""><i class="fas fa-list-ul"></i> 목록</a>
					
					<%-- 본인만 수정 가능 --%>
					<c:if test="${uid eq board.uid}">
                        <a href="/bbs/board/update?bid=${board.bid}" class="ms-3"><i class="far fa-edit"></i> 수정</a>  <!-- uid, bid -->
					</c:if>
					<c:if test="${uid ne board.uid}">
						<a href="#" class="ms-3 disabled-link"><i class="far fa-edit"></i> 수정</a>
					</c:if>
					
					<%-- 본인만 삭제 가능 --%>
					<c:if test="${uid eq board.uid}">
                        <a href="/bbs/board/delete?bid=${board.bid}" class="ms-3"><i class="far fa-edit"></i> 삭제</a>  <!-- uid, bid -->
					</c:if>
					<c:if test="${uid ne board.uid}">
						<a href="#" class="ms-3 disabled-link"><i class="far fa-edit"></i> 삭제</a>
					</c:if>
                    </span>
                </h3>
                <hr>
                <div class="row">
                    <div class="col-8">
                        <h5>${board.title}</h5>
                        <h6>글번호: ${board.bid} | ${fn:replace(board.modTime, 'T', ' ')}</h6>
                        <h6>첨부파일: 
                        <c:forEach var="file" items="${fileList}">
                        	<a href="#" class="me-2" download>${file}</a>
                        </c:forEach>
                        </h6>
                    </div>
                    <div class="col-4 text-end">
                        <h5>${board.uname}</h5>
                        <h6>조회 ${board.viewCount}&nbsp;&nbsp;댓글 ${board.replyCount}</h6>
                    </div>

                    <div class="col-12"><hr></div>
                    <div class="col-12">
                    	${fn:replace(board.content, newline, '<br>')}
                    </div>

                    <div class="col-12"><hr></div>
                    <div class="col-12">
                    <c:forEach var="reply" items="${replyList}">
                    	<c:if test="${reply.isMine eq 0}">
	                        <div class="d-flex flex-row mt-1">
	                            <div class="card bg-light text-dark w-75">
	                                <div class="card-body">
	                                    ${reply.uname}&nbsp;&nbsp;${fn:replace(reply.regTime, 'T', ' ')}<br>
	                                    ${reply.comment}
	                                </div>
	                            </div>
	                        </div>
                    	</c:if>
                    	<c:if test="${reply.isMine eq 1}">
	                        <div class="d-flex flex-row-reverse mt-1">
	                            <div class="card w-75">
	                                <div class="card-body text-end">
	                                    ${reply.uname}&nbsp;&nbsp;${fn:replace(reply.regTime, 'T', ' ')}<br>
	                                    ${reply.comment}
	                                </div>
	                            </div>
	                        </div>
                    	</c:if>
                    </c:forEach>
                        
                        <form class="form-inline" action="/bbs/reply/write" method="post">
                            <input type="hidden" name="bid" value="${board.bid}">
                            <input type="hidden" name="uid" value="${board.uid}">
                            <!-- <label for="comment" class="ml-5 mt-3 mr-3">댓글</label>
                			<textarea class="ml-3 mt-3 mr-3" id="comment" name="comment" rows="3" cols="80"></textarea>
                			<button type="submit" class="btn btn-primary ml-3 mt-3 mr-5">등록</button> -->
                            <table class="table table-borderless mt-2">
                                <tr class="d-flex">
                                    <td class="col-1 text-end">
                                        <label for="commnet">댓글</label>
                                    </td>
                                    <td class="col-9">
                                        <textarea class="form-control" id="comment" name="comment" rows="3"></textarea>
                                    </td>
                                    <td class="col-2">
                                        <button type="submit" class="btn btn-primary">등록</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        	<!-- ======================== main ======================== -->
        </div>
    </div>
	
	<%@ include file="../common/bottom.jspf" %>
</body>
</html>