package com.reservation.service.impl;

import com.github.pagehelper.PageHelper;
import com.reservation.mapper.PublicMapper;
import com.reservation.mapper.ReservationMapper;
import com.reservation.pojo.*;
import com.reservation.service.PublicService;
import com.reservation.util.Excel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class PublicServiceImpl implements PublicService {

    @Autowired
    private PublicMapper publicMapper;

    @Autowired
    ReservationMapper reservationMapper;

    @Override
    public String getNotice() {
        return publicMapper.getNotice();
    }

    @Override
    public List<Announcement> getAnnouncement() {
        return publicMapper.getAnnouncement();
    }

    @Override
    public List<Laboratory> getAllLaboratory() {
        return publicMapper.getAllLaboratory();
    }

    @Override
    public List<Laboratory> getLaboratoryLikeSearch_text(String search_text) {
        return publicMapper.getLaboratoryLikeSearch_text(search_text);
    }

    @Override
    public List<Laboratory> getLaboratoryByLimit(int col_id, String lab_name, String lab_id, int statement) {
        System.out.println(col_id+"、"+lab_name+"、"+lab_id+"、"+statement);
        if(col_id !=0 &&  statement!=0 ){
            return publicMapper.getLaboratoryByLimit1(col_id,lab_name,lab_id,statement);
        }
        if(col_id !=0 && statement==0){
            return  publicMapper.getLaboratoryByLimit2(col_id,lab_name,lab_id);
        }
        if(col_id == 0 && statement!=0){
            return publicMapper.getLaboratoryByLimit3(lab_name,lab_id,statement);
        }
        else{
            return publicMapper.getLaboratoryByLimit4(lab_name,lab_id);
        }
    }

    @Override
    public Laboratory getLaboratoryByLab_id(String lab_id) {
        return publicMapper.getLaboratoryByLab_id(lab_id);
    }

    @Override
    public List<Schedule> getSchedulesByLab_id(String lab_id) {
        return publicMapper.getSchedulesByLab_id(lab_id);
    }

    @Override
    public void updateScheduleAdd(String lab_id, String schedule_date, String time_interval) {
        if("T1".equals(time_interval)){
            publicMapper.updateScheduleAddT1(lab_id,schedule_date);
        }else if("T2".equals(time_interval)){
            publicMapper.updateScheduleAddT2(lab_id,schedule_date);
        }else if("T3".equals(time_interval)){
            publicMapper.updateScheduleAddT3(lab_id,schedule_date);
        }else if("T4".equals(time_interval)){
            publicMapper.updateScheduleAddT4(lab_id,schedule_date);
        }else{
            publicMapper.updateScheduleAddT5(lab_id,schedule_date);
        }
    }

//    @Override
//    public void updateScheduleAdd_statement(String lab_id, String schedule_date, String time_interval, int lab_capacity) {
//        if("T1".equals(time_interval)){
//            publicMapper.updateScheduleAdd_statementT1(lab_id,schedule_date,lab_capacity);
//        }else if("T2".equals(time_interval)){
//            publicMapper.updateScheduleAdd_statementT2(lab_id,schedule_date,lab_capacity);
//        }else if("T3".equals(time_interval)){
//            publicMapper.updateScheduleAdd_statementT3(lab_id,schedule_date,lab_capacity);
//        }else if("T4".equals(time_interval)){
//            publicMapper.updateScheduleAdd_statementT4(lab_id,schedule_date,lab_capacity);
//        }else{
//            publicMapper.updateScheduleAdd_statementT5(lab_id,schedule_date,lab_capacity);
//        }
//    }

    @Override
    public void updateSchedule(String lab_name, String schedule_date, String time_interval) {
        if("T1".equals(time_interval)){
            publicMapper.updateScheduleSubT1(lab_name,schedule_date);
        }else if("T2".equals(time_interval)){
            publicMapper.updateScheduleSubT2(lab_name,schedule_date);
        }else if("T3".equals(time_interval)){
            publicMapper.updateScheduleSubT3(lab_name,schedule_date);
        }else if("T4".equals(time_interval)){
            publicMapper.updateScheduleSubT4(lab_name,schedule_date);
        }else{
            publicMapper.updateScheduleSubT5(lab_name,schedule_date);
        }
    }

    @Override
    public List<Reservation> getReservationByLab_nameAndReserve_type(String lab_name,int reserve_type) {
        return  reservationMapper.getReservationByLab_nameAndReserve_type(lab_name,reserve_type);
    }

    @Override
    public String InputExcel(InputStream is, String originalFilename) {
        Map<String,Object> ginsengMap = new HashMap<String,Object>();
        List<ArrayList<Object>> list;
        if (originalFilename.endsWith(".xls")) {
            list = Excel.readExcel2003(is);
        } else {
            list = Excel.readExcel2007(is);
        }
        for (int i=0,j=list.size();i<j;i++){
            List<Object> row = list.get(i);
            ginsengMap.put("user_num", row.get(0).toString());
            ginsengMap.put("user_name", row.get(1).toString());
            ginsengMap.put("user_type", row.get(2).toString());
            ginsengMap.put("sex", row.get(3).toString());
            ginsengMap.put("sClass", row.get(4).toString());
            ginsengMap.put("col_name", row.get(5).toString());
            ginsengMap.put("dept", row.get(6).toString());
            ginsengMap.put("col_id", row.get(7).toString());
            publicMapper.InputExcel(ginsengMap);
        }
        return "01";

    }

//    @Override
//    public void updateClassSchedule(String lab_name, String schedule_date, String time_interval) {
//        if("T1".equals(time_interval)){
//            publicMapper.updateScheduleSub_statementT1(lab_name,schedule_date);
//        }else if("T2".equals(time_interval)){
//            publicMapper.updateScheduleSub_statementT2(lab_name,schedule_date);
//        }else if("T3".equals(time_interval)){
//            publicMapper.updateScheduleSub_statementT3(lab_name,schedule_date);
//        }else if("T4".equals(time_interval)){
//            publicMapper.updateScheduleSub_statementT4(lab_name,schedule_date);
//        }else{
//            publicMapper.updateScheduleSub_statementT5(lab_name,schedule_date);
//        }
//    }


    @Override
    public List<Announcement> getAnnouncementByCol(int col_id) {
        System.out.println("进入searchAnnouncement");
        List<Announcement> announcements=publicMapper.getAnnouncementByCol_id(col_id);
        for(Announcement ano:announcements){
            System.out.println(ano);
        }
        return announcements;
    }

    @Override
    public String InputLabExcel(InputStream is, String originalFilename) {
        Map<String,Object> ginsengMap = new HashMap<String,Object>();
        List<ArrayList<Object>> list;
        if (originalFilename.endsWith(".xls")) {
            list = Excel.readExcel2003(is);
        } else {
            list = Excel.readExcel2007(is);
        }
        for (int i=0,j=list.size();i<j;i++){
            List<Object> row = list.get(i);
            ginsengMap.put("lab_id", row.get(0).toString());
            ginsengMap.put("lab_name", row.get(1).toString());
            ginsengMap.put("lab_addr", row.get(2).toString());
            ginsengMap.put("description", row.get(3).toString());
            ginsengMap.put("lab_capacity", row.get(4).toString());
            ginsengMap.put("mgr_name", row.get(5).toString());
            ginsengMap.put("mgr_tel", row.get(6).toString());
            ginsengMap.put("col_id", row.get(7).toString());
            ginsengMap.put("statement", row.get(8).toString());
            ginsengMap.put("mgr_num", row.get(9).toString());
            ginsengMap.put("col_name", row.get(10).toString());
            publicMapper.InputLabExcel(ginsengMap);
        }
        return "01";

    }

    @Override
    public List<Admin> getAllMgr(int page, int size) {
        PageHelper.startPage(page,size);
        return publicMapper.getAllMgr();
    }

    @Override
    public int removeAdminByMgr_num(String mgr_num) {
        return publicMapper.removeAdminByMgr_num(mgr_num);
    }

    @Override
    public Admin containsAdmin(String mgr_num) {
        return publicMapper.containsAdmin(mgr_num);
    }

    @Override
    public int addAdmin(String mgr_num, String mgr_name, String col_name,int col_id) {
        return publicMapper.addAdmin(mgr_num,mgr_name,col_name,col_id);
    }

    @Override
    public int getCol_idByCol_name(String col_name) {
        return publicMapper.getCol_idByCol_name(col_name);
    }

    @Override
    public int EditMgrInfo(String mgr_num, String mgr_name, String col_name, int col_id) {
        return publicMapper.editMgrInfo(mgr_num,mgr_name,col_name,col_id);
    }

    @Override
    public String InputAdminExcel(InputStream is, String originalFilename) {
        Map<String,Object> ginsengMap = new HashMap<String,Object>();
        List<ArrayList<Object>> list;
        if (originalFilename.endsWith(".xls")) {
            list = Excel.readExcel2003(is);
        } else {
            list = Excel.readExcel2007(is);
        }
        for (int i=0,j=list.size();i<j;i++){
            List<Object> row = list.get(i);
            ginsengMap.put("mgr_num", row.get(0).toString());
            ginsengMap.put("mgr_name", row.get(1).toString());
            ginsengMap.put("col_name", row.get(2).toString());
            ginsengMap.put("col_id", row.get(3).toString());
            publicMapper.InputAdminExcel(ginsengMap);
        }
        return "01";

    }

}
