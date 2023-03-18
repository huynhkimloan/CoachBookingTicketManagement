<%-- 
    Document   : feedback
    Created on : Mar 5, 2023, 1:47:34 PM
    Author     : dieuh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script src="<c:url value="/js/trip.js"/>"></script>

<%--<c:if test="${tripFeedback.size() != 0}">
    <div>
        <ul class="pagination">
            <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="a">
                <li class="page-item"><a class="page-link" href="<c:url value="/feedback" />?page=${a}">${a}</a></li>
                </c:forEach>
        </ul>
    </div>
</c:if>--%>


<div class="row trip-body" style="margin-top: 70px;">
    <div>
        <h1 id="nen">Danh sách các chuyến đi</h1>
    </div>
    <c:if test="${tripFeedback.size() == 0}">
        <div class="alert alert-danger" style="margin-left: 27%; width: 50%; font-size: 20px; text-align: center">Hôm nay không có chuyến xe nào khởi hành !!!</div>  
    </c:if>
    <hr> 
    <c:forEach var="tripDepartureday" items="${tripFeedback}">
        <div id="blocktrip">  
            <div class="card" style="width: 35%;">
                <img style=" height: 300px;" class=" img-fluid card-header" id="trip-img" src="<c:url value="${tripDepartureday.image}"/>" alt="${tripDepartureday.coachname}" />  
            </div>
            <div id="trip-right">
                <div style="display: flex">   
                    <h1> <i class="fa-solid fa-bus" id="coachname"></i> ${tripDepartureday.routeId.startingpoint} - ${tripDepartureday.routeId.destination}</h1>
                    <h9 style="margin-left: 170px; margin-top: 18px;"><i class="fa-solid fa-calendar-check"> </i> <fmt:formatDate pattern = "dd/MM/yyyy" value = "${tripDepartureday.departureday}" /></h9>
                </div>
                <hr>                   
                <div id="trip-p">
                    <p id="p-1" ><i class="fa-solid fa-hourglass-start"></i> Thời gian đi: <fmt:formatDate type = "time" value = "${tripDepartureday.departuretime}" />  </p>  
                    <p id="p-2" ><i class="fa-solid fa-hourglass-end"></i> Thời gian đến: <fmt:formatDate type = "time" value = "${tripDepartureday.arrivaltime}" /> </p>
                </div>  

                <div id="trip-p">
                    <p id="p-1" ><i class="fa-solid fa-chair"></i> Ghế trống: <input style=" border: none;background-color: white" id="result-${tripDepartureday.id}"
                                                                                     onmouseover ="cRemain(${tripDepartureday.id})"/></p>
                    <p id="p-2" ><i class="fa-solid fa-bus-simple"></i> Loại: ${tripDepartureday.passengercarId.categoryId.categoryname}</p>
                </div>

                <div id="trip-a" >                        
                                     
                    <a href="<c:url value="/comment/${tripDepartureday.id}"/>"  id="priceInfo" style="margin-left: 80px;" class="btn btn-dark action">Phản hồi</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>