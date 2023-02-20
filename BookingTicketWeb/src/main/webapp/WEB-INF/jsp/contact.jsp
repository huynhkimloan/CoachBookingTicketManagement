<%-- 
    Document   : contact
    Created on : Feb 18, 2023, 11:31:52 AM
    Author     : dieuh
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Responsive Contact Page with Dark Mode and Form Validation (vanilla JS).

*Designed & built for desktop and tablets with viewport width >= 720px and in landscape orientation.  -->

<div class="contact-container">
    <div class="left-col">
        <img class="logo" src="https://www.indonesia.travel/content/dam/indtravelrevamp/en/logo.png"/>
    </div>
    <div class="right-col">
        <div class="theme-switch-wrapper">
            <label class="theme-switch" for="checkbox">
                <input type="checkbox" id="checkbox" />
                <div class="slider round"></div>
            </label>
            <div class="description">Dark Mode</div>
        </div>
        <h1 id="h1-contact">Liên hệ LoHiBusLine</h1> 
        <p id="p-contact">Cảm ơn bạn đã ghé thăm website của chúng tôi. Nếu bạn muốn nhận được thông tin từ chúng tôi dễ dàng, hãy điền vào form dưới đây.</p>

        <form id="contact-form" action="<c:url value="/contact-api"/>">
            <label for="name" style="width: 40vw; display: block; color: var(--secondary-color); text-transform: uppercase;">Họ và tên</label>
            <input style="width: 40vw; display: block; " type="text" id="name" name="name"  required >
            <label style="width: 40vw; display: block; color: var(--secondary-color); text-transform: uppercase; " for="email">Email</label>
            <input style="width: 40vw; display: block; " type="email" id="email" name="email-contact"  required>
            <label style="width: 40vw; display: block; color: var(--secondary-color); text-transform: uppercase;" for="message">Nội dung</label>
            <textarea style="width: 40vw; display: block; " rows="6"  id="message" name="message" required></textarea>          
            <input style=" border-radius: 5px; width: 20%; background-color: #c19b77; color:white" id ="submit" type="submit" value="GỬI" />

        </form>
        <div id="error"></div>
        <div id="success-msg"></div>
    </div>
</div>

<!-- Image credit: Oliver Sjöström https://www.pexels.com/photo/body-of-water-near-green-mountain-931018/  -->
<script src="<c:url value="/js/contact.js"/>"></script>