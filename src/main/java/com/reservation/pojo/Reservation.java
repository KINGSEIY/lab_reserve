package com.reservation.pojo;

import java.util.Date;

public class Reservation {
    private int id;
    private int reserve_id;
    private String lab_name;
    private String lab_addr;
    private String col_name;
    private String user_num;
    private String user_name;
    private int user_type;
    private int reserve_type;
    private String courseName;
    private String reserve_date;
    private String time_interval;
    private String description;
    private int statement;
    private String dept;

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public int getUser_type() {
        return user_type;
    }

    public void setUser_type(int user_type) {
        this.user_type = user_type;
    }

    public String getCol_name() {
        return col_name;
    }

    public void setCol_name(String col_name) {
        this.col_name = col_name;
    }

    public int getReserve_id() {
        return reserve_id;
    }

    public void setReserve_id(int reserve_id) {
        this.reserve_id = reserve_id;
    }

    public String getLab_name() {
        return lab_name;
    }

    public void setLab_name(String lab_name) {
        this.lab_name = lab_name;
    }

    public String getLab_addr() {
        return lab_addr;
    }

    public void setLab_addr(String lab_addr) {
        this.lab_addr = lab_addr;
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

    public int getReserve_type() {
        return reserve_type;
    }

    public void setReserve_type(int reserve_type) {
        this.reserve_type = reserve_type;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getReserve_date() {
        return reserve_date;
    }

    public void setReserve_date(String reserve_date) {
        this.reserve_date = reserve_date;
    }

    public String getTime_interval() {
        return time_interval;
    }

    public void setTime_interval(String time_interval) {
        this.time_interval = time_interval;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatement() {
        return statement;
    }

    public void setStatement(int statement) {
        this.statement = statement;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "id=" + id +
                ", reserve_id=" + reserve_id +
                ", lab_name='" + lab_name + '\'' +
                ", lab_addr='" + lab_addr + '\'' +
                ", col_name='" + col_name + '\'' +
                ", user_num='" + user_num + '\'' +
                ", user_name='" + user_name + '\'' +
                ", user_type='" + user_type + '\'' +
                ", reserve_type=" + reserve_type +
                ", courseName='" + courseName + '\'' +
                ", reserve_date='" + reserve_date + '\'' +
                ", time_interval='" + time_interval + '\'' +
                ", description='" + description + '\'' +
                ", statement=" + statement +
                '}';
    }
}