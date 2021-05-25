package com.reservation.mapper;

import com.reservation.pojo.Admin;
import com.reservation.pojo.Laboratory;
import com.reservation.pojo.LoginInfo;
import com.reservation.pojo.User;

import java.util.List;

public interface AdminMapper {

    Admin getByLoginInfo(LoginInfo loginInfo);

    void updateLastLoginTime(String mgr_num);

    Admin getByMgr_num(String mgr_num);
    int updatePasswdByNum(String mgr_num,String new_password,String mgr_email);

    int updateMgrPasswordByNum(String mgr_num, String new_password, String email, String mgr_tele);

    int updateMgr_tele(String mgr_tele,String mgr_num);

    int removeUserByNum(String user_num);

    int addStudent(String user_num, String user_name, int user_type, String sex, String sClass, String col_name, String dept, String col_id);

    int editStudentInfoByUser_num(String user_num, String user_name, String sex, String sClass, String col_name, String dept, String col_id);

    int addTeacher(String user_num, String user_name, int user_type, String sex, String col_name, String dept, String col_id);

    int editTeacherInfoByUser_num(String user_num, String user_name, String sex, String col_name, String dept, String col_id);

    void deleteList(String[] ids);

    int addLaboratory(String lab_id, String lab_name, String lab_addr, String description, String lab_capacity, String mgr_name, String mgr_tel, int col_id, String statement, String mgr_num, String col_name);


    void removeLabList(String[] ids);

    int removeLabByLab_id(String lab_id);

    int EditLabInfo(String lab_id, String lab_name, String lab_addr, String description, String lab_capacity, String mgr_name, String mgr_tele, int col_id, String statement, String mgr_num, String col_name);

    int addAnnouncement(String title, String content, String mgr_name, int col_id);

    void removeAnnoList(int[] ids);


}
