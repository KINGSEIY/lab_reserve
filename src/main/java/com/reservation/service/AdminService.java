package com.reservation.service;

import com.reservation.pojo.*;

import java.util.List;

public interface AdminService {
    Admin verify(LoginInfo loginInfo);
    Admin getAdminByNum(String mgr_num);
    int check(String mgr_num,String mgr_email);
    int updatePassword(String mgr_num,String new_password,String mgr_email);
    int updatePassword2(String mgr_num, String new_password, String email, String mgr_tele);

    int updateTele(String mgr_tele ,String mgr_num);

    List<User> getUserBySearch_textAndUser_type(String search_text, int user_type, int col_id,int page,int size);

    int removeUserByNum(String user_num);

    int addStudent(String user_num, String user_name, int user_type, String sex, String sClass, String col_name, String dept, String col_id);

    int EditStudentInfo(String user_num, String user_name, String sex, String sClass, String col_name, String dept, String col_id);

    int addTeacher(String user_num, String user_name, int user_type, String sex, String col_name, String dept, String col_id);

    int EditTeacherInfo(String user_num, String user_name, String sex, String col_name, String dept, String col_id);

    List<Reservation> getReservationByCol_name(String col_name);

    List<Reservation> getReservationBySearch_textAndCol_name(String search_text, String col_name,int page,int size);

    int passReserve(int reserve_id);

    int refuseReserve(int reserve_id);

    List<Reservation> getReservationByLimit(int user_type, int statement, int date_interval, String col_name,int page,int size);

    List<Reservation> getReservationByDate_interval(int date_interval, String col_name,int page,int size);

    void deleteList(String[] ids);

    void deleteReserveList(Integer[] ids);

    void passReserveList(Integer[] ids);

    void refuseReserveList(Integer[] ids);

    List<Laboratory> getLaboratoryByCol_id(int col_id);

    List<Laboratory> getLaboratoryBySearch_textAndCol_id(String search_text, int col_id,int page,int size);

    Laboratory containsLab(String lab_id);

    int addLaboratory(String lab_id, String lab_name, String lab_addr, String description, String lab_capacity, String mgr_name, String mgr_tel, int col_id, String statement, String mgr_num, String col_name);

    void removeLabList(String[] ids);

    int removeLabByLab_id(String lab_id);

    Admin getMgrByMgr_num(String mgr_num);

    String getCol_nameByCol_id(int col_id);

    int EditLabInfo(String lab_id, String lab_name, String lab_addr, String description, String lab_capacity, String mgr_name, String mgr_tele, int col_id, String statement, String mgr_num, String col_name);

    List<Announcement> getAnnouncementByCol_id(int col_id);

    List<Announcement> getAnnouncementBySearch_textAndCol_id(String search_text, int col_id,int page,int size);

    int removeAnnoById(int id);

    int addAnnouncement(String title, String content, String mgr_name, int col_id);

    void removeAnnoList(int[] ids);

    int addLabScheduleList(String[] ids);

    void updateScheduleLab_name(String[] ids);

    List<User> getUserByCol_idAndUser_typeLimit(int col_id, int i,int page,int size);

    List<Reservation> getReservationByCol_nameLimit(String col_name, int page, int size);

    List<Laboratory> getLaboratoryByCol_idLimit(int col_id, int page, int size);

    List<Announcement> getAnnouncementByCol_idLimit(int col_id, int page, int size);

    List<User> getUserBySearch_textAndUser_typeLimit(String search_text, int i, int col_id, int page, int size);


    void removeReserveByLab_id(String[] ids);

    void deleteReserveByUser_id(String id);

    void removeScheduleByLab_id(String id);

    List<Admin> getAdminBySearch_textLimit(String search_text, int page, int size);

}
