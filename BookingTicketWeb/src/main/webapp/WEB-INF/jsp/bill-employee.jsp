<%-- 
    Document   : bill
    Created on : Aug 25, 2022, 1:43:07 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="containerbb container-fluid">
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-md-6">
            <form id="regForm"  style="padding: 0" action="<c:url value="/paybyPaypal"/>" method="post">
                <h1 id="register" style="font-weight: 700; color: black">ĐẶT VÉ</h1>
                <div class="all-steps mt-0" id="all-steps">
                    <span class="step" style="background-color: brown"></span> 
                    <span class="step" style="background-color: brown"></span> 
                    <span class="step" style="background-color: black"></span>
                    <span class="step"></span> 
                </div>
                <h3 class="text-center text-info mb-4" style="font-family: ui-rounded;">Thông tin mua vé</h3>
                <div class="chooseSeatInfo">
                    <div>
                        <h5 class="alert alert-secondary">Thông tin hành khách</h5>  
                        <p class="formatP"><i class="fa-solid fa-id-card"></i> Họ tên: 
                            <!--<textarea class="form-input" id="nameUser" placeholder="Họ tên của bạn là..."></textarea>-->
                            <input type="text" name="nameUser" id="nameUser"/></p>
                        <p class="formatP"><i class="fa-solid fa-square-phone"></i> Số điện thoại: 
                            <input type="number" name="phoneNumber" id="phoneNumber"/></p>
                        <p class="formatP"><i class="fa-solid fa-envelope"></i> Email: 
                            <input type="email" name="emailUser" id="emailUser"/></p>
                    </div>
                    <div>
                        <h5 class="alert alert-secondary">Thông tin chuyến xe</h5> 
                        <div class="row">
                            <div class="col-sm-7 form-check" style="padding-left: 15px">
                                <p class="formatP"><i class="fa-solid fa-car-tunnel"></i> Chuyến xe: ${trip.coachname} </p>
                                <p class="formatP"> <i class="fa-solid fa-calendar-days"></i> Ngày khởi hành: <fmt:formatDate pattern = "dd/MM/yyyy" value = "${trip.departureday}" /></p>
                                <p class="formatP"><i class="fa-solid fa-clock"></i> Giờ xuất phát: <fmt:formatDate type = "time" value = "${trip.departuretime}" /></p>
                            </div>
                            <div class="col-sm-5 form-check">
                                <p class="formatP"><i class="fa-solid fa-check-to-slot"></i> Số lượng ghế: <span id="count" style="font-size: 18px">${counter}</span> </p>                       
                            </div>
                        </div>
                    </div> 
                    <div>
                        <h6 style="text-align: right; font-size: 17px"> <i class="fa-solid fa-hand-holding-dollar"></i>
                            Tổng tiền: <span id="amount" class="text-success" style="font-weight: bold; font-size: 18px"><fmt:formatNumber value="${seatStats.amount}" maxFractionDigits="3" type = "number" /></span> VNĐ  </h6>
                    </div>
                    <div>
                        <input type="hidden" name="tripId" value="${tripId}"/>
                        <input type="hidden" name="amount" value="${seatStats.amount}"/>
                        <input type="hidden" name="price" value="${price}"/>
                        <input type="hidden" name="quantity" value="${counter}"/>
                    </div>

                    <div>  
                        <h5 class="alert alert-secondary">Phương thức thanh toán</h5> 
                        <div class="row" style="margin-right: 7px">
                            <div class="col-sm-6 form-check" style="width: 50%"> 
                                <a onclick="addTicket(${tripId}, 'Đã thanh toán')">
                                    <div class="col" >
                                        <span class="btn border border-warning" >
                                            <img class="img-fluid icon" style="height: 88px" src="<c:url value="/img/tienmat.jpg"/>" alt="Tiền mặt" />
                                            <p style="margin-bottom: 0">Trực tiếp tại quầy</p>
                                        </span>
                                    </div> 
                                </a>
                            </div>
                            <div class="col-sm-6 form-check" style="width: 50%"> 
                                <a onclick="addTicket(${tripId}, 'Trả sau')">
                                    <div class="col" >
                                        <span class="btn border border-warning" style="width: 280px" >
                                            <img class="img-fluid icon" style="height: 88px; width: 120px" src="<c:url value="/img/trasau.jpg"/>" alt="Trả sau" />
                                            <p style="margin-bottom: 0">Trả sau</p>
                                        </span>
                                    </div> 
                                </a>
                            </div> 
                            <div class="row" style="margin-right: 7px">
                                <div class="col-sm-6 form-check" style="width: 51.5%">
                                    <a>
                                        <div class="col">
                                            <span class="btn border border-warning">
                                                <img class="img-fluid icon" style="height: 75px" src="<c:url value="/img/paypal.jpg"/>" alt="Paypal" />
                                                <input type="submit" style="border-bottom: none; margin: 0" value="Ví paypal"/>
                                            </span>
                                        </div>   
                                    </a>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
                <div style="overflow:auto;" id="nextprevious">
                    <div style="float:right;"> 
                        <a type="button" id="prevBtn" class="button btn btn-secondary" href="<c:url value="/reservation/${tripId}/confirm-seat"/>">Quay lại</a> 
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<script src="<c:url value="/js/reservation.js"/>"></script>