/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.paypal.base.rest.PayPalRESTException;
import com.qldv.pojo.Seat;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author dieuh
 */
@Controller
public class AuthorizePaymentController {
    
   @PostMapping("/paybyPaypal")
    public void viewPayPaypal(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       
        String subtotal = request.getParameter("price");
        String total = request.getParameter("amount");
        String quantity = request.getParameter("quantity");
        String tripId = request.getParameter("tripId");

        Seat seat = new Seat(Long.parseLong(subtotal), Long.parseLong(total), Integer.parseInt(quantity), Integer.parseInt(tripId));
           
        try {
           PaypalController paypalController = new PaypalController();
           String approvalLink = paypalController.authorizePayment(seat);
           
           response.sendRedirect(approvalLink);
       } catch (PayPalRESTException ex) {
           ex.printStackTrace();
           request.setAttribute("errorMessage", "Thông tin chi tiết vé không hợp lệ!");
           request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(request, response);
       }
    } 
}