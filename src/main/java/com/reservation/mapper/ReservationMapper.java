package com.reservation.mapper;

import com.reservation.pojo.Reservation;

import java.util.List;

public interface ReservationMapper {

    List<Reservation> getReservationByUser_num(String user_num);

    List<Reservation> getReservationByCol_name(String col_name);

    List<Reservation> getReservationBySearch_textAndCol_name(String search_text, String col_name);

    int passReserve(int reserve_id);
    int refuseReserve(int reserve_id);

    List<Reservation> getReservationByUser_typeAndStatement(int user_type, int statement,String col_name,int page,int size);

    List<Reservation> getReservationByUser_type(int user_type,String col_name,int page,int size);

    List<Reservation> getReservationByStatement(int statement,String col_name,int page,int size);

    List<Reservation> getReservationByUser_typeAndStatementAndLimit_week(int user_type, int statement,String col_name,int page,int size);

    List<Reservation> getReservationByUser_typeAndLimit_week(int user_type,String col_name,int page,int size);

    List<Reservation> getReservationByStatementAndLimit_week(int statement,String col_name,int page,int size);

    List<Reservation> getReservationByUser_typeAndStatementAndLimit_month(int user_type, int statement,String col_name,int page,int size);

    List<Reservation> getReservationByUser_typeAndLimit_month(int user_type,String col_name,int page,int size);

    List<Reservation> getReservationByStatementAndLimit_month(int statement,String col_name,int page,int size);

    List<Reservation> getReservationByLimit_month(String col_name,int page,int size);

    List<Reservation> getReservationByLimit_week(String col_name,int page,int size);

    void deleteReserveList(Integer[] ids);

    void passReserveList(Integer[] ids);

    void refuseReserveList(Integer[] ids);

    List<Reservation> getReservationByLab_nameAndReserve_type(String lab_name,int reserve_type);

    List<Reservation> getReservationByLab_name(String lab_name);

    void deleteReservationByRes_id(int reserve_id);

    void deleteReservationByUser_num(String id);

}
