/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import com.qldv.pojo.Seat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class PaypalController {
    private static final String CLIENT_ID = "AfvzZouXGExYZ7ik6MZcVXjB9WaGrLsrM53pFwic6BDANX_ZXIwpE1mN033ir16HBTs1Q0Xds1C-2qhT";
    private static final String CLIENT_SECRET = "EAdMP2pzZJqhUKDwNF6FnHMS_n2LG3LQrb0Z1vsEl2vJZilY9ZE9rnBcCOoCzkERI2R3q4X4qxipb4Zp";
    private static final String MODE = "sandbox";
    
    public String authorizePayment(Seat seat) throws PayPalRESTException{
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionI(seat);
        
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction)
                .setRedirectUrls(redirectUrls)
                .setPayer(payer).setIntent("authorize");
        
        APIContext aPIContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        Payment approvePayment = requestPayment.create(aPIContext);
        
        System.out.println(approvePayment);
        
        return getApprovalLink(approvePayment);
    }
    
    private String getApprovalLink(Payment approvePayment){
        List<Links> links = approvePayment.getLinks();
        String approvalLink = null;
        
        for(Links link: links){
            if(link.getRel().equalsIgnoreCase("approval_url")){
                approvalLink = link.getHref();
            }
        }
        return approvalLink;
    }
    
    private List<Transaction> getTransactionI(Seat seat){
        Details details = new Details();
//        String sub = String.valueOf(seat.getPrice()* seat.getQuantity());
        details.setSubtotal(String.valueOf(seat.getAmount()));
        
//        details.setShipping("0");
//        details.setTax("0");
        
        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(String.valueOf(seat.getAmount()));
        amount.setDetails(details);
        
        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
//        transaction.setDescription(seat.getName());
        
        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<Item>();
        
        Item  item = new Item();
        item.setCurrency("USD").setSku(String.valueOf(seat.getTripId()))
                .setPrice(String.valueOf(seat.getPrice()))
                .setQuantity(String.valueOf(seat.getQuantity()));
        
        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);
        
        List<Transaction> listTransaction = new ArrayList<Transaction>();
        listTransaction.add(transaction);
        
        return listTransaction;
        
    }

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/BookingTicketWeb/cancel");
        redirectUrls.setReturnUrl("http://localhost:8080/BookingTicketWeb/review-payment");
    
        return redirectUrls;
    }
    
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException{
        APIContext aPIContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(aPIContext, paymentId);
    }
    
    public Payment excutePayment(String paymentId, String payerId) throws PayPalRESTException{
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);
        
        Payment payment = new Payment().setId(paymentId);
        
        APIContext aPIContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        
        return payment.execute(aPIContext, paymentExecution);
    }

    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");
        
        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("Loan")
                .setLastName("Huynh")
                .setEmail("1951052102loan@ou.edu.vn");
        
        payer.setPayerInfo(payerInfo);
        
        return payer;
    }
}
