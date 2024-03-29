<%-- 
    Document   : tripstatistics
    Created on : Aug 14, 2022, 10:25:41 PM
    Author     : dieuh
--%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-danger"> MẬT ĐỘ CHUYẾN XE - DOANH THU THEO TUYẾN XE</h1>


<!-- Nav tabs -->
<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link" style="font-size: 15px; color: #c19b77" data-bs-toggle="tab" href="#density">Thống kê mật độ chuyến xe</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" style="font-size: 15px; color: #c19b77" data-bs-toggle="tab" href="#turnover">Thống kê doanh thu theo tuyến</a>
    </li>
    


</ul>

<!-- Tab panes -->
<div class="tab-content">
    <!--Thống kê mật độ chuyến đi theo tuyến-->
    <div class="tab-pane container fade" id="density">
        <div class="row">
            <h4 class="text-center text-secondary mt-4"> Bảng số liệu thống kê </h4>
            <table class="table" style="width: 80%; margin: 0 auto 20px auto">
                <tr>
                    <th>Mã tuyến </th>
                    <th>Tên tuyến </th>
                    <th>Mật độ chuyến </th>
                </tr>
                <c:forEach items="${tripstatistics}" var="a">
                    <tr>
                        <td>${a[0]}</td>
                        <td>${a[1]}</td>
                        <td>${a[2]}</td>
                    </tr>
                </c:forEach>
            </table>
            <h4 class="text-center text-secondary"> Thống kê theo dạng biểu đồ </h4>
            <div>
                <canvas id="myTripstatisticsChart"></canvas>
            </div>
            <script>
                let tripLabels = [], routeInfo = [];
                <c:forEach items="${tripstatistics}" var="a">
                tripLabels.push('${a[1]}')
                routeInfo.push('${a[2]}')
                </c:forEach>
            </script>
        </div>
    </div>

    <!--Thống kê doanh thu theo chuyến--> 
    <div class="tab-pane container  active" id="turnover" style="margin-top: 10px;">
        <div class="row">
            <form action="" style=" width: 50%; margin: 0 auto">
                <div class="form-group">
                    <label>Tên tuyến</label>
                    <input type="text" name="kw" class="form-control" />
                </div>
                <div class="form-group">
                    <label>Từ thời điểm</label>
                    <input type="date" name="fromDate" class="form-control" />
                </div>
                <div class="form-group">
                    <label>Đến thời điểm</label>
                    <input type="date" name="toDate" class="form-control" />
                </div>
                <input type="submit" value="Thống kê" class="btn text-white" style="background-color: #c19b77; margin-left: 420px"/>
            </form>
            <h4 class="text-center text-secondary"> Bảng số liệu thống kê </h4>
            <table class="table" style="width: 80%; margin: 0 auto">
                <tr>
                    <th>Mã tuyến </th>
                    <th>Tên tuyến </th>
                    <th>Doanh thu </th>
                </tr>
                <c:forEach items="${turnovertatisticsbytrip}" var="b">
                    <tr>
                        <td>${b[0]}</td>
                        <td>${b[1]}</td>
                        <td><fmt:formatNumber value="${b[2]}" maxFractionDigits="3" type = "number" /> VNĐ</td>
                    </tr>
                </c:forEach>
            </table>
            <h4 class="text-center text-danger"> Thống kê theo dạng biểu đồ </h4>
            <div style="width:50%; margin-left: 30%; " >
                <canvas id="myTripsturnovertatisticsChart" ></canvas>
            </div>
            <script>
                let tripturnoverLabels = [], tripturnoverInfo = []

                <c:forEach items="${turnovertatisticsbytrip}" var="b">
                tripturnoverLabels.push('${b[1]}')
                tripturnoverInfo.push(${b[2]})
                </c:forEach>
            </script>
        </div>
    </div>
</div>


<script>
    window.onload = function () {

        tripstatisticsChart("myTripstatisticsChart", tripLabels, routeInfo);
        turnovertatisticsbytripChart("myTripsturnovertatisticsChart", tripturnoverLabels, tripturnoverInfo);
    }
</script>
</div>
