<%@page import="dao.BookstoreDao"%>
<%@page import="dto.Textbook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 부트스트랩 css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<!-- bookstore css -->
	<link href="/team3/css/bookstore/bookstore.css" rel="stylesheet">
</head>
<body>
	<%@include file="../header.jsp" %>
	<%
	int tno = Integer.parseInt(request.getParameter("tno"));
	Textbook textbook = BookstoreDao.getBookstoreDao().getBook(tno);
	%>
	<div class="container ">
		<h3 class="text-center my-4">판매하기</h3>
		<form class="col-md-8 offset-2 bookform" id="bookform" action="/team3/bookstore/bookupdate?tno=<%=textbook.getTno() %>" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-md-6"><!-- 사진 추가 -->
					<input class="form-control" id="timg" type="file" name="timg" accept="image/*">
					<div id="previewbox">
						<img  width="100%" height="420px" id="preview" alt="" src="/team3/bookstore/bookimg/<%=textbook.getTimg()%>">
					</div> 
				</div>
				<div class="col-md-6"><!-- 책정보 input -->
					<table>
						<tr>
							<td>제목</td>
							<td><input class="form-control" id="ttitle" type="text" name="ttitle" value="<%=textbook.getTtitle() %>"></td>
						</tr>					
						<tr>
							<td>저자</td>
							<td><input class="form-control" id="tauthor" type="text" name="tauthor" value="<%=textbook.getTauthor()%>"></td>
						</tr>					
						<tr>
							<td>출판사</td>
							<td><input class="form-control" id="tcompany" type="text" name="tcompany" value="<%=textbook.getTcompany() %>"></td>
						</tr>					
						<tr>
							<td>출판년도</td>
							<td><input class="form-control" id="tyear" type="text" name="tyear" value="<%=textbook.getTyear()%>"></td>
						</tr>					
						<tr>
							<td>사용한 수업</td>
							<td><input class="form-control" id="tclass" type="text" name="tclass" value="<%=textbook.getTclass() %>"></td>
						</tr>					
						<tr>
							<td>상태</td>
							<td>
								<%if(textbook.getTcondition() == 1){%>
									<input type="radio" value="1" name="tcondition" checked="checked">상
									<input type="radio" value="2" name="tcondition">중
									<input type="radio" value="3" name="tcondition">하
								<%}else if(textbook.getTcondition() == 2){%>
									<input type="radio" value="1" name="tcondition">상
									<input type="radio" value="2" name="tcondition" checked="checked">중
									<input type="radio" value="3" name="tcondition">하
								<%}else {%>
								<input type="radio" value="1" name="tcondition">상
								<input type="radio" value="2" name="tcondition">중
								<input type="radio" value="3" name="tcondition" checked="checked">하
								<%} %>
							</td>
						</tr>					
						<tr>
							<td>희망 가격</td>
							<td><input class="form-control" id="tprice" type="text" name="tprice" value="<%=textbook.getTprice()%>"></td>
						</tr>					
						<tr>
							<td>추가 설명</td>
							<td><textarea class="form-control" id="tcontent" name="tcontent" style="resize: none; min-height:150px;">
							<%=textbook.getTcontent() %>
							</textarea> </td>
						</tr>					
					</table>
				</div>
			</div>
			<div><!-- 버튼 구역 -->
				<div class="row my-3">
					<div class="col-md-2 offset-4">
						<button id="btnadd" type="button" class="form-control btn btn-dark" onclick="bookadd()">수정</button>
					</div>
					<div class="col-md-2">
						<a href="/team3/bookstore/booklist.jsp"><button type="button" class="form-control btn btn-outline-secondary" >취소</button></a>
					</div>
				</div>
			</div>
		</form>
		<%@include file="../footer.jsp" %>
	</div>
	<!-- jquery cdn -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 부트스트랩 js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
	<script src="/team3/js/bookstore/bookstore.js" type="text/javascript"></script>
</body>
</html>