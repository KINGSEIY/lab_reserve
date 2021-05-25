package com.reservation.service.impl;

import com.github.pagehelper.PageHelper;
import com.reservation.mapper.PublicMapper;
import com.reservation.mapper.ReservationMapper;
import com.reservation.mapper.UserMapper;
import com.reservation.pojo.*;
import com.reservation.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ReservationMapper reservationMapper;

    @Autowired
    private PublicMapper publicMapper;

    @Override
    public User verify(LoginInfo loginInfo) {
        System.out.println("进入verify");
        if (null == loginInfo.getUser_num() || null == loginInfo.getPasswd()) {
            return null;
        }
        // 传入封装了用户名和密码的LoginInfo对象进行身份验证
        User user = userMapper.getByLoginInfo(loginInfo);

        if (null != user) {
            userMapper.updateLastLoginTime(user.getUser_num());
            return user;
        }
        return null;
    }


    @Override
    public boolean update(User user) {
        if (null == user) {
            return false;
        }
        return (userMapper.update(user) == 1) ? true : false;
    }

    @Override
    public List<User> getAllUser(User user) {
        return null;
    }

    @Override
    public boolean delUser(User user) {
        return false;
    }

    @Override
    public boolean addUser(User user) {
        return false;
    }

    @Override
    public User getUserByNum(String user_num) {
        User user=userMapper.getByUserNum(user_num);
        return user;
    }

    @Override
    public List<User> getUserByCollege(String college) {
        return null;
    }

    @Override
    public List<User> getUserByDept(String dept) {
        return null;
    }

    @Override
    public List<User> getUserByType(int user_type) {
        return null;
    }

    @Override
    public int check(String user_num, String email) {
        User user=userMapper.getByUserNum(user_num);
        String  user_email=user.getEmail();
        if(user_email==null||("").equals(user_email)){
            return 0;
        }
        else if(email.equals(user_email)) {
            return 1;
        }else{
            return 0;
        }
    }

    @Override
    public int addAnnouncement(Announcement announcement) {
        return 0;
    }



    @Override
    public int deleteAnnouncement(int publish_id) {
        return 0;
    }

    @Override
    public List<Reservation> getReservationInfoByUserNum(String user_num) {
        if (null == userMapper.contains(user_num)) {
            return null;
        }
        List<Reservation>  reservations= reservationMapper.getReservationByUser_num(user_num);
        int i=0;
        for(Reservation res:reservations){
            res.setId(++i);
        }
        return reservations;
    }


    @Override
    public boolean updateReservation(Reservation reservation) {
        return false;
    }

    @Override
    public int deleteReservation(Reservation reservation) {
        return 1;
    }

    @Override
    public int addReservation(String user_num, int user_type,String lab_name, String lab_addr, String col_name
            , int reserve_type, String courseName, String schedule_date, String time_interval
            , String description) {
        return publicMapper.addReservation(user_num,user_type,lab_name,lab_addr,col_name,reserve_type,courseName,schedule_date,time_interval,description);
    }

    @Override
    public int updatePassword(String user_num,String new_password,String email) {
        return userMapper.updatePasswdByNum(user_num,new_password,email);
    }

    @Override
    public Reservation containsReserve(String lab_name, String schedule_date, String time_interval,String user_num) {
        return publicMapper.containsReserve(lab_name,schedule_date,time_interval,user_num);
    }

    @Override
    public int cancelReservation(int reserve_id) {
        return publicMapper.cancelReservation(reserve_id);
    }

    @Override
    public int getLabPersonByTime_interval(String lab_id,String Schedule_date,String time_interval) {
        System.out.println(lab_id);
        Schedule sche=publicMapper.containsSchedule(lab_id,Schedule_date);
        System.out.println(sche);
        int person;
        if(null != sche){
            if("T1".equals(time_interval)){
                 person=sche.getT1();
            }else if("T2".equals(time_interval)){
                 person=sche.getT2();
            }else if("T3".equals(time_interval)){
                 person=sche.getT3();
            }else if("T4".equals(time_interval)){
                 person=sche.getT4();
            }else{
                 person=sche.getT5();
            }
            return person;
        }
        return -1;
    }

    @Override
    public List<User> getUserByCol_idAndUser_type(@Param("col_id") int col_id, int user_type) {

        return userMapper.getUserByCol_idAndUser_type(col_id,user_type);
    }

    @Override
    public User containsUser(String user_num) {
        return userMapper.contains(user_num);
    }

    @Override
    public void remove_checkedUser(String[] ids) {
        for(String id:ids){
            if(userMapper.contains(id)!=null){
                userMapper.delUserByNum(id);
            }
        }
    }

    @Override
    public List<User> getUserByCol_idAndUser_typeLimit(int col_id, int user_type, int page, int size) {
        PageHelper.startPage(page,size);
        return userMapper.getUserByCol_idAndUser_type(col_id,user_type);

    }

}
