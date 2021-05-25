package com.reservation.pojo;

public class Schedule {
    private int schedule_id;
    private String lab_id;
    private String lab_name;
    private String schedule_date;
    private int T1;
    private int T2;
    private int T3;
    private int T4;
    private int T5;

    public int getSchedule_id() {
        return schedule_id;
    }

    public void setSchedule_id(int schedule_id) {
        this.schedule_id = schedule_id;
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

    public String getSchedule_date() {
        return schedule_date;
    }

    public void setSchedule_date(String schedule_date) {
        this.schedule_date = schedule_date;
    }

    public int getT1() {
        return T1;
    }

    public void setT1(int t1) {
        T1 = t1;
    }

    public int getT2() {
        return T2;
    }

    public void setT2(int t2) {
        T2 = t2;
    }

    public int getT3() {
        return T3;
    }

    public void setT3(int t3) {
        T3 = t3;
    }

    public int getT4() {
        return T4;
    }

    public void setT4(int t4) {
        T4 = t4;
    }

    public int getT5() {
        return T5;
    }

    public void setT5(int t5) {
        T5 = t5;
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "schedule_id=" + schedule_id +
                ", lab_id='" + lab_id + '\'' +
                ", lab_name='" + lab_name + '\'' +
                ", schedule_date='" + schedule_date + '\'' +
                ", T1=" + T1 +
                ", T2=" + T2 +
                ", T3=" + T3 +
                ", T4=" + T4 +
                ", T5=" + T5 +
                '}';
    }
}
