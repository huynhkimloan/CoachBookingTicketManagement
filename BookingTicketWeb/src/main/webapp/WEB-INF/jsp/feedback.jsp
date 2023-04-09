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


<div class="row trip-body">
    <div>
        <h1 id="nen">DANH SÁCH CÁC CHUYẾN ĐI</h1>
    </div>
    
    <form action="<c:url value="/feedbackByKeyword"/>">
            <!--<form action="">-->
            <div class="row searchRoute" style="margin: 40px auto" >
                <div style="width:100%; display:flex; ">
                    <div class="selectPoint" style="border: 1px solid #A4A4A4" >
                        <h5 style="margin-top: 10px;  color: #a4a4a4">ĐIỂM ĐI</h5>
                        <div class="nav-item point" style="margin-left: 10px;">
                            <input class="form-control" list="browsers" name="kw" id="startingpoint">
                            <datalist id="browsers" >
                                <option value="Sài Gòn" >
                                <option value="Bình Định">
                                <option value="Phú Yên">
                                <option value="Bạc Liêu">
                                <option value="Bến Tre">
                                <option value="Hà Nội">
                                <option value="Đà Nẵng">
                                <option value="Cần Thơ">
                            </datalist>
                        </div>
                    </div>
                    <div class="nav-item " style="border-color: #262626; margin-top: 30px;"><i class="fa-solid fa-arrow-right-arrow-left btnpoint"></i></div>
                    <div class="selectPoint" style="border: 1px solid #A4A4A4" >
                        <h5 style="margin-top: 10px;  color: #a4a4a4">ĐIỂM ĐẾN</h5>
                        <div class="nav-item point" style="margin-left: 10px;">
                            <input class="form-control" list="browsers" name="kw1" id="destination">
                            <datalist id="browsers">
                                <option value="Sài Gòn">
                                <option value="Bình Định">
                                <option value="Phú Yên">
                                <option value="Bạc Liêu">
                                <option value="Bến Tre">
                                <option value="Hà Nội">
                                <option value="Đà Nẵng">
                                <option value="Cần Thơ">
                            </datalist>
                        </div> 
                    </div>
                    <div class="selectPoint"  style="border: 1px solid #A4A4A4; margin-left: 10px" >
                        <h5 style="margin-top: 10px; color: #a4a4a4">CHỌN NGÀY ĐI</h5>
                        <div class="nav-item point" style="margin-left: 10px;">
                            <input type="date" name="kw2" id="departureday1"  class="form-control" /> 
                        </div>
                    </div>
                </div>
                <input type="submit" value="Tìm chuyến xe" id="submitdepartureday" class="btn btn-dark"/>

            </div>

        </div>
    </div>
</form>
    
    
    
    <c:if test="${tripFeedback.size() == 0}">
        <div class="alert alert-danger" style="margin-left: 27%; width: 50%; font-size: 20px; text-align: center">Hôm nay không có chuyến xe nào khởi hành !!!</div>  
    </c:if>
    <c:forEach var="trip" items="${tripFeedback}">
        <div id="blocktrip">  
            <div class="card" style="width: 30%;">
                <img id="trip-img" style="height: 200px"src="<c:url value="${trip.image}"/>" alt="${trip.coachname}" />  
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
                    <p class="text-center" style="margin-top: 12px"><i class="fa-solid fa-bus-simple"></i><strong style="font-size: 15px">
                        ${trip.passengercarId.categoryId.categoryname}</strong></p>
         
                
               

                <div id="trip-a" >            
                    <a href="<c:url value="/comment/${trip.id}"/>"  id="priceInfo" style="margin-left: 150px;" class="btn text-white action">Phản hồi</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>