/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import com.qldv.pojo.Seat;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Admin
 */
@Controller
public class ExecutePaymentServlet {
    
    @RequestMapping("/execute-payment")
    public String reviewPage(){
       return "paybypaypal";
    }
    
    @PostMapping("/execute-payment")
    public void viewPayPaypal(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
    
        try{
            PaypalController paypalController = new PaypalController();
            Payment payment =  paypalController.excutePayment(paymentId, payerId);

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();

            request.setAttribute("payer", payerInfo);

            request.getRequestDispatcher("/WEB-INF/jsp/successpage.jsp").forward(request, response);
        
        } catch (PayPalRESTException ex) {
            ex.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi không thể hoàn tất quá trình mua vé của bạn! ");
            request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(request, response);
        }
    }
} 
