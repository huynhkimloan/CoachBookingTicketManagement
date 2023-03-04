/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Admin
 */
@Controller
public class ReviewPaymentController {
    
    @RequestMapping("/cancel")
    public String viewCancelPage(){
       return "cancel";
    } 
    
    @RequestMapping("/review-payment")
    public String reviewPage(){
       return "review-payment";
    } 

    @GetMapping("/review-payment")
    public void viewReviewPayment(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");

        try {
            PaypalController paypalController = new PaypalController();
            Payment payment = paypalController.getPaymentDetails(paymentId);
        
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
//            Transaction transaction = payment.getTransactions().get(0);
            
            request.setAttribute("payer", payerInfo);
            
            String url = "/WEB-INF/jsp/review-payment.jsp?paymentId=" + paymentId + "&PayerID=" + payerId;
            request.getRequestDispatcher(url).forward(request, response);
            
        } catch (PayPalRESTException ex) {
            ex.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi hiển thị thông tin chi tiết vé! ");
            request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(request, response);
        }
    }
}
