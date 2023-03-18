<%-- 
    Document   : review-payment
    Created on : Feb 22, 2023, 3:58:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="containerbb container-fluid">
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-md-6">
            <h3 class="text-center text-info mb-4" style="font-family: ui-rounded;">Thông tin mua vé - Xem trước</h3>
            <div class="chooseSeatInfo">
                <div>
                    <h5 class="alert alert-secondary">Thông tin chuyến xe</h5> 
                    <div class="row">
                        <div class="col-sm-7 form-check" style="padding-left: 15px">
                            <p class="formatP"><i class="fa-solid fa-car-tunnel"></i> Chuyến xe: ${trip.coachname} </p>
                            <p class="formatP"> <i class="fa-solid fa-calendar-days"></i> Ngày khởi hành: <fmt:formatDate pattern = "dd/MM/yyyy" value = "${trip.departureday}" /></p>
                            <p class="formatP"><i class="fa-solid fa-clock"></i> Giờ xuất phát: <fmt:formatDate type = "time" value = "${trip.departuretime}" /></p>
                        </div>
                        <div class="col-sm-5 form-check">
                            <p class="formatP"><i class="fa-solid fa-check-to-slot"></i> Số lượng vé: <span id="count">${counter}</span> </p> 
                            <p class="formatP"><i class="fa-solid fa-check-to-slot"></i> Giá vé: <span id="price">${trip.routeId.price}</span> </p>
                        </div>
                    </div>
                </div> 
                <div>
                    <h6 style="text-align: right;"> <i class="fa-solid fa-hand-holding-dollar"></i>
                        Tổng tiền: <span id="amount" class="text-success" style="font-weight: bold"><fmt:formatNumber value="${seatStats.amount}" maxFractionDigits="3" type = "number" /></span> VNĐ   </h6> 
                  
                        Điểm tích lũy: <span class="text-success" style="font-weight: bold" id="point">${Math.ceil(seatStats.amount*0.001)}</span> điểm
                       
                </div>
                </div>
                        <a onclick="pay(${tripId}, 'Paypal')" class="btn btn-info" type="button"><p>Thanh toán</p></a>
            </div>
        </div>
    </div>  
</div>
<script src="<c:url value="/js/reservation.js"/>"></script>

