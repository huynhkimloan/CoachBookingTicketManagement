<%-- 
    Document   : review-payment
    Created on : Feb 22, 2023, 3:58:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin vé</title>
    </head>
    <body>
        <div>
            <h1>Thông tin vé(Xem trước)</h1>
            <form>
                <table>
                    <tr>
                        <td colspan="2"><b>Transaction Detail</b></td>
                        <td>
                            <input name="paymentId" value="${param.paymentId}">
                            <input name="PayerID" value="${param.PayerID}">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <input type="submit" value="Thanh toán"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
