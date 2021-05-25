package com.reservation.controller;

import com.reservation.pojo.*;
import com.reservation.service.PublicService;
import com.reservation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("user")   //表示类中的所有响应请求的方法都是以该地址作为父路径。
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    PublicService publicService;

    //跳转到我的信息页面
    @RequestMapping("/info")
    public String userInfo( HttpSession session){
        return  "userInfo";
    }

    //得到用户的所有预约信息
    @RequestMapping("/reservation")
    public ModelAndView getAllReservation(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
        request.getSession().setAttribute("info","  ");
        return getModelAndView(session);
    }


    //用户登陆后修改密码
    @RequestMapping("/changePassword")
    public ModelAndView changePassword(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        User user = (User) request.getSession().getAttribute("user");
        System.out.println(user);
        String pre_password = request.getParameter("pre_password");
        String new_password = request.getParameter("new_password");
        String re_new_password = request.getParameter("re_new_password");
        String email=request.getParameter("email");
        System.out.println(new_password);
        if(!pre_password.equals(user.getPasswd())){
            request.getSession().setAttribute("change_error","原始密码输入错误，请重新输入");
            mav.setViewName("changePassword");
        }
        if(new_password.equals(re_new_password)) {
            int result=userService.updatePassword(user.getUser_num(),new_password,email);
            if(result==1) {
                mav.setViewName("index");
            }
        }else{
            request.setAttribute("change_error","出现错误，请重新进行密码修改");
            mav.setViewName("changePassword");
        }
        return mav;
    }

    //新建预约
    @RequestMapping("/addReservation")
    public ModelAndView addReservation(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        List<Laboratory> laboratories=publicService.getAllLaboratory();
        mav.addObject("laboratories",laboratories);
        mav.setViewName("addReservation");
        return mav;
    }

    //添加预约
    @RequestMapping("/toCreateReservation")
    public ModelAndView toCreateReservation(@RequestParam("lab_id") String lab_id , HttpSession session,HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        request.getSession().setAttribute("add_info", "    ");
        Laboratory lab=publicService.getLaboratoryByLab_id(lab_id);
        request.getSession().setAttribute("lab", lab);
        mav.addObject("lab",lab);
        List<Reservation> reservations=publicService.getReservationByLab_nameAndReserve_type(lab.getLab_name(),2);
        for(Reservation res:reservations){
            System.out.println(res);
            User user=userService.getUserByNum(res.getUser_num());
            res.setUser_name(user.getUser_name());
        }
        mav.addObject("reservations",reservations);
        List<Schedule> schedules=publicService.getSchedulesByLab_id(lab_id);
        request.getSession().setAttribute("schedules", schedules);
        mav.addObject("schedules",schedules);
        mav.setViewName("createReservation");
        return mav;
    }


    //把用户新建的预约记录保存至数据库     模态框的提示信息暂时不起作用
    @RequestMapping("/submitReservation")
    public ModelAndView submitReservation(@RequestParam("schedule_date") String schedule_date,@RequestParam("time_interval") String time_interval, HttpSession session,HttpServletRequest request,HttpServletResponse response){
        ModelAndView mav=new ModelAndView();
        User user = (User)session.getAttribute("user");
        Laboratory lab=(Laboratory) session.getAttribute("lab");
        String lab_id=lab.getLab_id();
        int reserve_type=1;
        String courseName=request.getParameter("courseName");
        String description=request.getParameter("description");
        int add1=0;
        int add2=0;
        if(user.getUser_type()==2){
            String radio =request.getParameter("reserve_type");
            reserve_type=Integer.parseInt(radio);
        }
        if("0".equals(time_interval)){
            request.getSession().setAttribute("add_info", "请选择您要预约的时间段后点击提交");
            mav.setViewName("createReservation");
            return mav;
        }
        if(reserve_type==2){    //课堂预约
            if(userService.getLabPersonByTime_interval(lab_id,schedule_date,time_interval)!= -1){
//                if(userService.getLabPersonByTime_interval(lab_id,schedule_date,time_interval) != 0){
//                    request.getSession().setAttribute("add_info","该实验室已有个人预约，暂不支持课堂预约，请选择其他时间段进行预约");
//                    mav.setViewName("createReservation");
//                    return mav;
//                }else {
                    if (null != userService.containsReserve(lab.getLab_name(), schedule_date, time_interval, user.getUser_num())) {
                        request.getSession().setAttribute("add_info", "该实验室此时间段您已经预约，请选择其他时间段进行预约");
                        mav.setViewName("createReservation");
                        return mav;
                    } else {
                        add2=userService.addReservation(user.getUser_num(),user.getUser_type(),lab.getLab_name(),lab.getLab_addr(),lab.getCol_name()
                                ,reserve_type,courseName,schedule_date,time_interval,description);
                        if(add2 == 1){
                            System.out.println("开始update");
//                            publicService.updateScheduleAdd_statement(lab_id,schedule_date,time_interval,lab.getLab_capacity());
                            request.getSession().setAttribute("add_info","提交成功");
                            List<Schedule> schedules=publicService.getSchedulesByLab_id(lab_id);
                            request.getSession().setAttribute("schedules", schedules);
                            mav.addObject("schedules",schedules);
                            mav.setViewName("createReservation");
                            return mav;
                        }else{
                            request.getSession().setAttribute("add_info","提交失败，稍后请重试");
                            mav.setViewName("createReservation");
                            return mav;
                        }
                    }
                }
//            }
        }else {
            if (userService.getLabPersonByTime_interval(lab_id, schedule_date, time_interval) != -1) {
                if (lab.getLab_capacity() <= userService.getLabPersonByTime_interval(lab_id, schedule_date, time_interval)) {
                    request.getSession().setAttribute("add_info", "该实验室此时间段已预约满，请选择其他时间段进行预约");
                    mav.setViewName("createReservation");
                    return mav;
                } else {
                    if (null != userService.containsReserve(lab.getLab_name(), schedule_date, time_interval, user.getUser_num())) {
                        request.getSession().setAttribute("add_info", "该实验室此时间段您已经预约，请选择其他时间段进行预约");
                        mav.setViewName("createReservation");
                        return mav;
                    } else {
                        add1 = userService.addReservation(user.getUser_num(),user.getUser_type(), lab.getLab_name(), lab.getLab_addr(), lab.getCol_name()
                                , reserve_type, null, schedule_date, time_interval, description);
                        if (add1 == 1) {
                            System.out.println("开始update");
                            publicService.updateScheduleAdd(lab_id, schedule_date, time_interval);
                            request.getSession().setAttribute("add_info", "提交成功");
                            List<Schedule> schedules=publicService.getSchedulesByLab_id(lab_id);
                            request.getSession().setAttribute("schedules", schedules);
                            mav.addObject("schedules",schedules);
                            mav.setViewName("createReservation");
                            return mav;
                        } else {
                            request.getSession().setAttribute("add_info", "提交失败，稍后请重试");
                            mav.setViewName("createReservation");
                            return mav;
                        }
                    }
                }
            } else {
                request.getSession().setAttribute("add_info", "出现错了，请稍后重新预约");
                mav.setViewName("createReservation");
                return mav;
            }
        }
        request.getSession().setAttribute("add_info", "出现错了，请稍后重新预约");
        mav.setViewName("createReservation");
        return mav;
    }


    //按搜索框内容搜索实验室
    @RequestMapping("/searchLaboratoryBySearch_text")
    public String searchLaboratoryBySearch_text(@RequestParam("search_text") String search_text,HttpSession session,Model model){
        System.out.println("进入search");
        if (null != search_text || search_text.trim().length() != 0 ) {
            List<Laboratory> laboratories = publicService.getLaboratoryLikeSearch_text(search_text);
            model.addAttribute("laboratories", laboratories);
        }else{
            List<Laboratory> laboratories = publicService.getAllLaboratory();
            model.addAttribute("laboratories", laboratories);
        }
        return "addReservation";
    }

    //取消预约
    @RequestMapping("/cancelReservation")
    public ModelAndView cancelReservation(@RequestParam("reserve_id") int reserve_id,@RequestParam("lab_name") String lab_name,@RequestParam("schedule_date") String schedule_date,
                                          @RequestParam("time_interval") String time_interval, @RequestParam("reserve_type") int reserve_type,
                                          HttpSession session,HttpServletRequest request) {
        System.out.println(reserve_id);
        System.out.println(schedule_date);
        System.out.println(time_interval);
        System.out.println(reserve_type);
        int cancel;
            cancel = userService.cancelReservation(reserve_id);
        if(cancel==1) {
            String info = "成功取消";
            request.getSession().setAttribute("info", info);
            if (reserve_type == 1) {
                publicService.updateSchedule(lab_name, schedule_date, time_interval);
            }else{
       //         publicService.updateClassSchedule(lab_name, schedule_date, time_interval);
            }
        } else {
            request.getSession().setAttribute("info", "取消出错");
        }
        return getModelAndView(session);
    }



    private ModelAndView getModelAndView(HttpSession session) {
        User user = (User) session.getAttribute("user");
        ModelAndView mav = new ModelAndView();
        List<Reservation> reservations = userService.getReservationInfoByUserNum(user.getUser_num());
        mav.addObject("reservations",reservations);
        mav.setViewName("userReservation");
        return mav;
    }

    //按条件搜索实验室
    @RequestMapping("/searchLaboratory")
    public String searchLaboratory(@RequestParam("col_id") int col_id, @RequestParam("lab_name") String lab_name,
                                   @RequestParam("lab_id") String lab_id, @RequestParam("statement") int statement,Model model, HttpSession session) {
        System.out.println("进入search");
        if(col_id != 0 || lab_name!=null || lab_id!=null || statement != 0  ){
            List<Laboratory> laboratories=publicService.getLaboratoryByLimit(col_id, lab_name, lab_id, statement);
            for(Laboratory lab:laboratories){
                System.out.println(lab);
            }
            model.addAttribute("laboratories", laboratories);
        }
        else{
            List<Laboratory> laboratories = publicService.getAllLaboratory();
            model.addAttribute("laboratories", laboratories);
        }
        return "addReservation";
    }



    //按学院搜索公告信息
    @RequestMapping("/searchAnnouncement")
    public ModelAndView getAnnouncementByCol(@RequestParam("col_id") int col_id , HttpSession session) {
        ModelAndView mav = new ModelAndView();
        System.out.println(col_id);
        List<Announcement> announcements=publicService.getAnnouncementByCol(col_id);
        mav.addObject("announcements",announcements);
        mav.setViewName("userAnnouncement");
        return mav;
    }


}
