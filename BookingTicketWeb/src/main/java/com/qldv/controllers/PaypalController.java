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
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import com.qldv.pojo.Seat;
import com.qldv.pojo.Ticketdetail;
import java.util.ArrayList;
import java.util.List;
import javax.xml.soap.Detail;
import org.springframework.stereotype.Controller;

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
        
        
        return null;
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
        details.setSubtotal(String.valueOf(seat.getPrice()));
        
        Amount amount = new Amount();
        amount.setCurrency("VND");
        amount.setTotal(String.valueOf(seat.getAmount()));
        amount.setDetails(details);
        
        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
//        transaction.setDescription(seat.getName());
        
        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<Item>();
        
        Item  item = new Item();
        item.setCurrency("VND"). setName(seat.getName())
                .setPrice(String.valueOf(seat.getPrice()))
                .setQuantity("1");
        
        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);
        
        List<Transaction> listTransaction = new ArrayList<Transaction>();
        listTransaction.add(transaction);
        
        return listTransaction;
        
    }

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/BookingTicketWeb");
        redirectUrls.setReturnUrl("http://localhost:8080/BookingTicketWeb");
    
        return redirectUrls;
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
