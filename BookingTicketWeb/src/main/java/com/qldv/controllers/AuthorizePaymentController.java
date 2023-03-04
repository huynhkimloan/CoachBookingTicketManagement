/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.paypal.base.rest.PayPalRESTException;
import com.qldv.pojo.Seat;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author dieuh
 */
@Controller
public class AuthorizePaymentController {
    
   @PostMapping("/paybyPaypal")
    public void viewPayPaypal(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       
           String seatName = request.getParameter("A1");
           String subtotal = request.getParameter("560000");
           String total = request.getParameter("300");
           
           Seat seat = new Seat("A1", 3L, 3L);
           
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