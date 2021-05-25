package com.reservation.mapper;

import com.reservation.pojo.Announcement;
import com.reservation.pojo.LoginInfo;
import com.reservation.pojo.User;

import java.util.List;


public interface UserMapper {
    User getByLoginInfo(LoginInfo loginInfo);

    int add(User user);
    int update(User user);
    User getByUserNum(String user_num);
     List<User> getAllUser(User user);
     List<User> getByUserType(int user_type);
     boolean delUserByNum(String user_num);

     int addAnnouncement(Announcement announcement);
     List<Announcement> getAnnouncement();
     int deleteAnnouncement(int publish_id);

     void updateLastLoginTime(String user_num);
     User contains(String user_num);

    int updatePasswdByNum(String user_num,String new_password,String email);

    List<User> getUserByCol_idAndUser_type(int col_id,int user_type);

    List<User> getUserBySearch_textAndUser_type(String search_text ,int user_type,int col_id);

    List<User> getUserByCol_idAndUser_typeLimit(int col_id, int user_type);

    int selectCount(int col_id, int user_type);


}
