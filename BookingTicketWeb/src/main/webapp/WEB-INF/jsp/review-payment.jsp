<%-- 
    Document   : review-payment
    Created on : Feb 22, 2023, 3:58:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin vé</title>
    </head>
    <body>
        <div>
            <h1>Thông tin vé(Xem trước)</h1>
            <!--method="post" action="<c:url value="/execute-payment"/>"-->
            <form >
                <table>
                    <tr>
                        <td colspan="2"><b>Transaction Detail</b></td>
                        <td>
                            <input name="paymentId" value="${param.paymentId}">
                            <input name="PayerID" value="${param.PayerID}">
                            <input name="tripId" value="${tripId}">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <a onclick="pay(${tripId}, 'Paypal')"><p style="margin-bottom: 0">Thanh toán</p></a>
                            
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>

<script src="<c:url value="/js/reservation.js"/>"></script>
