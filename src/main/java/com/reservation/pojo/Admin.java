package com.reservation.pojo;

import java.util.Date;

public class Admin {
    private String  mgr_num;
    private  String passwd;
    private String mgr_tele;
    private String mgr_name;
    private  String col_name;
    private String mgr_email;
    private Date last_login_time;
    private  int  user_type=3;
    private int col_id;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCol_id() {
        return col_id;
    }

    public void setCol_id(int col_id) {
        this.col_id = col_id;
    }

    public Date getLast_login_time() {
        return last_login_time;
    }

    public void setLast_login_time(Date last_login_time) {
        this.last_login_time = last_login_time;
    }

    public String getMgr_email() {
        return mgr_email;
    }

    public void setMgr_email(String mgr_email) {
        this.mgr_email = mgr_email;
    }

    public int getUser_type() {
        return user_type;
    }

    public void setUser_type(int user_type) {
        this.user_type = user_type;
    }



    public String getMgr_num() {
        return mgr_num;
    }

    public void setMgr_num(String mgr_num) {
        this.mgr_num = mgr_num;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getMgr_tele() {
        return mgr_tele;
    }

    public void setMgr_tele(String mgr_tele) {
        this.mgr_tele = mgr_tele;
    }

    public String getMgr_name() {
        return mgr_name;
    }

    public void setMgr_name(String mgr_name) {
        this.mgr_name = mgr_name;
    }

    public String getCol_name() {
        return col_name;
    }

    public void setCol_name(String col_name) {
        this.col_name = col_name;
    }



    @Override
    public String toString() {
        return "Admin{" +
                "mgr_num='" + mgr_num + '\'' +
                ", passwd='" + passwd + '\'' +
                ", mgr_tele='" + mgr_tele + '\'' +
                ", mgr_name='" + mgr_name + '\'' +
                ", col_name='" + col_name + '\'' +
                ", mgr_email='" + mgr_email + '\'' +
                ", last_login_time=" + last_login_time +
                ", user_type=" + user_type +
                ", col_id=" + col_id +
                '}';
    }
}
