<%-- 
    Document   : review-payment
    Created on : Feb 22, 2023, 3:58:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>





<div style="font-family: ui-rounded; text-align: center; margin-top: 20px; background: #c19b77; color: white;font-size: 25px; font-weight: bold; padding: 0.5%;">THÔNG TIN MUA VÉ - XEM TRƯỚC</div>

<div style="margin: 1% 25%; border: 1px solid #a4a4a4 ">
    <div style="font-family: ui-rounded; padding: 0.5%; font-size: 20px; font-weight: bold; background: #f3f3f3; padding-left: 20px;">Thông tin chuyến xe</div>
    <div style="padding-left: 15px;">
        <div Style ="display: flex">
            <p style ="margin-left: 35px; width: 80%"> Chuyến xe:</p>
            <p style="text-align: left;">${trip.coachname} </p>
        </div>
        <div Style ="display: flex">
            <p style ="margin-left: 35px; width: 80%"> Ngày khởi hành:</p>
            <p style="text-align: left;"><fmt:formatDate pattern = "dd/MM/yyyy" value = "${trip.departureday}" /></p>
        </div>
        <div Style ="display: flex">
            <p style ="margin-left: 35px; width: 80%"> Giờ xuất phát:</P>
            <p style="text-align: left;"><fmt:formatDate type = "time" value = "${trip.departuretime}" /></p>
        </div>
    </div>

</div> 

<div style="margin: 0% 25%; border: 1px solid #a4a4a4; ">
    <div style="font-family: ui-rounded; padding: 0.5%; font-size: 20px; font-weight: bold; background: #f3f3f3; padding-left: 20px;">Thông tin thanh toán</div>

    <div style="padding-left: 15px; margin: 1%;">
        <div Style ="display: flex; ">
            <p style ="margin-left: 35px; width: 80%" >Số lượng vé: <span id="count"></span> </p> 
            <p style="text-align: left;">${counter}</p>
        </div>
        <div Style ="display: flex">
            <p style ="margin-left: 35px; width: 80%">Giá vé: <span id="price"></span> </p>
            <p style="text-align: left;"><fmt:formatNumber value="${trip.routeId.price}" maxFractionDigits="3" type = "number" /> VNĐ </p>
        </div>
        <div Style ="display: flex">
            <p style ="margin-left: 35px; width: 80%">Điểm tích lũy: <span id="price"></span> </p><!-- comment -->
            <p style="text-align: left;"> ${Math.ceil(seatStats.amount*0.001)} điểm</p>
        </div>
        <div Style ="display: flex">
            <p style ="margin-left: 35px; width: 80%; font-weight: bold">Tổng tiền: <span id="price"></span> </p><!-- comment -->
            <p style="text-align: left; font-weight: bold; font-size: 17px"><fmt:formatNumber value="${seatStats.amount}" maxFractionDigits="3" type = "number" /> VNĐ </p>
        </div>

    </div>
</div>



<a onclick="pay(${tripId}, 'Paypal')" class="btn btn-info" type="button">
    <div style="font-size: 20px;margin-top: 15px; font-weight: bold; margin-left: 67%; width: 7%;padding: 0.5%; background: #c19b77; color: white; cursor: pointer">Thanh toán</div>
</a>



<script src="<c:url value="/js/reservation.js"/>"></script>

