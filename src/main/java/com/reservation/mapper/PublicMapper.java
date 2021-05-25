package com.reservation.mapper;

import com.reservation.pojo.*;

import java.util.List;
import java.util.Map;

public interface PublicMapper {
    String getNotice();
    List<Announcement> getAnnouncement();
    List<Announcement> getAnnouncementByCol_id(int col_id);
    List<Laboratory> getAllLaboratory();

    List<Laboratory> getLaboratoryLikeSearch_text(String search_text);
    List<Laboratory> getLaboratoryByLimit1(int col_id, String lab_name, String lab_id, int statement);
    List<Laboratory> getLaboratoryByLimit2(int col_id,String lab_name,String lab_id);
    List<Laboratory> getLaboratoryByLimit3(String lab_name, String lab_id,int statement);
    List<Laboratory> getLaboratoryByLimit4( String lab_name,String lab_id);
    Laboratory getLaboratoryByLab_id(String lab_id);

    List<Schedule> getSchedulesByLab_id(String lab_id);

    int addReservation(String user_num,int user_type, String lab_name, String lab_addr, String col_name, int reserve_type, String courseName
                        , String schedule_date, String time_interval, String description);

    Reservation containsReserve(String lab_name,String schedule_date,String time_interval,String user_num);
    int cancelReservation(int reserve_id);

    void updateScheduleAddT1(String lab_id,String schedule_date);
    void updateScheduleAddT2(String lab_id,String schedule_date);
    void updateScheduleAddT3(String lab_id,String schedule_date);
    void updateScheduleAddT4(String lab_id,String schedule_date);
    void updateScheduleAddT5(String lab_id,String schedule_date);

    Schedule containsSchedule(String lab_id,String Schedule_date );

    String getCol_nameByCol_id(int col_id);

    void updateScheduleSubT1(String lab_name, String schedule_date);
    void updateScheduleSubT2(String lab_name, String schedule_date);
    void updateScheduleSubT3(String lab_name, String schedule_date);
    void updateScheduleSubT4(String lab_name, String schedule_date);
    void updateScheduleSubT5(String lab_name, String schedule_date);

    List<Laboratory> getLaboratoryByCol_id(int col_id);

    List<Laboratory> getLaboratoryBySearch_textAndCol_id(String search_text, int col_id);

    Laboratory containsLaboratory(String lab_id);

    List<Announcement> getAnnouncementBySearch_textAndCol_id(String search_text, int col_id);

    int removeAnnoById(int id);


    int addLabScheduleList(String[] ids);

    String getLab_nameByLab_id(String lab_id);

    void updateScheduleLab_name(String lab_id, String lab_name);

    void addLabSchedule_mon(String id);

    void del_duplicate_data();

    void addLabSchedule_tue(String id);

    void addLabSchedule_wes(String id);

    void addLabSchedule_thu(String id);

    void addLabSchedule_fri(String id);

    Schedule containSchedule(String id);

    void InputExcel(Map<String, Object> ginsengMap);

    void InputLabExcel(Map<String, Object> ginsengMap);

    void removeScheduleByLab_id(String id);

    List<Admin> getAllMgr();

    List<Admin> getAdminBySearch_text(String search_text);

    int removeAdminByMgr_num(String mgr_num);

    int getCol_idByCol_name(String col_name);

    int addAdmin(String mgr_num, String mgr_name, String col_name, int col_id);

    Admin containsAdmin(String mgr_num);

    int editMgrInfo(String mgr_num, String mgr_name, String col_name, int col_id);

    void InputAdminExcel(Map<String, Object> ginsengMap);

}
