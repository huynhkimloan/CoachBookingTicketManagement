<%-- 
    Document   : comment
    Created on : Aug 13, 2022, 8:37:18 PM
    Author     : dieuh
--%>


<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<div>
    <h1 id="nen">BÌNH LUẬN - ĐÁNH GIÁ</h1>
</div>
${t}

<div style = "display: flex;">
    <div id = "left" style = "margin: 5px; width:50%;">
        <img style=" height: 300px; width: 460px; margin-left:14%" class=" img1 img-fluid card-header" src="<c:url value="${trip.image}"/>" alt="${trip.coachname}" />
        <p style="margin:10px; text-align: justify">Hiện nay, xe khách Loan Hiền đã có mặt tại các thành phố lớn như Huế, Nha Trang, Đà Lạt, Cần Thơ, Đồng Tháp. Trong tương lai, xe buýt Loan Hiền đặt mục tiêu phủ rộng khắp các tỉnh thành trên cả nước, đáp ứng tối đa nhu cầu đi lại của người dân, giảm phương tiện cá nhân, góp phần thay đổi bộ mặt giao thông theo hướng hiện đại và tinh giản hơn</p>   
    </div>

    <div id = "right" style = "margin-top: 30px;">
        <h1><i class="fa-solid fa-bus" style="font-size: 2.5rem"></i> ${trip.routeId.startingpoint} - ${trip.routeId.destination} </h1>

        <h5 style="margin-top: 10px; text-align: center;"> <span class="text-secondary">Ngày khởi hành: </span>
            <span style="font-weight: bold; font-size: 16px"><fmt:formatDate pattern = "dd/MM/yyyy" value = "${trip.departureday}" /></span></h5>


        <form  onsubmit="addRating(event, ${driverId}, ${tripId})" id="star-rating">
            <div id="error-message" class="text-center alert-danger"></div>
            <h5 style="margin-top: 20px; text-align: center"> <span class="text-secondary">Tài xế chuyến:</span> 
                <span style="font-weight: bold; font-size: 16px">${driver.userIdDriver.user.name}</span></h5>
            <h5 style="margin-top: 20px; text-align: center"> <span class="text-secondary">Điểm đánh giá:</span> 
                <span style="font-weight: bold; font-size: 16px">${Math.ceil(rating * 10) / 10}</span> 
                <i class="fa-solid fa-star" style="color: orange; font-size: 25px; margin-left: 5px"></i></h5>
                <c:if test = "${isMoved == 1}">
                <div class="rating-box" style="display: flex; margin-top: 40px;" >
                    <p style="margin: 5px; font-weight: bold" class="text-secondary">Đánh giá: </p>
                    <div class="stars">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                    </div>
                </div>
                <input id="sendcomment" type="submit"  style="width: 30%; margin-left: 40%; margin-top: 30px; " value="Đánh giá" />
            </c:if>
        </form>
    </div>
</div>


<hr>
<br>
<h1 class=" divcomment comments-title ">Tổng số bình luận: ${commentCounter}</h1>

<div class="be-comment-block"  id="commentArea">
    <div class="be-comment" >
        <c:forEach items="${comments}" var="comment">
            <div class="be-img-comment">	
                <img  src="${comment.customerId.avatar}" class="rounded-circle be-ava-comment" />				
            </div>
            <div class="be-comment-content">

                <span class="be-comment-name"style="margin-bottom: 0px;">
                    <p style="font-size:18px;">${comment.customerId.name}</p>
                </span>
                <span class="be-comment-time comment-date" style="font-size:12px; ">
                    Thời gian: ${comment.createddate}
                </span>

                <p class="be-comment-text" style="font-size:15px; margin-bottom: 30px;">
                    ${comment.content}
                </p>
            </div>
        </c:forEach>
    </div> 
    <form class="form-block" onsubmit="addComment(event, ${tripId})">
        <div class="row" style="width:80%; margin-left: 13.5%">
            <c:if test = "${isMoved == 1}">
                <div class="col-xs-12">
                    <div class="form-group">
                        <textarea class="form-input" id="commentId" placeholder="Bình luận của bạn là..."></textarea>
                    </div>
                </div>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <input id="sendcomment" type="submit" style="width: 20%; margin-left: 30px;" value="Gửi bình luận" />                         
                </c:if> 
            </c:if>
        </div>
    </form>
</div>

<div style = "margin-left: 98%;">
    <ul class="pagination">
        <c:forEach begin="1" end="${Math.ceil(commentCounter/10)}" var="a">
            <li class="page-item"><a class="page-link" href="<c:url value="/comment/${tripId}" />?page=${a}">${a}</a></li>
            </c:forEach>
    </ul>
</div>

<script>
    window.onload = function () {
        let dates = document.getElementsByClassName("comment-date");
        for (let  i = 0; i < dates.length; i++)
            dates[i].innerText = "Thời gian: " + moment(dates[i].innerText)..locale("vi").fromNow();
    };
</script>


<script src="<c:url value="/js/comment.js"/>"></script>

<script>
    // Select all elements with the "i" tag and store them in a NodeList called "stars"
    const stars = document.querySelectorAll(".stars i");

// Loop through the "stars" NodeList
    stars.forEach((star, index1) => {
        // Add an event listener that runs a function when the "click" event is triggered
        star.addEventListener("click", () => {
            // Loop through the "stars" NodeList Again
            stars.forEach((star, index2) => {
                // Add the "active" class to the clicked star and any stars with a lower index
                // and remove the "active" class from any stars with a higher index
                index1 >= index2 ? star.classList.add("active") : star.classList.remove("active");
            });
        });
    });

</script>