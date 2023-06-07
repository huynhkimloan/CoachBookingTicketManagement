<%-- 
    Document   : detailrating
    Created on : Jun 4, 2023, 2:19:24 PM
    Author     : dieuh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-danger" style="margin-top: 20px">CHI TIẾT ĐÁNH GIÁ TÀI XẾ</h1>
<div style="display: flex; margin-top: 50px;"> 

    <div style="width: 40%; margin-left: 1%;">
        <img src="<c:url value="${user.avatar}"/>" alt="${user.name}" style="width: 95%"/> 
    </div>
    <div style=" border: 1px solid #a4a4a4;  width: 58%; font-size: 25px; ">
        <div style="font-family: ui-rounded;  font-size: 25px; font-weight: bold; background: #f3f3f3; text-align: center;">Thông Tin Tài Xế</div>
        <div style="padding-left: 5px; margin-top: 40px;">
            <div Style ="display: flex">
                <p style ="margin-left:45px; width: 40%; font-size: 16px"> Tên tài xế:</p>
                <p style="text-align: left; font-size: 16px">${user.name} </p>
            </div>
            <div Style ="display: flex; margin-top: 15px;">
                <p style ="margin-left: 45px; width: 40%; font-size: 16px"> Số điện thoại:</p>
                <p style="text-align: left; font-size: 16px">${user.phone}</p>
            </div>
            <div Style ="display: flex; margin-top: 15px;">
                <p style ="margin-left: 45px; width: 40%; font-size: 16px"> Email:</p>
                <p style="text-align: left; font-size: 16px">${user.email}</p>
            </div>
        </div>
    </div> 


</div>



<h2 class="text-center text-danger" style="margin-top: 30px">Tổng Số Lượt Đánh Giá Của Tài Xế</h2>
<div style="display: flex">
    <div style="margin-top: 30px; width: 60%">

        <div style="display: flex;height: 25px; margin-top: 10px;">
            <p style="font-size: 20px; ">1 <i class="fa-solid fa-star" style="font-size: 20px; color: yellow; margin-left: 5px"></i> </p>
            <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%" id="progressBar1" data-value="${oneStar * 10}">${oneStar} </div>
        </div>
        <div style="display: flex;height: 25px; margin-top: 10px;">
            <p style="font-size: 20px; ">2 <i class="fa-solid fa-star" style="font-size: 20px; color: yellow; margin-left: 5px"></i> </p>
            <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%" id="progressBar2" data-value="${threeStar * 10}">${threeStar} </div>
        </div>
        <div style="display: flex; height: 25px; margin-top: 10px;">
            <p style="font-size: 20px; ">3 <i class="fa-solid fa-star" style="font-size: 20px; color: yellow; margin-left: 5px"></i> </p>
            <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%" id="progressBar3" data-value="${threeStar * 10}">${threeStar} </div>
        </div>
        <div style="display: flex;height: 25px; margin-top: 10px;">
            <p style="font-size: 20px; ">4 <i class="fa-solid fa-star" style="font-size: 20px; color: yellow; margin-left: 5px"></i> </p>
            <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%" id="progressBar4" data-value="${four * 10}">${four} </div>
        </div>
        <div style="display: flex;height: 25px; margin-top: 10px;">
            <p style="font-size: 20px; ">5 <i class="fa-solid fa-star" style="font-size: 20px; color: yellow; margin-left: 5px"></i> </p>
            <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%" id="progressBar5" data-value="${five * 10}">${five} </div>
        </div>
        <div style="margin-top: 30px; width: 40%">
            <p style="font-size: 25px">OVERALL RATING 
                <i class="fa-solid fa-star" style="font-size: 20px; margin-left: 20px"></i>
                <i class="fa-solid fa-star" style="font-size: 20px"></i>
                <i class="fa-solid fa-star" style="font-size: 20px"></i>
                <i class="fa-solid fa-star" style="font-size: 20px"></i>
                <i class="fa-solid fa-star" style="font-size: 20px"></i>

            </p>
            <hr style="width: 70%">
            <p>100 </p>
        </div>
    </div> 

    <script>
        // Lấy giá trị oneStar từ data-value attribute
        var oneStar = document.getElementById('progressBar1').getAttribute('data-value');

        // Lấy giá trị oneStar từ data-value attribute
        var twoStar = document.getElementById('progressBar2').getAttribute('data-value');

        // Lấy giá trị oneStar từ data-value attribute
        var threeStar = document.getElementById('progressBar3').getAttribute('data-value');

        // Lấy giá trị oneStar từ data-value attribute
        var fourStar = document.getElementById('progressBar4').getAttribute('data-value');

        // Lấy giá trị oneStar từ data-value attribute
        var fiveStar = document.getElementById('progressBar5').getAttribute('data-value');

        // Lấy tham chiếu tới progress bar
        var progressBar1 = document.getElementById('progressBar1');
        var progressBar2 = document.getElementById('progressBar2');
        var progressBar3 = document.getElementById('progressBar3');
        var progressBar4 = document.getElementById('progressBar4');
        var progressBar5 = document.getElementById('progressBar5');

        // Cập nhật giá trị dữ liệu vào progress bar
        progressBar1.setAttribute('aria-valuenow', oneStar);
        progressBar1.style.width = oneStar + '%';

        progressBar2.setAttribute('aria-valuenow', twoStar);
        progressBar2.style.width = twoStar + '%';

        progressBar3.setAttribute('aria-valuenow', threeStar);
        progressBar3.style.width = threeStar + '%';

        progressBar4.setAttribute('aria-valuenow', fourStar);
        progressBar4.style.width = fourStar + '%';

        progressBar5.setAttribute('aria-valuenow', fiveStar);
        progressBar5.style.width = fiveStar + '%';
    </script>
