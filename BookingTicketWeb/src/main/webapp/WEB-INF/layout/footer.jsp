<%-- 
    Document   : footer
    Created on : Aug 3, 2022, 1:57:10 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="mt-4 p-5 rounded container-fluid" id="footer">
    <div class="row">
        <div class="col col-md-2" style="margin-left: 100px">
            <div class="footer-widget">
                <div class="footer-logo">
                    <img src="<c:url value="/img/Logo1.png"/>" style=" width: 90%; height: 90px">
                </div>
                <div class="footer-info" style="color: #A4A4A4;">
                    Chúng tôi tin vào sự phục vụ của mình và bạn biết điều đó
                </div>
                <ul class="footer-socials__list">
                    <li class="footer-socials__item">
                        <a href=""><i class="fab fa-facebook-f"></i></a>
                    </li>
                    <li class="footer-socials__item">
                        <a href=""><i class="fab fa-twitter"></i></a>
                    </li>
                    <li class="footer-socials__item">
                        <a href=""><i class="fab fa-instagram"></i></a>
                    </li>
                    <li class="footer-socials__item">
                        <a href=""><i class="fab fa-pinterest-p"></i></a>
                    </li>
                    <li class="footer-socials__item">
                        <a href=""><i class="fab fa-youtube"></i></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-4">
            <div class="footer-widget">
                <h4 class="footer-title" style="margin-bottom: 0">
                    THÔNG TIN LIÊN HỆ
                </h4>
                <div>
                    <p class="info-contact" style="margin-bottom: 0">Tổng đài đặt vé và CSKH:<span class="phoneInfo">1900 2345</span></p>
                </div>
                <div class="contact-footer">
                    <div><i class="fas fa-home contact-icon"></i></div>
                    <div><p class="info-contact" >Địa chỉ: 371 Nguyễn Kiệm, Phường 3, Quận Gò Vấp, TP.Hồ Chí Minh, Việt Nam</p></div>
                </div>  
                <div class="contact-footer">
                    <div><i class="fas fa-envelope contact-icon"></i></div>
                    <div><p class="info-contact">Email: <span class="text-danger">lohibusline@lohi.vn</span></p></div>
                </div>  
                <div class="contact-footer">
                    <div><i class="fas fa-mobile-alt contact-icon"></i></div>
                    <div><p class="info-contact">Điện thoại: <span class="text-success">0222.33.44.55</span></p></div>
                </div>     
            </div>
        </div>
        <div class="col">
            <div class="footer-widget">
                <h4 class="footer-title">
                    HÌNH ẢNH
                </h4>
                <div class="instagram-feed">
                    <div class="single-insta">
                        <a href="">
                            <img style="padding-left: 0" src="<c:url value="/img/instagram/1.png"/>" alt="">
                        </a>
                    </div>
                    <div class="single-insta">
                        <a href="">
                            <img src="<c:url value="/img/instagram/2.png"/>" alt="">
                        </a>
                    </div>
                    <div class="single-insta">
                        <a href="">
                            <img src="<c:url value="/img/instagram/3.png"/>" alt="">
                        </a>
                    </div>
                    <div class="single-insta">
                        <a href="">
                            <img src="<c:url value="/img/instagram/4.png"/>" alt="">
                        </a>
                    </div>
                    <div class="single-insta">
                        <a href="">
                            <img src="<c:url value="/img/instagram/5.png"/>" alt="">
                        </a>
                    </div>
                    <div class="single-insta">
                        <a href="">
                            <img src="<c:url value="/img/instagram/6.png"/>" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col" style="margin-right: 100px">
            <div class="footer-widget">
                <h4 class="footer-title">
                    ĐĂNG KÝ
                </h4>
                <p class="info-contact">Đăng ký để nhận được được thông tin mới nhất từ chúng tôi.</p>
                <input type="text" style="padding: 10px 20px 10px 5px; width: 100%" value="Nhập email của bạn..."/>
            </div>
            <button class="text-white RBtn">Đăng ký</button>
        </div>
    </div>
    <hr style="color: black; margin-left: 100px; margin-right: 100px">
    <div style="width: 30%; margin-bottom: 40px; margin-left: 100px">
        <div class="row">

            <div class="col-md-3 link-footer">
                <a href="<c:url value="/" />" >Trang chủ</a></div>
            <div class="col-md-2 link-footer">
                <a href="<c:url value="/news-page" />" >Tin tức</a></div>
            <div class="col-md-2 link-footer">
                <a href="https://futabus.vn" >Liên hệ</a></div>
            <div class="col-md-3 link-footer">
                <a href="https://futabus.vn" >Về chúng tôi</a></div>
        </div>
    </div>
    <div>
        <p style="text-align: center; color: white;">Copyright &copy; <script>document.write(new Date().getFullYear());</script> 
            Bản quyền thuộc về Công ty Cổ phần Xe Khách Loan Hiền LoHiBusLine</p>
    </div>
</div>