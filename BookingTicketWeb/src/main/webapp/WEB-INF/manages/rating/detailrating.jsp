<%-- 
    Document   : detailrating
    Created on : Jun 4, 2023, 2:19:24 PM
    Author     : dieuh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Đánh giá tài xế</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 20px;
            }

            .header {
                text-align: center;
                margin-top: 30px;
                margin-bottom: 50px;
            }

            .avatar {
                width: 200px;
                height: 200px;
                border-radius: 50%;
                margin-bottom: 20px;
            }

            .info {
                border: 1px solid #a4a4a4;
                width: 600px;
                font-size: 20px;
                padding: 20px;
                text-align: center;
                margin-bottom: 50px;
            }

            .info-title {
                font-family: Arial, sans-serif;
                font-size: 25px;
                font-weight: bold;
                background: #f3f3f3;
                margin-bottom: 20px;
                padding: 10px;
            }

            .info-row {
                display: flex;
                justify-content: space-between;
                margin-bottom: 15px;
            }

            .rating {
                display: flex;
                flex-direction: column;
                align-items: center;
                width: 600px;
                margin-bottom: 50px;
            }

            .rating-item {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }

            .rating-label {
                margin-left: 10px;
                font-size: 20px;
            }

            .progress-bar {
                width: 400px;
                height: 20px;
                background-color: #f3f3f3;
                border-radius: 10px;
            }

            .progress-bar-fill {
                height: 100%;
                border-radius: 10px;
                background-color: #28a745;
            }

            .overall-rating {
                text-align: center;
                margin-bottom: 50px;
            }

            .star-icon {
                font-size: 20px;
                color: yellow;
                margin-left: 5px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1 class="text-danger">CHI TIẾT ĐÁNH GIÁ TÀI XẾ</h1>
            </div>
            <div>
                <img class="avatar" src="<c:url value="${user.avatar}"/>" alt="${user.name}">
            </div>
            <div class="info">
                <div class="info-title">Thông Tin Tài Xế</div>
                <div class="info-content">
                    <div class="info-row">
                        <p class="info-label">Tên tài xế:</p>
                        <p>${user.name}</p>
                    </div>
                    <div class="info-row">
                        <p class="info-label">Số điện thoại:</p>
                        <p>${user.phone}</p>
                    </div>
                    <div class="info-row">
                        <p class="info-label">Email:</p>
                        <p>${user.email}</p>
                    </div>
                </div>
            </div>
            <div class="rating">
                <h2 class="text-danger">Tổng Số Lượt Đánh Giá Của Tài Xế</h2>
                <div class="rating-item">
                    <p class="rating-label" style="margin-top: 10px;">1 <i class="fa-solid fa-star star-icon"></i></p>
                    <div class="progress-bar">
                        <div class="progress-bar-fill" style="width: ${oneStar * 10}%"></div>
                    </div>
                </div>
                <div class="rating-item">
                    <p class="rating-label" style="margin-top: 10px;">2 <i class="fa-solid fa-star star-icon"></i></p>
                    <div class="progress-bar">
                        <div class="progress-bar-fill" style="width: ${twoStar * 10}%"></div>
                    </div>
                </div>
                <div class="rating-item">
                    <p class="rating-label" style="margin-top: 10px;">3 <i class="fa-solid fa-star star-icon"></i></p>
                    <div class="progress-bar">
                        <div class="progress-bar-fill" style="width: ${threeStar * 10}%"></div>
                    </div>
                </div>
                <div class="rating-item">
                    <p class="rating-label" style="margin-top: 10px;">4 <i class="fa-solid fa-star star-icon"></i></p>
                    <div class="progress-bar">
                        <div class="progress-bar-fill" style="width: ${four * 10}%"></div>
                    </div>
                </div>
                <div class="rating-item">
                    <p class="rating-label" style="margin-top: 10px;">5 <i class="fa-solid fa-star star-icon"></i></p>
                    <div class="progress-bar">
                        <div class="progress-bar-fill" style="width: ${five * 10}%"></div>
                    </div>
                </div>
                
            </div>
        </div>
    </body>
</html>

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
