/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "rating")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Rating.findAll", query = "SELECT r FROM Rating r"),
    @NamedQuery(name = "Rating.findByIdrating", query = "SELECT r FROM Rating r WHERE r.idrating = :idrating"),
    @NamedQuery(name = "Rating.findByStars", query = "SELECT r FROM Rating r WHERE r.stars = :stars"),
    @NamedQuery(name = "Rating.findByCreateddate", query = "SELECT r FROM Rating r WHERE r.createddate = :createddate")})
public class Rating implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idrating")
    private Integer idrating;
    @Basic(optional = false)
    @NotNull
    @Column(name = "stars")
    private int stars;
    @Basic(optional = false)
    @NotNull
    @Column(name = "createddate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createddate;
    @JoinColumn(name = "driverdetail_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Driverdetail driverdetailId;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private User user;

    public Rating() {
    }

    public Rating(Integer idrating) {
        this.idrating = idrating;
    }

    public Rating(Integer idrating, int stars, Date createddate) {
        this.idrating = idrating;
        this.stars = stars;
        this.createddate = createddate;
    }

    public Integer getIdrating() {
        return idrating;
    }

    public void setIdrating(Integer idrating) {
        this.idrating = idrating;
    }

    public int getStars() {
        return stars;
    }

    public void setStars(int stars) {
        this.stars = stars;
    }

    public Date getCreateddate() {
        return createddate;
    }

    public void setCreateddate(Date createddate) {
        this.createddate = createddate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idrating != null ? idrating.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Rating)) {
            return false;
        }
        Rating other = (Rating) object;
        if ((this.idrating == null && other.idrating != null) || (this.idrating != null && !this.idrating.equals(other.idrating))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qldv.pojo.Rating[ idrating=" + idrating + " ]";
    }

    /**
     * @return the driverdetailId
     */
    public Driverdetail getDriverdetailId() {
        return driverdetailId;
    }

    /**
     * @param driverdetailId the driverdetailId to set
     */
    public void setDriverdetailId(Driverdetail driverdetailId) {
        this.driverdetailId = driverdetailId;
    }

    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }
    
}
