package com.reservation.service;

import com.reservation.pojo.*;

import java.io.InputStream;
import java.util.Date;
import java.util.List;

public interface PublicService {
    String getNotice();
    List<Announcement> getAnnouncement();
    List<Announcement> getAnnouncementByCol(int col_id);

    List<Laboratory>  getAllLaboratory();
    List<Laboratory>  getLaboratoryLikeSearch_text(String search_text);
    List<Laboratory>  getLaboratoryByLimit(int col_id, String lab_name, String lab_id, int statement);
    Laboratory getLaboratoryByLab_id(String lab_id);

    List<Schedule>  getSchedulesByLab_id(String lab_id);

    void updateScheduleAdd(String lab_id,String schedule_date,String time_interval);
//    void updateScheduleAdd_statement(String lab_id,String schedule_date,String time_interval,int lab_capacity);

    void updateSchedule(String lab_id, String schedule_date, String time_interval);

    List<Reservation> getReservationByLab_nameAndReserve_type(String lab_name,int reserve_type);

    String InputExcel(InputStream is, String originalFilename);

    String InputLabExcel(InputStream is, String originalFilename);

    List<Admin> getAllMgr(int page, int size);

    int removeAdminByMgr_num(String mgr_num);

    Admin containsAdmin(String mgr_num);

    int addAdmin(String mgr_num, String mgr_name, String col_name,int col_id);


    int getCol_idByCol_name(String col_name);

    int EditMgrInfo(String mgr_num, String mgr_name, String col_name, int col_id);

    String InputAdminExcel(InputStream is, String originalFilename);
}
