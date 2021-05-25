package com.reservation.service;

import com.reservation.pojo.Announcement;
import com.reservation.pojo.LoginInfo;
import com.reservation.pojo.Reservation;
import com.reservation.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
public interface UserService {
    User verify(LoginInfo loginInfo);
    boolean update(User user);
     List<User> getAllUser(User user);
    boolean delUser(User user);
    boolean addUser(User user);
    User getUserByNum(String user_num);
    List<User> getUserByCollege(String college);
    List<User> getUserByDept(String dept);
    List<User> getUserByType(int user_type);
    int check(String user_num,String email);

    int addAnnouncement(Announcement announcement);
     int deleteAnnouncement(int publish_id);

    List<Reservation> getReservationInfoByUserNum(String user_num);
    boolean updateReservation(Reservation reservation);
    int deleteReservation(Reservation reservation);

    int addReservation(String user_num,int user_type, String lab_name, String lab_addr, String col_name
            , int reserve_type, String courseName, String schedule_date, String time_interval
            , String description);

    int updatePassword(String user_num,String new_password,String email);

    Reservation containsReserve(String lab_name,String schedule_date,String time_interval,String user_num);

    int cancelReservation(int reserve_id);

    int getLabPersonByTime_interval(String lab_id,String Schedule_date,String time_interval);

    List<User> getUserByCol_idAndUser_type(@Param("col_id") int col_id, int user_type);

    User containsUser(String user_num);

    void remove_checkedUser(String[] ids);

    List<User> getUserByCol_idAndUser_typeLimit(int col_id, int i, int page, int size);

}
