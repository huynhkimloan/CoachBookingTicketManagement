<%-- 
    Document   : comment
    Created on : Jun 3, 2023, 5:32:09 PM
    Author     : dieuh
--%>

<%-- 
    Document   : drivers
    Created on : Aug 14, 2022, 6:29:27 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!---->
<h1 class="text-center text-danger">DANH SÁCH ĐÁNH GIÁ TÀI XẾ</h1>

<c:url value="/admin/rating/search" var="search" />
<form:form action="${search}" method="get">
    <div class="input-group">
        <div class="form-outline">
            <input id="search-input" type="search" class="form-control" name="kw" placeholder="Nhập từ khóa cần tìm..." />
        </div>
        <div>
            <button id="search-button" type="submit" class="btn btn-default">
                <i class="fas fa-search"></i>
            </button>
        </div>
    </div>
</form:form>

<c:if test="${listRating.size()==0}">
    <p><em>Không có thông tin bạn đang tìm!!!</em></p>
</c:if> 


    <table class="table table-bordered" style="margin-top: 20px">
    <thead class="admin-table text-center">
        <tr>
            <th>Tên tài xế</th>
            <th>Sao trung bình</th>  
                
        </tr>
    </thead
    <tbody>
        <c:forEach items="${listRating}" var="a">
            <tr>
                <td><a href="<c:url value="/admin/rating/detail/${a[2]}"/>" style="text-decoration: none">${a[0]}</a></td>
                <td>${a[1]}</td>  
                
            </tr>            
        </c:forEach>
    </tbody>
</table>


