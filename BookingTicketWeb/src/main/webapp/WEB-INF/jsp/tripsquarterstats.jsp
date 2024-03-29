<%--
    Document   : tripsquarterstats
    Created on : Aug 20, 2022, 12:59:53 PM
    Author     : dieuh
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-danger">THỐNG KÊ THEO QUÝ </h1>

<section class="search-sec">
    <div class="container">
        <form action="#" method="post" novalidate="novalidate">
            <div style="display: flex">                                        
                <div class="row" style="width: 100%; display: flex;">   
                    <div  style="width: 48%;">
                        <label>Từ thời điểm</label>
                        <input type="date" name="fromDate" class="form-control mb-3" />
                    </div>
                    <div  style="margin-left: 10px; width: 48%;">
                        <label>Đến thời điểm</label>
                        <input type="date" name="toDate" class="form-control" />
                    </div> 
                </div>
                <div  style="margin-left: 10px; margin-top:19px; ">
                    <input type="submit" value="Thống kê" class="btn text-white" style="background-color: #c19b77"/>
                </div>
            </div>
        </form>
    </div>
</section>


<div class="row">
    <h4 class="text-center text-secondary" style="width: 40%; margin-left: 30%;"> Bảng số liệu thống kê </h4>
    <table class="table" style="width: 80%; margin: 10px auto 20px auto"   >
        <tr>
            <th>Thời gian </th>
            <th>Doanh thu </th>
        </tr>
        <c:forEach items="${tripQuarterStats}" var="m">
            <tr>
                <td>${m[0]}/${m[1]}</td>
                <td><fmt:formatNumber value="${m[2]}" maxFractionDigits="3" type = "number" /> VNĐ</td>
            </tr>
        </c:forEach>
    </table>
    <h4 class="text-center text-secondary " style="width: 40%; margin-left: 30%;"> Thống kê theo dạng biểu đồ </h4>
    <div>
        <canvas id="myTripsQuarterTurnoverTatisticsChart"></canvas>
    </div>
    <script>
        let tripQuarterTurnoverLabels = [], tripQuarterTurnoverInfo = []
        <c:forEach items="${tripQuarterStats}" var="m">
            tripQuarterTurnoverLabels.push('${m[0]}/${m[1]}')
            tripQuarterTurnoverInfo.push(${m[2]})
        </c:forEach>
    </script>
</div>
<script>
    window.onload = function () {
        turnoverTatisticsByTripQuarterChart("myTripsQuarterTurnoverTatisticsChart", tripQuarterTurnoverLabels, tripQuarterTurnoverInfo);
    }
</script>
