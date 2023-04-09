<%-- 
    Document   : trip
    Created on : Aug 11, 2022, 4:11:26 PM
    Author     : dieuh
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row trip-body" >
    <div>
        <h1 id="nen">THÔNG TIN CHUYẾN ĐI</h1>
        <c:if test="${date != null}">
            <h5 class="text-center" style="font-weight: bold; color: #a4a4a4">
                Ngày: <fmt:formatDate pattern = "dd/MM/yyyy" value = "${date}" />
            </h5>
        </c:if>
    </div>
    <c:forEach var="trip" items="${trips}">
        <div id="blocktrip">  
            <div class="card" style="width: 30%;">
                <img id="trip-img" src="<c:url value="${trip.image}"/>" alt="${trip.coachname}" />  
            </div>
            <div id="trip-right">
                <div style="display: flex">   
                    <h1 style="font-weight: bold; color: #c19b77; margin-bottom: 0">${trip.routeId.startingpoint} - ${trip.routeId.destination}</h1>
                    <h9 style="margin-left: 70px; margin-top: 10px; font-size: 17px; color: #a4a4a4; font-weight: bold"><i class="fa-solid fa-calendar-check"> </i> 
                        <fmt:formatDate pattern = "dd/MM/yyyy" value = "${trip.departureday}" /></h9>
                </div>
                <hr>                   
                <div id="trip-p">
                    <p id="p-1" ><b><i class="fa-solid fa-hourglass-start"></i> Thời gian đi:</b> <fmt:formatDate type = "time" value = "${trip.departuretime}" />  </p>  
                    <p id="p-2" ><b><i class="fa-solid fa-hourglass-end"></i> Thời gian đến:</b> <fmt:formatDate type = "time" value = "${trip.arrivaltime}" /> </p>
                </div> 
                <div id="trip-p">
                    <p id="p-1" ><b><i class="fa-solid fa-chair"></i> Ghế trống: </b>
                        <input style=" border: none;background-color: white; margin-bottom: 0" id="result-${trip.id}"
                                                                                     onmouseover ="cRemain(${trip.id})"/></p>
                    <p id="p-2" ><b><i class="fa-solid fa-bus-simple"></i> Loại: </b>${trip.passengercarId.categoryId.categoryname}</p>
                </div>
                <p class="text-center pri" style="margin-bottom: 5px;"><b style="font-size: 14px">Giá vé:</b> 
                        <strong style=" color: orange; font-weight: bold; font-size: 16px"><fmt:formatNumber value="${price}" maxFractionDigits="3" type = "number" /> VNĐ</strong></p>

                <div id="trip-a" >                        
                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                        <a href="<c:url value="/login"/>" id="priceInfo" style="margin-left: 145px"
                           class="btn text-white action">Đặt vé</a>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <a href="<c:url value="/reservation/${trip.id}"/>" id="priceInfo" style="margin-left: 145px"
                           class="btn text-white action">Đặt vé</a>
                    </c:if>        
                </div>
            </div>
        </div>
    </c:forEach>
    
     <c:if test="${trips.size() == 0}">
        <div class="alert alert-danger" style="margin-left: 27%; width: 50%; font-size: 15px; text-align: center">Hôm nay không có chuyến xe nào khởi hành !!!</div>  
    </c:if>
    <c:if test="${trips.size() != 0}">
        <div>
            <ul class="pagination" style="float: right">
                <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="a">
                    <li class="page-item">
                        <a class="page-link" href="<c:url value="/trip/${routeId}" />?page=${a}">${a}</a></li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
</div>

<script src="<c:url value="/js/trip.js"/>"></script>