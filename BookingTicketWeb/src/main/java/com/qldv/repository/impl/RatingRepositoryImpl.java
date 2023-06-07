/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.repository.impl;

import com.qldv.pojo.Driverdetail;
import com.qldv.pojo.Rating;
import com.qldv.pojo.User;
import com.qldv.repository.RatingRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author dieuh
 */
@Repository
@Transactional
public class RatingRepositoryImpl implements RatingRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> getRating(Map<String, String> params, int start, int limit) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root root = query.from(Rating.class);
        Root rootU = query.from(User.class);
        Root rootD = query.from(Driverdetail.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootD.get("userIdDriver"), rootU.get("id")));
        predicates.add(builder.equal(root.get("driverdetailId"), rootD.get("id")));

        if (params != null) {
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                predicates.add(builder.like(rootU.get("name").as(String.class),
                        String.format("%%%s%%", kw)));
            }
        }
        query.multiselect(rootU.get("name"), builder.avg(root.get("stars")), rootU.get("id"));
        query.where(predicates.toArray(new Predicate[]{}));
        query.groupBy(rootU.get("name"));
        query.orderBy(builder.asc(builder.avg(root.get("stars"))));

        Query q = session.createQuery(query);
        q.setFirstResult(start);
        q.setMaxResults(limit);
        return q.getResultList();
    }

    @Override
    public List<Object[]> getRatingOb() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root root = query.from(Rating.class);
        Root rootU = query.from(User.class);
        Root rootD = query.from(Driverdetail.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootD.get("userIdDriver"), rootU.get("id")));
        predicates.add(builder.equal(root.get("driverdetailId"), rootD.get("id")));

        query.multiselect((rootU.get("name")), builder.avg(root.get("stars")), rootU.get("id"));

        query.groupBy(rootU.get("name"));
        query.orderBy(builder.asc(builder.avg(root.get("stars"))));
        query.where(predicates.toArray(new Predicate[]{}));
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public int getOneStar(int i) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);


        Root root = query.from(Rating.class);
        Root rootD = query.from(Driverdetail.class);
        

        
            List<Predicate> predicates = new ArrayList<>();

            predicates.add(builder.equal(root.get("driverdetailId"), rootD.get("id")));
            predicates.add(builder.equal(root.get("stars"), 1));
            predicates.add(builder.equal(rootD.get("userIdDriver"), i));
            query.multiselect(builder.count(root.get("stars")));

            query.where(predicates.toArray(new Predicate[]{}));
            Query q = session.createQuery(query);
            return Integer.parseInt(q.getSingleResult().toString());
        
    }

    @Override
    public int getTwoStar(int i) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root root = query.from(Rating.class);
        Root rootD = query.from(Driverdetail.class);
        

        
            List<Predicate> predicates = new ArrayList<>();

            predicates.add(builder.equal(root.get("driverdetailId"), rootD.get("id")));
            predicates.add(builder.equal(root.get("stars"), 2));
            predicates.add(builder.equal(rootD.get("userIdDriver"), i));
            query.multiselect(builder.count(root.get("stars")));

            query.where(predicates.toArray(new Predicate[]{}));
            Query q = session.createQuery(query);
            return Integer.parseInt(q.getSingleResult().toString());
        
    }

    @Override
    public int getThreeStar(int i) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);


        Root root = query.from(Rating.class);
        Root rootD = query.from(Driverdetail.class);
        

        
            List<Predicate> predicates = new ArrayList<>();

            predicates.add(builder.equal(root.get("driverdetailId"), rootD.get("id")));
            predicates.add(builder.equal(root.get("stars"), 3));
            predicates.add(builder.equal(rootD.get("userIdDriver"), i));
            query.multiselect(builder.count(root.get("stars")));

            query.where(predicates.toArray(new Predicate[]{}));
            Query q = session.createQuery(query);
            return Integer.parseInt(q.getSingleResult().toString());
        
    }

    @Override
    public int getFourStar(int i) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);


        Root root = query.from(Rating.class);
        Root rootD = query.from(Driverdetail.class);
        

        
            List<Predicate> predicates = new ArrayList<>();

            predicates.add(builder.equal(root.get("driverdetailId"), rootD.get("id")));
            predicates.add(builder.equal(root.get("stars"), 4));
            predicates.add(builder.equal(rootD.get("userIdDriver"), i));
            query.multiselect(builder.count(root.get("stars")));

            query.where(predicates.toArray(new Predicate[]{}));
            Query q = session.createQuery(query);
            return Integer.parseInt(q.getSingleResult().toString());
        
    }

    @Override
    public int getFiveStar(int i) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root root = query.from(Rating.class);
        Root rootD = query.from(Driverdetail.class);
        

        
            List<Predicate> predicates = new ArrayList<>();

            predicates.add(builder.equal(root.get("driverdetailId"), rootD.get("id")));
            predicates.add(builder.equal(root.get("stars"), 5));
            predicates.add(builder.equal(rootD.get("userIdDriver"), i));
            query.multiselect(builder.count(root.get("stars")));

            query.where(predicates.toArray(new Predicate[]{}));
            Query q = session.createQuery(query);
            return Integer.parseInt(q.getSingleResult().toString());
        
    }

}
