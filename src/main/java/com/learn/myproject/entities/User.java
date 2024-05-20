package com.learn.myproject.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 150, name = "user_id")
    private int userId;
    @Column(length = 150, name = "user_name")
    private String username;
    @Column(length = 100, name = "user_email")
    private String userEmail;
    @Column(length = 100, name = "user_password")
    private String userPassword;
    @Column(length = 100, name = "user_phone")
    private String userPhone;
    @Column(length = 100, name = "user_pic")
    private String userPic;
    @Column(length = 1500, name = "user_address")
    private String userAddress;

    @Column(name = "user_type")
    private String userType;


    public User(int userId, String username, String userEmail, String userPassword, String userPhone, String userPic, String userAddress, String userType) {
        this.userId = userId;
        this.username = username;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType = userType;
    }

    public User(String username, String userEmail, String userPassword, String userPhone, String userPic, String userAddress, String userType) {
        this.username = username;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType = userType;
    }

    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public String getUsername() {
        return username;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public String getUserPic() {
        return userPic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUsertype() {
        return userType;
    }


    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", username=" + username + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress + '}';
    }

}
