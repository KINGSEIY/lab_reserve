package com.reservation.pojo;

public class Notice {
    private String notice;      //首页的使用须知

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "notice='" + notice + '\'' +
                '}';
    }
}
