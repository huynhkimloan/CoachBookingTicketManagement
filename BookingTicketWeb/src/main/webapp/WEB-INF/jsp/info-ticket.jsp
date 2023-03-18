<%-- 
    Document   : info-ticket
    Created on : Feb 15, 2023, 3:13:53 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
    <h2 class="text-center">THÔNG TIN VÉ</h2>
    
    <div>
            <c:if test="${!infoticketofuser.isEmpty()}">
            
            <c:forEach var="i" items="${infoticketofuser}">
                <div>
                    <h5 style=" margin-top: 5px" class="text-danger">Tuyến xe: ${i.tripId.routeId.startingpoint} - ${i.tripId.routeId.destination}</h5>
                    <div style="display: flex; align-items: center">
                        <div>
                            <p>Mã vé: ${i.id}</p>
                            <p>Giờ khởi hành: <fmt:formatDate type = "time" value = "${i.tripId.departuretime}" /> </p>
                            <p>Ngày khởi hành: <fmt:formatDate pattern = "dd/MM/yyyy" value = "${i.tripId.departureday}" /> </p>
                            <p>Ghế: ${i.seatId.name}</p>
                            <input type ="hidden" name="createddate" value="${i.createddate}"/>
                            
                        </div>
                        <div style="margin: 0 auto">
                            <c:url value="/info-ticket/${i.id}" var="c" />
                            <a  href="${c}" title="Hủy vé" class="btn btn-danger">Hủy vé</a>
                        </div>
                    </div>
                </div>
                <hr>
            </c:forEach>
                
            </c:if>
            <c:if test="${infoticketofuser.isEmpty()}">
                <p class="text-danger"><i>Không có thông tin vé nào!</i></p>
            </c:if>
    </div>    
