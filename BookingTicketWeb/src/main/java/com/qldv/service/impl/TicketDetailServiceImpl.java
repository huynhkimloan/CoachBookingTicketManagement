/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.service.impl;

import com.qldv.pojo.Seat;
import com.qldv.pojo.Ticketdetail;
import com.qldv.repository.TicketDetailRepository;
import com.qldv.service.TicketDetailService;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class TicketDetailServiceImpl implements TicketDetailService {

    @Autowired
    private TicketDetailRepository ticketDetailRepository;

    @Override
    public List<Object[]> findTicketsByTripId(int tripId) {
        return this.ticketDetailRepository.findTicketsByTripId(tripId);
    }

    @Override
    public List<Seat> getSeat(String kw) {
        return this.ticketDetailRepository.getSeat(kw);
    }

    @Override
    public long countSeat(String kw) {
        return this.ticketDetailRepository.countSeat(kw);
    }

    @Override
    public Object getUsers(String uname) {
        return this.ticketDetailRepository.getUsers(uname);
    }

    @Override
    public boolean addReceipt(Map<Integer, Seat> seat, int uId, String method) {
        if (seat != null) {
            return this.ticketDetailRepository.addReceipt(seat, uId, method);
        }
        return false;

    }

    @Override
    public int totalItem() {
        return this.ticketDetailRepository.totalItem();
    }

    @Override
    public Long sumItem() {
        return this.ticketDetailRepository.sumItem();
    }

    @Override
    public int countTicketsByTripId(int tripId) {
        return this.ticketDetailRepository.countTicketsByTripId(tripId);
    }

    @Override
    public List<Ticketdetail> getTickets(Map<String, String> params, int start, int limit) {
        return this.ticketDetailRepository.getTickets(params, start, limit);
    }

    @Override
    public List<Ticketdetail> getListNav(Map<String, String> params, int start, int limit) {
        return this.ticketDetailRepository.getListNav(params, start, limit);
    }

    @Override
    public boolean editTicket(Ticketdetail t) {
        return this.ticketDetailRepository.editTicket(t);
    }

    @Override
    public List<Ticketdetail> getTicketOfUser(int id, Date date) {
        return this.ticketDetailRepository.getTicketOfUser(id, date);
    }

    @Override
    public boolean cancelTicket(Ticketdetail cancel) {
        return this.ticketDetailRepository.cancelTicket(cancel);
    }

    @Override
    public Ticketdetail getTicketById(int id) {
        return this.ticketDetailRepository.getTicketById(id);
    }

    @Override
    public long sumPointPlus(int i) {
        return this.ticketDetailRepository.sumPointPlus(i);
    }

    @Override
    public List<Object> listTripIdUserMoved(int i) {
        return this.ticketDetailRepository.listTripIdUserMoved(i);
    }

    @Override
    public List<Ticketdetail> getTicketsCancel(Map<String, String> params, int start, int limit) {
        return this.ticketDetailRepository.getTicketsCancel(params, start, limit);
    }

    @Override
    public List<Ticketdetail> getTicketsProcess(Map<String, String> params, int start, int limit) {
        return this.ticketDetailRepository.getTicketsProcess(params, start, limit);
    }
    
    @Override
    public boolean changeStatusPayment(Ticketdetail ticket) {
        return this.ticketDetailRepository.changeStatusPayment(ticket);
    }

    @Override
    public boolean changeActive(Ticketdetail ticket) {
        return this.ticketDetailRepository.changeActive(ticket);
    }
}
