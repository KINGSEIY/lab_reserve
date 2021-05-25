package com.reservation.pojo;

import java.util.Date;

public class User {
    private int id;
    private int col_id;
    private String passwd;
    private String user_num;
    private String user_name;
    private int user_type;
    private String sex;
    private String sClass;
    private String col_name;
    private String dept;
    private String email;
    private Date last_login_time;

    public int getCol_id() {
        return col_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCol_id(int col_id) {
        this.col_id = col_id;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getUser_num() {
        return user_num;
    }

    public void setUser_num(String user_num) {
        this.user_num = user_num;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getUser_type() {
        return user_type;
    }

    public void setUser_type(int user_type) {
        this.user_type = user_type;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getsClass() {
        return sClass;
    }

    public void setsClass(String sClass) {
        this.sClass = sClass;
    }

    public String getCol_name() {
        return col_name;
    }

    public void setCol_name(String col_name) {
        this.col_name = col_name;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getLast_login_time() {
        return last_login_time;
    }

    public void setLast_login_time(Date last_login_time) {
        this.last_login_time = last_login_time;
    }


    @Override
    public String toString() {
        return "User{" +
                "col_id=" + col_id +
                ", passwd='" + passwd + '\'' +
                ", user_num='" + user_num + '\'' +
                ", user_name='" + user_name + '\'' +
                ", user_type=" + user_type +
                ", sex='" + sex + '\'' +
                ", sClass='" + sClass + '\'' +
                ", col_name='" + col_name + '\'' +
                ", dept='" + dept + '\'' +
                ", email='" + email + '\'' +
                ", last_login_time=" + last_login_time +
                '}';
    }
}
