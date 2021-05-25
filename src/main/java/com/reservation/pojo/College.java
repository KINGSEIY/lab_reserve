package com.reservation.pojo;

import java.io.Serializable;

public class College implements Serializable {
    private int col_id;
    private String col_name;

    public int getCol_id() {
        return col_id;
    }

    public void setCol_id(int col_id) {
        this.col_id = col_id;
    }

    public String getCol_name() {
        return col_name;
    }

    public void setCol_name(String col_name) {
        this.col_name = col_name;
    }

    @Override
    public String toString() {
        return "College{" +
                "col_id=" + col_id +
                ", col_name='" + col_name + '\'' +
                '}';
    }
}
