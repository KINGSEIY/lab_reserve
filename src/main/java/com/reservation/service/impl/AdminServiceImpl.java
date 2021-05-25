package com.reservation.service.impl;

import com.github.pagehelper.PageHelper;
import com.reservation.mapper.AdminMapper;
import com.reservation.mapper.PublicMapper;
import com.reservation.mapper.ReservationMapper;
import com.reservation.mapper.UserMapper;
import com.reservation.pojo.*;
import com.reservation.service.AdminService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;

    @Autowired
    private PublicMapper publicMapper;

    @Autowired
    private ReservationMapper reservationMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public Admin verify(LoginInfo loginInfo) {
        if(null == loginInfo.getUser_num() || null == loginInfo.getPasswd()) {
            return null;
        }
        // 传入封装了用户名和密码的LoginInfo对象进行身份验证
        Admin admin = adminMapper.getByLoginInfo(loginInfo);

        if (null != admin) {
            adminMapper.updateLastLoginTime(admin.getMgr_num());
            return admin;
        }
        return null;
    }

    @Override
    public Admin getAdminByNum(String mgr_num) {
        Admin admin=adminMapper.getByMgr_num(mgr_num);
        System.out.println(admin);
        return admin;
    }

    @Override
    public int check(String mgr_num, String mgr_email) {
        Admin admin=adminMapper.getByMgr_num(mgr_num);
        String  mgrEmail=admin.getMgr_email();
        if(mgrEmail==null||("").equals(mgrEmail)){
            return 0;
        }
        else if(mgr_email.equals(mgrEmail)) {
            return 1;
        }else{
            return 0;
        }
    }

    @Override
    public int updatePassword(String mgr_num, String new_password, String mgr_email) {
        return adminMapper.updatePasswdByNum(mgr_num,new_password,mgr_email);
    }

    @Override
    public int updatePassword2(String mgr_num, String new_password, String email, String mgr_tele) {
        return adminMapper.updateMgrPasswordByNum(mgr_num,new_password,email,mgr_tele);
    }

    @Override
    public int updateTele(String mgr_tele,String mgr_num) {
        return adminMapper.updateMgr_tele(mgr_tele,mgr_num);
    }

    @Override
    public List<User> getUserBySearch_textAndUser_type(String search_text, int user_type, int col_id,int page,int size) {
        PageHelper.startPage(page,size);
        return userMapper.getUserBySearch_textAndUser_type(search_text,user_type,col_id);
    }

    @Override
    public int removeUserByNum(String user_num) {
        return adminMapper.removeUserByNum(user_num);
    }

    @Override
    public int addStudent(String user_num, String user_name, int user_type, String sex, String sClass, String col_name, String dept, String col_id) {
        return adminMapper.addStudent(user_num,user_name,user_type,sex,sClass,col_name,dept,col_id);
    }

    @Override
    public int EditStudentInfo(String user_num, String user_name, String sex, String sClass, String col_name, String dept, String col_id) {
        return adminMapper.editStudentInfoByUser_num(user_num,user_name,sex,sClass,col_name,dept,col_id);
    }

    @Override
    public int addTeacher(String user_num, String user_name, int user_type, String sex, String col_name, String dept, String col_id) {
        return adminMapper.addTeacher(user_num,user_name,user_type,sex,col_name,dept,col_id);
    }

    @Override
    public int EditTeacherInfo(String user_num, String user_name, String sex, String col_name, String dept, String col_id) {
        return adminMapper.editTeacherInfoByUser_num(user_num,user_name,sex,col_name,dept,col_id);
    }

    @Override
    public List<Reservation> getReservationByCol_name(String col_name) {
        return reservationMapper.getReservationByCol_name(col_name);
    }

    @Override
    public List<Reservation> getReservationBySearch_textAndCol_name(String search_text, String col_name,int page,int size) {
        PageHelper.startPage(page,size);
        return reservationMapper.getReservationBySearch_textAndCol_name(search_text,col_name);
    }

    @Override
    public int passReserve(int reserve_id) {
        return reservationMapper.passReserve(reserve_id);
    }

    @Override
    public int refuseReserve(int reserve_id) {
        return reservationMapper.refuseReserve(reserve_id);
    }

    @Override
    public List<Reservation> getReservationByLimit(int user_type, int statement, int date_interval, String col_name,int page,int size) {
        if(date_interval==2){
            if(user_type != 0 && statement != 3){
                PageHelper.startPage(page,size);
                return reservationMapper.getReservationByUser_typeAndStatement(user_type, statement,col_name,page,size);
            }else if(user_type != 0 && statement == 3){
                PageHelper.startPage(page,size);
                return reservationMapper.getReservationByUser_type(user_type,col_name,page,size);
            }else if(user_type == 0 && statement != 3) {
                PageHelper.startPage(page,size);
                return reservationMapper.getReservationByStatement(statement,col_name,page,size);
            }else {
                return null;
            }
        }else if(date_interval==0){
            if(user_type != 0 && statement != 3){
                PageHelper.startPage(page,size);
                return reservationMapper.getReservationByUser_typeAndStatementAndLimit_week(user_type, statement,col_name,page,size);
            }else if(user_type != 0 && statement == 3){
                PageHelper.startPage(page,size);
                return reservationMapper.getReservationByUser_typeAndLimit_week(user_type,col_name,page,size);
            }else if(user_type == 0 && statement != 3) {
                PageHelper.startPage(page,size);
                return reservationMapper.getReservationByStatementAndLimit_week(statement,col_name,page,size);
            }else {
                return null;
            }
        }else if(date_interval==1){
            if(user_type != 0 && statement != 3){
                PageHelper.startPage(page,size);
                return reservationMapper.getReservationByUser_typeAndStatementAndLimit_month(user_type, statement,col_name,page,size);
            }else if(user_type != 0 && statement == 3){
                PageHelper.startPage(page,size);
                return reservationMapper.getReservationByUser_typeAndLimit_month(user_type,col_name,page,size);
            }else if(user_type == 0 && statement != 3) {
                PageHelper.startPage(page,size);
                return reservationMapper.getReservationByStatementAndLimit_month(statement,col_name,page,size);
            }else {
                return null;
            }
        }else {
            return null;
        }
    }

    @Override
    public List<Reservation> getReservationByDate_interval(int date_interval,String col_name,int page,int size) {
        if(date_interval==1){
            PageHelper.startPage(page,size);
            return reservationMapper.getReservationByLimit_month(col_name,page,size);
        }else if(date_interval==0){
            PageHelper.startPage(page,size);
            return reservationMapper.getReservationByLimit_week(col_name,page,size);
        }else{
            return null;
        }
    }

    @Override
    public void deleteList(String[] ids) {
        adminMapper.deleteList(ids);
    }

    @Override
    public void deleteReserveList(Integer[] ids) {
        reservationMapper.deleteReserveList(ids);
    }

    @Override
    public void passReserveList(Integer[] ids) {
        reservationMapper.passReserveList(ids);
    }

    @Override
    public void refuseReserveList(Integer[] ids) {
        reservationMapper.refuseReserveList(ids);
    }

    @Override
    public List<Laboratory> getLaboratoryByCol_id(int col_id) {
        return publicMapper.getLaboratoryByCol_id(col_id);
    }

    @Override
    public List<Laboratory> getLaboratoryBySearch_textAndCol_id(String search_text, int col_id,int page,int size) {

        return publicMapper.getLaboratoryBySearch_textAndCol_id(search_text,col_id);
    }

    @Override
    public Laboratory containsLab(String lab_id) {
        return publicMapper.containsLaboratory(lab_id);
    }

    @Override
    public int addLaboratory(String lab_id, String lab_name, String lab_addr, String description, String lab_capacity, String mgr_name, String mgr_tel, int col_id, String statement, String mgr_num, String col_name) {
        return adminMapper.addLaboratory(lab_id, lab_name, lab_addr, description, lab_capacity, mgr_name, mgr_tel, col_id,statement,mgr_num,col_name);
    }

    @Override
    public void removeLabList(String[] ids) {
        adminMapper.removeLabList(ids);
    }

    @Override
    public int removeLabByLab_id(String lab_id) {
        return adminMapper.removeLabByLab_id(lab_id);
    }

    @Override
    public Admin getMgrByMgr_num(String mgr_num) {
        return adminMapper.getByMgr_num(mgr_num);
    }

    @Override
    public String getCol_nameByCol_id(int col_id) {
        return publicMapper.getCol_nameByCol_id(col_id);
    }

    @Override
    public int EditLabInfo(String lab_id, String lab_name, String lab_addr, String description, String lab_capacity, String mgr_name, String mgr_tele, int col_id, String statement, String mgr_num, String col_name) {
        System.out.println("jinru editlab");
        return adminMapper.EditLabInfo(lab_id,lab_name,lab_addr,description,lab_capacity,mgr_name,mgr_tele,col_id,statement,mgr_num,col_name);
    }

    @Override
    public List<Announcement> getAnnouncementByCol_id(int col_id) {
        return publicMapper.getAnnouncementByCol_id(col_id);
    }

    @Override
    public List<Announcement> getAnnouncementBySearch_textAndCol_id(String search_text, int col_id,int page,int size) {
        PageHelper.startPage(page,size);
        return  publicMapper.getAnnouncementBySearch_textAndCol_id(search_text,col_id);
    }

    @Override
    public int removeAnnoById(int id) {
        return publicMapper.removeAnnoById(id);
    }

    @Override
    public int addAnnouncement(String title, String content, String mgr_name, int col_id) {
        return adminMapper.addAnnouncement(title,content,mgr_name,col_id);
    }

    @Override
    public void removeAnnoList(int[] ids) {
        adminMapper.removeAnnoList(ids);
    }

    @Override
    public int addLabScheduleList(String[] ids) {
        Date date = new Date();
        System.out.println("addLabScheduleList");
        for(String id : ids) {
            System.out.println(id);
//            if (publicMapper.containSchedule(id)==null) {
                System.out.println("kkkkkk");
                publicMapper.addLabSchedule_mon(id);
                publicMapper.addLabSchedule_tue(id);
                publicMapper.addLabSchedule_wes(id);
                publicMapper.addLabSchedule_thu(id);
                publicMapper.addLabSchedule_fri(id);

  //          } else {
    //            return 0;
      //      }
        }
        publicMapper.del_duplicate_data();
        return 1;
    }


    @Override
    public void updateScheduleLab_name(String[] ids) {
        for(String lab_id:ids){
            String lab_name=publicMapper.getLab_nameByLab_id(lab_id);
            publicMapper.updateScheduleLab_name(lab_id,lab_name);
        }
    }

    @Override
    public List<User> getUserByCol_idAndUser_typeLimit(@Param("col_id") int col_id, int user_type,int page,int size) {
        PageHelper.startPage(page,size);
        return userMapper.getUserByCol_idAndUser_typeLimit(col_id,user_type);
    }

    @Override
    public List<Reservation> getReservationByCol_nameLimit(String col_name, int page, int size) {
        PageHelper.startPage(page,size);
        return reservationMapper.getReservationByCol_name(col_name);
    }

    @Override
    public List<Laboratory> getLaboratoryByCol_idLimit(int col_id, int page, int size) {
        PageHelper.startPage(page,size);
        return publicMapper.getLaboratoryByCol_id(col_id);
    }

    @Override
    public List<Announcement> getAnnouncementByCol_idLimit(int col_id, int page, int size) {
        PageHelper.startPage(page,size);
        return publicMapper.getAnnouncementByCol_id(col_id);
    }

    @Override
    public List<User> getUserBySearch_textAndUser_typeLimit(String search_text, int user_type, int col_id, int page, int size) {
        PageHelper.startPage(page,size);
        return userMapper.getUserBySearch_textAndUser_type(search_text,user_type,col_id);

    }

    @Override
    public List<Admin> getAdminBySearch_textLimit(String search_text,int page, int size) {
        PageHelper.startPage(page,size);
        return publicMapper.getAdminBySearch_text(search_text);

    }

    @Override
    public void removeReserveByLab_id(String[] ids) {
        for(String id:ids){
            String lab_name=publicMapper.getLab_nameByLab_id(id);
            List<Reservation> reservations=reservationMapper.getReservationByLab_name(lab_name);
            for(Reservation res:reservations){
                reservationMapper.deleteReservationByRes_id(res.getReserve_id());
            }
        }
    }

    @Override
    public void deleteReserveByUser_id(String id) {
        System.out.println("sxs"+id);
        reservationMapper.deleteReservationByUser_num(id);
    }

    @Override
    public void removeScheduleByLab_id(String id) {
        publicMapper.removeScheduleByLab_id(id);
    }


}
