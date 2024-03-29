/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.repository;

import com.qldv.pojo.Seat;
import com.qldv.pojo.Ticketdetail;
import com.qldv.pojo.User;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface TicketDetailRepository {
    
    List<Ticketdetail> getTickets(Map<String, String> params, int start, int limit);

    List<Ticketdetail> getListNav(Map<String, String> params, int start, int limit);

    boolean editTicket(Ticketdetail t);
    
    boolean deleteTicketDetail(int tripId);

    List<Object[]> findTicketsByTripId(int tripId);

    List<Seat> getSeat(String kw);

    long countSeat(String kw);

    Object getUsers(String uname);

    boolean addReceipt(Map<Integer, Seat> seat, int uId, String method);

    int totalItem();

    Long sumItem();

    int countTicketsByTripId(int tripId);
    
    List<Ticketdetail> getTicketOfUser(int userId, Date date);
    
    boolean cancelTicket(Ticketdetail cancel);
    
    Ticketdetail getTicketById(int id);
    
    long sumPointPlus(int userId);
  
    List<Object> listTripIdUserMoved(int userId);
        
    
    List<Ticketdetail> getTicketsCancel(Map<String, String> params, int start, int limit);
    
    List<Ticketdetail> getTicketsProcess(Map<String, String> params, int start, int limit);

    boolean changeStatusPayment(Ticketdetail ticket);
    
    boolean changeActive(Ticketdetail ticket);

}
