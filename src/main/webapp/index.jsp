<%@page import="com.DAO.BookDAOImpl"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.DB.DBConnect" %>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file ="all_component/allCss.jsp" %>
<style type="text/css">
.back-img{
background:url("img/bg.jpg");
height:50vh;
width:100%;
background-repeat:no-repeat;
background-size:cover;
}
.crd-ho:hover{
background-color:#fcf7f7;
}
</style>
</head> 

<!-- <style>
.card-img-top{
width:100px;
    display: block;
    margin: auto;
}

h5{
font-family: auto;
padding-top:5px;
}
.card{
margin:10px;
}
.card-body{
padding:10px;
}

</style>
 -->
<body style="background-color:#f7f7f7;">
<%
User u=(User)session.getAttribute("userobj"); %>





<%@include file ="all_component/navbar.jsp" %>
<div class="container-fluid back-img">
<h2 class="text-center text-warning">Ebook Management System</h2>
</div>

<%-- <% Connection conn =DBConnect.getConnection();
out.println(conn);
%> --%>

	<!-- Start Recent book Code
 -->
 <div class="container">
<h3 class="text-center">Recent Book</h3>
<div class="row">
<%
BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConnection());
List<BookDtls> list2=dao2.getRecentBooks();
for(BookDtls b:list2){
	%>
	
<div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="book/<%=b.getPhotoName() %>"  style= "width:150px;height:200px"class="img-thumblin">


<p><%=b.getBookName() %></p>
<p><%=b.getAuthor() %></p>
<p>
<%
if(b.getBookCategory().equals("Old")){%>
	Categories:<%=b.getBookCategory()%></p>
	<div class="row">

<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
<%}else{%>
	Categories:<%=b.getBookCategory()%></p>
	<div class="row">
	<%if(u==null){
	%>
	<a href="login.jsp" class="btn btn-danger btn-sm ml-3">Add Cart</a>
<%
}else{
%>
	<a href="cart?bid=<%=b.getBookId() %>&& uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-3">Add Cart</a>
<%
}
%>
	<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
	<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa-solid fa-indian-rupee-sign"></i></a>
	</div>
<%}

%>


</div>
</div>
</div>
	
	
<%}
%>

<!-- -------------------------------------------------
 -->
<!--  <div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="book/download.jpg"  style= "width:150px;height:200px"class="img-thumblin">
<p>Java Programming</p>
<p>Balgurusway</p>
<p>Categories:New</p>
<div class="row">
<a href="" class="btn btn-danger btn-sm ml-3">Add Cart</a>
<a href="" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1">299</a>
</div>
</div>
</div>
</div> -->
<!-- -------------------------------------------------
 -->
<!--  <div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="book/download.jpg" style= "width:150px;height:200px"class="img-thumblin">
<p>Java Programming</p>
<p>Balgurusway</p>
<p>Categories:New</p>
<div class="row">
<a href="" class="btn btn-danger btn-sm ml-3">Add Cart</a>
<a href="" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1">299</a>
</div>
</div>
</div>
</div> -->
<!-- ---------------------------------------------
 -->
<!--  <div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="book/download.jpg"  style= "width:150px;height:200px"class="img-thumblin">
<p>Java Programming</p>
<p>Balgurusway</p>
<p>Categories:New</p>
<div class="row">
<a href="" class="btn btn-danger btn-sm ml-3">Add Cart</a>
<a href="" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1">299</a>
</div>
</div>
</div>
</div> -->


</div>
<div class="text-center mt-2">
<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>

</div>

<!-- End Recent book Code finish
 -->
 <hr>
 
<!--  Start New Book code
 --> 
  <div class="container">
<h3 class="text-center">New Book</h3>
<div class="row">

<%
BookDAOImpl dao=new BookDAOImpl(DBConnect.getConnection());
/* BookDtls b = new BookDtls(); */
List<BookDtls> list=dao.getNewBook();
for(BookDtls b:list){
	%>
	<div class="col-md-3">
	<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="book/<%=b.getPhotoName() %>"  style= "width:150px;height:200px"class="img-thumblin">
<p><%=b.getBookName() %></p>
<p><%=b.getAuthor() %></p>
<p>Categories:<%=b.getBookCategory()%></p>
<div class="row">

<%if(u==null){
	%>
	<a href="login.jsp" class="btn btn-danger btn-sm ml-3">Add Cart</a>
<%
}else{
%>
	<a href="cart?bid=<%=b.getBookId() %>&& uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-3">Add Cart</a>
<%
}
%>

<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
</div>
</div>
</div>
	<% 
}
%>


<!-- -------------------------------------------------
 -->
<!--  <div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="book/download.jpg"  style= "width:150px;height:200px"class="img-thumblin">
<p>Java Programming</p>
<p>Balgurusway</p>
<p>Categories:New</p>
<div class="row">
<a href="" class="btn btn-danger btn-sm ml-3">Add Cart</a>
<a href="" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1">299</a>
</div>
</div>
</div>
</div> -->
<!-- -------------------------------------------------
 -->
<!--  <div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="book/download.jpg"  style= "width:150px;height:200px"class="img-thumblin">
<p>Java Programming</p>
<p>Balgurusway</p>
<p>Categories:New</p>
<div class="row">
<a href="" class="btn btn-danger btn-sm ml-3">Add Cart</a>
<a href="" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1">299</a>
</div>
</div>
</div>
</div> -->
<!-- ---------------------------------------------
 -->
<!--  <div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="book/download.jpg" style= "width:150px;height:200px"class="img-thumblin">
<p>Java Programming</p>
<p>Balgurusway</p>
<p>Categories:New</p>
<div class="row">
<a href="" class="btn btn-danger btn-sm ml-3">Add Cart</a>
<a href="" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1">299</a>
</div>
</div>
</div>
</div> -->


</div>
<div class="text-center mt-2">
<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>

</div>

<!-- End New book Code finish
 -->
 
 <hr>
 
<!--  Start old book code
 --> 
  <div class="container">
<h3 class="text-center">Old Book</h3>
<div class="row">

<%
BookDAOImpl dao3=new BookDAOImpl(DBConnect.getConnection());
/* BookDtls b = new BookDtls(); */
List<BookDtls> list3=dao.getOldBooks();
for(BookDtls b:list3){
	%>
	<div class="col-md-3">
	<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="book/<%=b.getPhotoName() %>"  style= "width:150px;height:200px"class="img-thumblin">
<p><%=b.getBookName() %></p>
<p><%=b.getAuthor() %></p>
<p><%=b.getBookCategory() %></p>
<div class="row">
<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
</div>
</div>
</div>
</div>
	<% 
}
%>





<!-- -------------------------------------------------
 -->
<!--  <div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="book/download.jpg" style= "width:150px;height:200px"class="img-thumblin">
<p>Java Programming</p>
<p>Balgurusway</p>
<p>Categories:New</p>
<div class="row">
<a href="" class="btn btn-danger btn-sm ml-3">Add Cart</a>
<a href="" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1">299</a>
</div>
</div>
</div>
</div> -->
<!-- -------------------------------------------------
 -->
<!--  <div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="book/download.jpg"  style= "width:150px;height:200px"class="img-thumblin">
<p>Java Programming</p>
<p>Balgurusway</p>
<p>Categories:New</p>
<div class="row">
<a href="" class="btn btn-danger btn-sm ml-3">Add Cart</a>
<a href="" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1">299</a>
</div>
</div>
</div>
</div> -->
<!-- ---------------------------------------------
 -->
<!--  <div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="book/download.jpg" style= "width:150px;height:200px"class="img-thumblin">
<p>Java Programming</p>
<p>Balgurusway</p>
<p>Categories:New</p>
<div class="row">
<a href="" class="btn btn-danger btn-sm ml-3">Add Cart</a>
<a href="" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1">299</a>
</div>
</div>
</div>
</div>
 -->

</div>
<div class="text-center mt-2">
<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>

</div>

<!-- End Old book Code finish
 -->
 
 
 
 
 
 
 
<!-- 
<div class="container">
<h2 class="text-center"><b>Recent Book</b></h2>
<div class="d-flex mt-4">
<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="https://media.springernature.com/full/springer-static/cover-hires/book/978-1-4302-0032-1" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title text-center">C Programming</h5>
    <h5 class="card-title text-center">Dennies Ritchie</h5>
    <h5 class="card-title text-center">Categorial : <span>New</span></h5>
<div class="d-flex">
	    <a href="#" class="btn btn-danger">View Details</a>
	    <a href="#" class="btn btn-success" style="margin-left: 5px;">View</a>
	    <a href="#" class="btn btn-danger" style="margin-left: 5px;"><b>₹</b>200</a>
	  </div>
  </div>
</div>

<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="https://media.springernature.com/full/springer-static/cover-hires/book/978-1-4302-0032-1" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title text-center">C Programming</h5>
    <h5 class="card-title text-center">Dennies Ritchie</h5>
    <h5 class="card-title text-center">Categorial : <span>New</span></h5>
<div class="d-flex">
	    <a href="#" class="btn btn-danger">View Details</a>
	    <a href="#" class="btn btn-success" style="margin-left: 5px;">View</a>
	    <a href="#" class="btn btn-danger" style="margin-left: 5px;"><b>₹</b>200</a>
	  </div>
  </div>
</div>

<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="https://media.springernature.com/full/springer-static/cover-hires/book/978-1-4302-0032-1" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title text-center">C Programming</h5>
    <h5 class="card-title text-center">Dennies Ritchie</h5>
    <h5 class="card-title text-center">Categorial : <span>New</span></h5>
<div class="d-flex">
	    <a href="#" class="btn btn-danger">View Details</a>
	    <a href="#" class="btn btn-success" style="margin-left: 5px;">View</a>
	    <a href="#" class="btn btn-danger" style="margin-left: 5px;"><b>₹</b>200</a>
	  </div>
  </div>
</div>

<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="https://media.springernature.com/full/springer-static/cover-hires/book/978-1-4302-0032-1" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title text-center">C Programming</h5>
    <h5 class="card-title text-center">Dennies Ritchie</h5>
    <h5 class="card-title text-center">Categorial : <span>New</span></h5>
<div class="d-flex">
	    <a href="#" class="btn btn-danger">View Details</a>
	    <a href="#" class="btn btn-success" style="margin-left: 5px;">View</a>
	    <a href="#" class="btn btn-danger" style="margin-left: 5px;"><b>₹</b>200</a>
	  </div>
  </div>
</div>

</div>


</div> -->

 <%@include file="all_component/footer.jsp" %>
 
</body>
</html>