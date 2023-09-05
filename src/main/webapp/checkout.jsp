<%@page import="com.entity.Cart"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.DB.DBConnect" %>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User" %>
<%@page import="com.entity.Cart" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="all_component/navbar.jsp" %>

<c:if test="${not empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<div class="container">
<div class="row p-2">
<div class="col-md-6">

<div class="card bg-white">
<h3 class="text-center text-success">Your Selcted Item</h3>
<div class="card-body">
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  User u=(User) session.getAttribute("userobj");
  CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnection());
  List <Cart> cart=dao.getBookByUser(u.getId());
  for(Cart c:cart){%>
	   <tr>
      <th scope="row"><%=c.getBookName() %></th>
      <td><%=c.getAuthor() %></td>
      <td><%=c.getPrice() %></td>
      <td>
      <a href="" class=btn btn-sm btn-danger">Remove</a>
      
      </td>
    </tr>
    <tr>
  <%}
  
  %>
   
     
  </tbody>
</table>

</div>
</div>
</div>

<div class="col-md-6">
<div class="card">
<div class="card-body">
<h3 class="text-center text-success">Your Details for order</h3>
<form>
<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Name</label>
      <input type="email" class="form-control" id="inputEmail4" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email</label>
      <input type="text" class="form-control" id="inputPassword4">
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Phone Number</label>
      <input type="number" class="form-control" id="inputEmail4" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Address</label>
      <input type="text" class="form-control" id="inputPassword4" >
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Landmark</label>
      <input type="text" class="form-control" id="inputEmail4" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">City</label>
      <input type="text" class="form-control" id="inputPassword4" >
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">State</label>
      <input type="text" class="form-control" id="inputEmail4" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Pin code</label>
      <input type="text" class="form-control" id="inputPassword4" >
    </div>
  </div>
<div class="form-group">
<label>Payement Mode</label>
<select class="form-control">
<option>-----Select---</option>
<option>Cash On Delivery</option>

</select>

</div>
<div class="text-center">
<button class="btn btn-warning">Order Now</button>
<a href="index.jsp " class="btn btn-success">Continue Shopping</a>
</div>

</form>


</div>
</div>
</div>
</div>
</div>

</body>
</html>