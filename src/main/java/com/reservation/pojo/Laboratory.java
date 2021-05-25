package com.reservation.pojo;

public class Laboratory {
    private String lab_id;
    private String lab_name;
    private String lab_addr;
    private String description;
    private int statement;
    private int lab_capacity;
    private String mgr_tel;
    private String mgr_name;
    private String mgr_num;
    private String col_name;
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

    public String getMgr_num() {
        return mgr_num;
    }

    public void setMgr_num(String mgr_num) {
        this.mgr_num = mgr_num;
    }

    public String getLab_id() {
        return lab_id;
    }

    public void setLab_id(String lab_id) {
        this.lab_id = lab_id;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getLab_capacity() {
        return lab_capacity;
    }

    public void setLab_capacity(int lab_capacity) {
        this.lab_capacity = lab_capacity;
    }

    public String getMgr_tel() {
        return mgr_tel;
    }

    public void setMgr_tel(String mgr_tel) {
        this.mgr_tel = mgr_tel;
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

    public int getStatement() {
        return statement;
    }

    public void setStatement(int statement) {
        this.statement = statement;
    }

    @Override
    public String toString() {
        return "Laboratory{" +
                "lab_id='" + lab_id + '\'' +
                ", lab_name='" + lab_name + '\'' +
                ", lab_addr='" + lab_addr + '\'' +
                ", description='" + description + '\'' +
                ", statement=" + statement +
                ", lab_capacity=" + lab_capacity +
                ", mgr_tel='" + mgr_tel + '\'' +
                ", mgr_name='" + mgr_name + '\'' +
                ", mgr_num='" + mgr_num + '\'' +
                ", col_name='" + col_name + '\'' +
                '}';
    }
}
