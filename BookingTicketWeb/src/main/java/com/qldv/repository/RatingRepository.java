/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.repository;

import com.qldv.pojo.Employee;
import com.qldv.pojo.Rating;
import java.util.List;
import java.util.Map;

/**
 *
 * @author dieuh
 */
public interface RatingRepository {

    List<Object[]> getRatingOb();

    List<Object[]> getRating(Map<String, String> params, int start, int limit);

    int getOneStar(int userId);

    int getTwoStar(int userId);

    int getThreeStar(int userId);

    int getFourStar(int userId);

    int getFiveStar(int userId);
}
