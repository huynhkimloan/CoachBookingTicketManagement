<%-- 
    Document   : tickets
    Created on : Sep 4, 2022, 3:23:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.itextpdf.text.*, com.itextpdf.text.pdf.*"%>

<!---->
<h1 class="text-center text-danger">THÔNG TIN VÉ XE</h1>

<c:url value="/tickets/search" var="search" />
<form:form action="${search}" method="get">
    <div class="input-group mb-4">
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


<c:if test="${listTrips.size()==0}">
    <p><em>Không có vé nào có thông tin bạn đang tìm!!!</em></p>
</c:if> 

<table class="table table-bordered">
    <thead class="admin-table text-center">
        <tr>
            <th style="width: 5px">Mã vé</th>
            <th style="width: 150px">Người mua</th>
            <th style="width: 5px">SĐT</th>
            <th style="width: 30px">Vị trí ngồi</th>
            <th style="width: 80px">Phương thức trả</th>
            <th style="width: 90px">Xe</th>
            <th style="width: 150px">Chuyến</th>
            <th style="width: 40px">Trạng thái</th>
            <th style="width: 150px">Ngày mua</th>
            <th style="width: 100px">Tổng tiền</th>
            <th style="width: 15px">Chức năng</th>
        </tr>
    </thead>
    <tbody>

        <c:forEach items="${listTickets}" var="r">
            <tr>
                <td>${r.id}</td>
                <td>${r.userId.name}</td>
                <td>${r.userId.phone}</td>
                <td>${r.seatId.name}</td>
                <td>${r.paymentmethod}</td>
                <td>${r.passengercarId.name}</td>
                <td>${r.tripId.coachname}</td>
                <c:if test="${r.active==0}">
                    <td class="text-center"><i class="fas fa-check-square" style="color: #2196F3"></i></td>
                </c:if>
                <c:if test="${r.active==1}">
                    <td class="text-center"><i class="fas fa-window-close" style="color: red"></i></td>
                </c:if>
                <c:if test="${r.active==2}">
                    <td class="text-center"><i class="fa-solid fa-pause" style="color: #e6de08"></i></td>
                </c:if>
                <td><fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${r.createddate}" /></td>
                <td><fmt:formatNumber value="${r.totalprice}" maxFractionDigits="3" type = "number" /></td>
                <td class="text-center">
                    <a style="color: #7c4c02; cursor: pointer" title="Xuất"
                       onclick="exportPdf('${r.id}', '${r.userId.name}', '${r.tripId.coachname}', '${r.seatId.name}', '${r.totalprice}')">
                        <i class="fas fa-file-export"></i>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<nav aria-label="Page navigation example" style="float: right">
    <ul class="pagination">
        <c:forEach var="i" begin="0" end="${totalItem}">
            <c:url value="/tickets/list/${i+1}" var="action" />
            <li class="page-item"><a class="page-link" href="${action}"><c:out value="${i+1}"/></a></li>
            </c:forEach>
    </ul>
</nav>

<script>
    function exportPdf(ticketId, customerName, tripName, seatName, totalPrice) {
        var docDefinition = {
            content: [
                {text: 'THÔNG TIN VÉ XE', fontSize: 20, color: 'red', bold: true, alignment: 'center'},
                {text: 'Mã vé: ' + ticketId, fontSize: 12, alignment: 'center'},
                {text: 'Họ và tên: ' + customerName, fontSize: 12, alignment: 'center'},
                {text: 'Chuyến đi: ' + tripName, fontSize: 12, alignment: 'center'},
                {text: 'Vị trí ngồi: ' + seatName, fontSize: 12, alignment: 'center'},
                {text: 'Tổng tiền: ' + totalPrice, fontSize: 12, bold: true, color: '#c19b77', alignment: 'center'}
            ]
        };
        pdfMake.createPdf(docDefinition).download('ticket - ' + ticketId + ' - ' + customerName +'.pdf');
    }
</script>
