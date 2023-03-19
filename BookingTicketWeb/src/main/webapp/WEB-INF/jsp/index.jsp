<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<form action="<c:url value="/trip"/>">
    <div id="demo1" class="carousel slide" data-bs-ride="carousel" style="padding-top:10px; height: 500px;  ">

        <!-- Indicators/dots -->
        <!--        <div class="carousel-indicators">
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
                </div>-->

        <!-- The slideshow/carousel -->
        <div class="carousel-inner" style="height: 520px;">
            <div class="carousel-item active">
                <img src="https://res.cloudinary.com/dvsqhstsi/image/upload/v1676619172/3_bbq0ou.jpg" alt="Tuyến 1" class="d-block w-100 " style="height: 400px;">
                <!--            <div class="carousel-caption">
                                <h1 style="padding-top: 100px; ">CÁC TUYẾN ĐƯỜNG PHỔ BIẾN</h1>
                                <p>We will give you a great experience!!!</p>
                            </div>-->
            </div>

            <div class="carousel-item">
                <img src="https://res.cloudinary.com/dvsqhstsi/image/upload/v1676619201/1_p51utj.jpg" alt="Tuyến 2" class="d-block w-100 " style="height: 400px;">
                <!--            <div class="carousel-caption">
                                <h1 style="padding-top: 100px; " >CÁC TUYẾN ĐƯỜNG PHỔ BIẾN</h1>
                                <p>We will give you a great experience!!!</p>
                            </div>-->
            </div>

            <div class="carousel-item">
                <img src="https://res.cloudinary.com/dvsqhstsi/image/upload/v1676619232/2_tcygoc.jpg" alt="Tuyến 3" class="d-block w-100 " style="height: 400px;">
                <!--            <div class="carousel-caption">
                                <h1 style="padding-top:100px; ">CÁC TUYẾN ĐƯỜNG PHỔ BIẾN</h1>
                                <p>We will give you a great experience!!!</p>
                            </div>-->
            </div>

            <!--     Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
            <!--<form action="">-->
            <div class="row searchRoute" >
                <div style="width:100%; display:flex; ">
                    <div class="selectPoint" >
                        <h5>ĐIỂM ĐI</h5>
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
                    <div class="nav-item " style="border-color: #262626; margin-top: 40px;"><i class="fa-solid fa-arrow-right-arrow-left btnpoint"></i></div>
                    <div class="selectPoint">
                        <h5>ĐIỂM ĐẾN</h5>
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
                    <div class="selectPoint">
                        <h5>CHỌN NGÀY ĐI</h5>
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

<c:if test="${routes.size() == 0}">
    <div class="alert alert-danger" style="margin-left: 27%; margin-top: 70px; width: 50%; font-size: 20px; text-align: center">Không có tuyến bạn cần tìm !!!</div>
</c:if>
<c:if test="${routes.size() != 0}">
    <div>
        <ul class="pagination"  style = "margin-top:10px;">
            <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="a">
                <li class="page-item"><a class="page-link" href="<c:url value="/" />?page=${a}">${a}</a></li>
                </c:forEach>
        </ul>
    </div>
</c:if>



<div class="row">

    <c:forEach var="route" items="${routes}"> 

        <div class="col-md-4 col-xs-12" style="padding:10px;">
            <div class="card">
                <img style=" height: 250px;" class=" img1 img-fluid card-header" src="<c:url value="${route.image}"/>" alt="${route.routename}" />                

                <div class="card-body ">
                    <h3 style="font-family: 'Cambria', sans-serif;"><i class="fa-solid fa-map-location-dot"></i> ${route.startingpoint} - ${route.destination}</h3>
                    <hr>
                    <diV style="display: flex;" class="show-p">

                        <g style="font-family: 'Cambria', sans-serif; font-weight: bold"><i class="fa-solid fa-location-dot" ></i> ${route.stretch} km </g>
                        <p style="font-family: 'Cambria', sans-serif; font-weight: bold"><i class="fa-solid fa-clock"></i> ${route.time} h </p>
                        <p class="product-carousel-price" style="font-family: 'Cambria', sans-serif; font-weight: bold">
                            <i class="fa-solid fa-money-bill-wave"></i> <fmt:formatNumber 
                                value="${route.price}" maxFractionDigits="3" type = "number" /> VNĐ</p> 
                    </diV>
                    <a href="<c:url value="/trip/${route.id}"/>"  id="priceInfo" class="btn btn-dark action" style="width: 100%; font-size: 20px;">Xem chi tiết</a>
                </div>
            </div>
        </div>

    </c:forEach>
</div>

<hr style="margin-top: 30px;">
<h1 style="margin-top: 30px; color: #c19b77; font-size: 50px; font-family: SFProText;">CHẤT LƯỢNG LÀ DANH DỰ </h1>
<div style="margin-top: 30px; display: flex; " class="infomation">
    <div class ="info" >
        <h1 class="h1"><i class="fa-solid fa-people-group"></i> 20M</h1>
        <H4 style="margin:10px; color: #c19b77;">Hơn 20 triệu lượt khách</H4>
        <P style="margin:10px; ">Phục vụ hơn 20 triệu lượt khách/bình quân 1 năm trên toàn quốc</P>
    </div>
    <div class ="info" >
        <h1 class="h1"><i class="fa-solid fa-house-chimney-window " ></i> 250</h1>
        <H4 style="margin:10px; color: #c19b77;">Hơn 250 phòng vé, phòng khách</H4>
        <P style="margin:10px; ">Có hơn 250 phòng vé, trạm trung chuyển, bến xe...trên toàn hệ thống</P>
    </div >
    <div style=" border-style: dotted; color: #c19b77;" >
        <h1 class="h1"><i class="fa-solid fa-bus"></i> 1600</h1>
        <H4 style="margin:10px; color: #c19b77;">Hơn 1,600 chuyến mỗi ngày</H4>
        <P style="margin:10px; ">Phục vụ hơn 1600 chuyến xe đường dài và liên tỉnh mỗi ngày</P>
    </div>
</div>

<script src="<c:url value="/js/trip.js"/>"></script>
