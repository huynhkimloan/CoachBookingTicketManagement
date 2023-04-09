<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--<img src="https://res.cloudinary.com/ddqevaeix/image/upload/v1679218985/routes/Beige_Parchment_Background_Camping_Photo_Collage_yeklws.png" 
     alt="Tuyến 1" style="height: 550px; width: 100%">-->
<form action="<c:url value="/trip"/>">
    <div id="demo1" class="carousel slide" data-bs-ride="carousel" style="padding-top:10px; height: 500px;  ">

        <div class="carousel-inner" style="height: 520px;">
            <div class="carousel-item active">
                <img src="https://res.cloudinary.com/dvsqhstsi/image/upload/v1676619172/3_bbq0ou.jpg" alt="Tuyến 1" class="d-block w-100 " style="height: 400px;">
                
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
                    <div class="selectPoint" style="border: 1px solid #A4A4A4" >
                        <h5 style="margin-top: 10px; color: #a4a4a4">ĐIỂM ĐI</h5>
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
                        <h5 style="margin-top: 10px; color: #a4a4a4">ĐIỂM ĐẾN</h5>
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

<c:if test="${routes.size() == 0}">
    <div class="alert alert-danger" style="margin-left: 27%; margin-top: 70px; width: 50%; font-size: 20px; text-align: center">Không có tuyến bạn cần tìm !!!</div>
</c:if>


<h1 style="margin-top: 30px; font-weight: bold; font-size: 3rem">CÁC TUYẾN PHỔ BIẾN</h1>

<div class="row" style="margin-top: 20px">

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
                    <a href="<c:url value="/trip/${route.id}"/>"  id="priceInfo" class="btn text-white action" style="width: 100%; font-size: 20px; font-weight: bold">Xem chi tiết</a>

                </div>
            </div>
        </div>
    </c:forEach>
    
</div>
<c:if test="${routes.size() != 0}">
    <div Style = "margin-left: 93%;">
        <ul class="pagination"  style = "margin-top:10px;">
            <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="a">
                <li class="page-item"><a class="page-link" href="<c:url value="/" />?page=${a}">${a}</a></li>
                </c:forEach>
        </ul>
    </div>
</c:if>
<hr style="margin-top: 30px;">
<div style="display: flex; margin-top: 20px;" id="item_index">
    <div style="width: 24%; margin: 1%;">
        <div>
            <img src="https://res.cloudinary.com/dvsqhstsi/image/upload/v1681014879/1_euxnab.png" style="height:100px; width: 100px; margin-left: 85px;">
        </div>
        <h5>DỊCH VỤ ĐƯA ĐÓN CHUYÊN NGHIỆP</h5>
        <p >
            Trải qua hơn 20 năm vận chuyển đưa đón hành khách Hiền Loan đã từng bước khẳng định và giữ vững vị thế - uy tín chất lượng dịch vụ hàng đầu tại Hồ Chí Minh, làm hài lòng hàng trăm triệu lượt khách hàng trong nước cũng như khách quốc tế đến Việt Nam
        </p>
    </div>
   <div style="width: 24%; margin: 1%;">
        <div >
            <img src="https://res.cloudinary.com/dvsqhstsi/image/upload/v1680932548/2_uagro7.png" style="height:100px; width: 100px;margin-left: 85px;" >
        </div>
        <h5>CÁC DÒNG XE CHẤT LƯỢNG CAO</h5>
        <p >
            Với định hướng phát triển và mục tiêu nâng cao chất lượng dịch vụ Hiền Loan vẫn luôn không ngừng đầu tư các dòng xe mới, hiện đại để đáp ứng nhu cầu sử dụng dịch vụ trong nước và Quốc tế
        </p>

    </div>
    <div style="width: 24%; margin: 1%;">
        <div style="width: 50%">
            <img src="https://res.cloudinary.com/dvsqhstsi/image/upload/v1681014898/3_wcmnsi.png" style="height:100px; width: 100px;margin-left: 85px;" >
        </div>

        <h5>ĐỘI NGŨ TÀI XẾ GIÀU KINH NGHIỆM</h5>
        <p>
            Không chỉ mang đến sự an toàn, đội ngũ tài xế tâm huyết, nhiệt tình đã được đào tạo nghiệp vụ bài bản sẽ mang đến cho bạn những trải nghiệm mới trên mỗi hành trình khám phá của mình
        </p>
    </div>
    <div style="width: 24%; margin: 1%;">
        <div style="width: 50%">
            <img src="https://res.cloudinary.com/dvsqhstsi/image/upload/v1680932011/4_saqyn4.png" style="height:100px; width: 100px;margin-left: 85px;" >
        </div>
        <h5>GIÁ TỐT NHẤT DÀNH CHO BẠN</h5>
        <p>
            Với phương châm: "Một hành trình - Vạn niềm vui", Hiền Loan đã từng bước khẳng định vị thế không chỉ chất lượng mà còn hài lòng quý khách với mức giá cạnh tranh nhất trên thị trường hiện nay
        </p>
    </div>
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

