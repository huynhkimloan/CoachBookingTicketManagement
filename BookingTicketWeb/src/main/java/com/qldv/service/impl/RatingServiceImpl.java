/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.service.impl;

import com.qldv.pojo.Driver;
import com.qldv.pojo.Rating;
import com.qldv.repository.DriverRepository;
import com.qldv.repository.RatingRepository;
import com.qldv.service.RatingService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dieuh
 */
@Service
public class RatingServiceImpl implements RatingService {

    @Autowired
    private RatingRepository ratingRepository;

    @Override
    public List<Object[]> getRatingOb() {
        return this.ratingRepository.getRatingOb();
    }

    @Override
    public List<Object[]> getRating(Map<String, String> params, int start, int limit) {
        return this.ratingRepository.getRating(params, start, limit);
    }

    @Override
    public int getOneStar(int i) {
        return this.ratingRepository.getOneStar(i);
    }

    @Override
    public int getTwoStar(int i) {
        return this.ratingRepository.getTwoStar(i);
    }

    @Override
    public int getThreeStar(int i) {

        return this.ratingRepository.getThreeStar(i);
    }

    @Override
    public int getFourStar(int i) {
        return this.ratingRepository.getFourStar(i);
    }

    @Override
    public int getFiveStar(int i) {
        return this.ratingRepository.getFiveStar(i);
    }

}
