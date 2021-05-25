package com.reservation.pojo;

public class LoginInfo {
    private String user_num;
    private String passwd;

    public String getUser_num() {
        return user_num;
    }

    public void setUser_num(String user_num) {
        this.user_num = user_num;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    @Override
    public String toString() {
        return "LoginInfo{" +
                "user_num='" + user_num + '\'' +
                ", passwd='" + passwd + '\'' +
                '}';
    }
}
