package com.reservation.controller;

import com.github.pagehelper.PageInfo;
import com.reservation.pojo.*;
import com.reservation.service.AdminService;
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
import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    PublicService publicService;

    @Autowired
    UserService userService;

    //跳转到我的信息页面
    @RequestMapping("/adminInfo")
    public String adminInfo( HttpSession session){
        return  "adminInfo";
    }

    //跳转到学生列表里界面，显示该管理员所在学院的所有学生的信息
    @RequestMapping("/manage_students")
    public ModelAndView manage_students(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10")int size,HttpSession session, HttpServletRequest request){
        ModelAndView mav=new ModelAndView();
        if(session.getAttribute("admin")!=null){
            Admin admin=(Admin)session.getAttribute("admin");
            int col_id=admin.getCol_id();

            if(col_id!=0) {
                int i=0;
                List<User> students = adminService.getUserByCol_idAndUser_typeLimit(col_id,1,page,size);

                for (User stu : students) {
                    stu.setId(++i);
                }
                PageInfo<User> userPage=new PageInfo<>(students);
                if (!students.isEmpty()) {
                    mav.addObject("userPage",userPage);
                    mav.setViewName("admin_manage_students");
                    return mav;
                } else {
                    request.getSession().setAttribute("info", "  ");
                    request.getSession().setAttribute("add_info", "  ");
                    request.getSession().setAttribute("error","   ");
                    request.getSession().setAttribute("st_info", "暂时无学生，可通过“新增”增加学生");
                    mav.setViewName("admin_manage_students");
                    return mav;
                }
            }else{
                request.getSession().setAttribute("info", "  ");
                request.getSession().setAttribute("st_info","   ");
                request.getSession().setAttribute("add_info", "  ");
                request.getSession().setAttribute("error","出现错误，请退出重新登录！");
                mav.setViewName("adminInfo");
                return mav;
            }
        }else{
            request.getSession().setAttribute("info", "  ");
            request.getSession().setAttribute("st_info","   ");
            request.getSession().setAttribute("add_info", "  ");
            request.getSession().setAttribute("error","未检测到用户，请退出重新登录！");
            mav.setViewName("adminInfo");
            return mav;
        }
    }




    //跳转到教师列表里界面，显示该管理员所在学院的所有教师的信息
    @RequestMapping("/manage_teachers")
    public ModelAndView manage_teachers(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10")int size,HttpSession session, HttpServletRequest request){
        ModelAndView mav=new ModelAndView();
        if(session.getAttribute("admin")!=null){
            Admin admin=(Admin)session.getAttribute("admin");
            int col_id=admin.getCol_id();

            if(col_id!=0) {
                List<User> teachers = adminService.getUserByCol_idAndUser_typeLimit(col_id,2,page,size);
                int i=0;
                for (User tea : teachers) {
                    tea.setId(++i);
                }
                PageInfo<User> userPage=new PageInfo<>(teachers);
                if (!teachers.isEmpty()) {
                    mav.addObject("userPage",userPage);
                    mav.setViewName("admin_manage_teachers");
                    return mav;
                } else {
                    request.getSession().setAttribute("info", "  ");
                    request.getSession().setAttribute("error","   ");
                    request.getSession().setAttribute("add_info", "  ");
                    request.getSession().setAttribute("st_info", "暂时无教师，可通过“新增”增加教师");
                    mav.setViewName("admin_manage_teachers");
                    return mav;
                }
            }else{
                request.getSession().setAttribute("info", "  ");
                request.getSession().setAttribute("st_info","   ");
                request.getSession().setAttribute("add_info", "  ");
                request.getSession().setAttribute("error","出现错误，请退出重新登录！");
                mav.setViewName("adminInfo");
                return mav;
            }
        }else{
            request.getSession().setAttribute("info", "  ");
            request.getSession().setAttribute("st_info","   ");
            request.getSession().setAttribute("add_info", "  ");
            request.getSession().setAttribute("error","未检测到用户，请退出重新登录！");
            mav.setViewName("adminInfo");
            return mav;
        }
    }


    //跳转到预约列表里界面，显示该管理员所在学院的所有预约信息
    @RequestMapping("/manage_reservation")
    public ModelAndView manage_reservation(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10")int size,HttpSession session, HttpServletRequest request){
        ModelAndView mav=new ModelAndView();
        if(session.getAttribute("admin")!=null){
            Admin admin=(Admin)session.getAttribute("admin");
            String col_name=admin.getCol_name();
            System.out.println(col_name);
            if(col_name!=null) {
                List<Reservation> reservation = adminService.getReservationByCol_nameLimit(col_name,page,size);
                int i=0;
                for (Reservation res : reservation) {
                    System.out.println(res.getUser_num());
                    User user=userService.getUserByNum(res.getUser_num());
                    System.out.println(user);
                    res.setId(++i);
                    res.setUser_name(user.getUser_name());
                    res.setDept(user.getDept());
                }
                PageInfo<Reservation> reservationPageInfo=new PageInfo<>(reservation);
                if (!reservation.isEmpty()) {
                    mav.addObject("reservationPageInfo",reservationPageInfo);
                    mav.setViewName("admin_manage_reservations");
                    return mav;
                } else {
                    request.getSession().setAttribute("error","   ");
                    request.getSession().setAttribute("res_info", "暂时无预约信息");
                    mav.setViewName("admin_manage_reservations");
                    return mav;
                }
            }else{
                request.getSession().setAttribute("info", "  ");
                request.getSession().setAttribute("st_info","   ");
                request.getSession().setAttribute("error","出现错误，请退出重新登录！");
                mav.setViewName("adminInfo");
                return mav;
            }
        }else{
            request.getSession().setAttribute("info", "  ");
            request.getSession().setAttribute("st_info","   ");
            request.getSession().setAttribute("error","未检测到用户，请退出重新登录！");
            mav.setViewName("adminInfo");
            return mav;
        }
    }



    //跳转到实验室列表界面，显示该管理员所在学院的所有实验室信息
    @RequestMapping("/manage_laboratory")
    public ModelAndView manage_laboratory(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10")int size,HttpSession session, HttpServletRequest request){
        ModelAndView mav=new ModelAndView();
        if(session.getAttribute("admin")!=null){
            Admin admin=(Admin)session.getAttribute("admin");
            int col_id=admin.getCol_id();

            if(col_id!=0) {
                List<Laboratory> laboratories = adminService.getLaboratoryByCol_idLimit(col_id,page,size);
                int i=0;
                for (Laboratory lab : laboratories) {
                    lab.setId(++i);
                }
                PageInfo<Laboratory> laboratoryPageInfo=new PageInfo<>(laboratories);

                if (!laboratories.isEmpty()) {
                    mav.addObject("laboratoryPageInfo",laboratoryPageInfo);
                    mav.setViewName("admin_manage_laboratory");
                    return mav;
                } else {
                    request.getSession().setAttribute("error","   ");
                    request.getSession().setAttribute("lab_info", "暂无实验室信息");
                    request.getSession().setAttribute("add_lab_info", "   ");
                    mav.setViewName("admin_manage_laboratory");
                    return mav;
                }
            }else{
                request.getSession().setAttribute("info", "  ");
                request.getSession().setAttribute("lab_info","   ");
                request.getSession().setAttribute("add_lab_info", "   ");
                request.getSession().setAttribute("error","出现错误，请退出重新登录！");
                mav.setViewName("adminInfo");
                return mav;
            }
        }else{
            request.getSession().setAttribute("info", "  ");
            request.getSession().setAttribute("lab_info","   ");
            request.getSession().setAttribute("add_lab_info", "   ");
            request.getSession().setAttribute("error","未检测到用户，请退出重新登录！");
            mav.setViewName("adminInfo");
            return mav;
        }
    }


    //跳转到公告列表界面，显示该管理员所在学院的所有公告信息
    @RequestMapping("/manage_announcement")
    public ModelAndView manage_announcement(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "6")int size,HttpSession session, HttpServletRequest request){
        ModelAndView mav=new ModelAndView();
        if(session.getAttribute("admin")!=null){
            Admin admin=(Admin)session.getAttribute("admin");
            int col_id=admin.getCol_id();
            if(col_id!=0) {
                List<Announcement> announcements = adminService.getAnnouncementByCol_idLimit(col_id,page,size);
                PageInfo<Announcement> announcementPageInfo=new PageInfo<>(announcements);

                if (!announcements.isEmpty()) {
                    request.getSession().setAttribute("error","   ");
                    request.getSession().setAttribute("anno_info", "    ");
                    request.getSession().setAttribute("info", "    ");
                    mav.addObject("announcementPageInfo",announcementPageInfo);
                    mav.setViewName("admin_manage_announcement");
                    return mav;
                } else {
                    request.getSession().setAttribute("error","   ");
                    request.getSession().setAttribute("info", "    ");
                    request.getSession().setAttribute("anno_info", "暂无公告信息");
                    mav.setViewName("admin_manage_announcement");
                    return mav;
                }
            }else{
                request.getSession().setAttribute("anno_info","   ");
                request.getSession().setAttribute("info", "    ");
                request.getSession().setAttribute("error","出现错误，请退出重新登录！");
                mav.setViewName("adminInfo");
                return mav;
            }
        }else{
            request.getSession().setAttribute("anno_info","   ");
            request.getSession().setAttribute("info", "    ");
            request.getSession().setAttribute("error","未检测到用户，请退出重新登录！");
            mav.setViewName("adminInfo");
            return mav;
        }
    }



    //返回所有公告列表
    @RequestMapping("/tomanage_announcements")
    public ModelAndView tomanage_announcements( HttpSession session,HttpServletRequest request) {
        request.getSession().setAttribute("error", "  ");
        request.getSession().setAttribute("anno_info","   ");
        request.getSession().setAttribute("info","   ");

        return manage_announcement(1,6,session,request);
    }


    //跳转到添加实验室页面
    @RequestMapping("/addLaboratory")
    public ModelAndView addLaboratory( HttpSession session){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("admin_addLaboratory");
        return mav;
    }


    //跳转到添加公告页面
    @RequestMapping("/addAnnouncement")
    public ModelAndView addAnnouncement( HttpSession session){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("admin_addAnnouncement");
        return mav;
    }

    //返回所有学生列表
    @RequestMapping("/tomanage_students")
    public ModelAndView tomanage_students( HttpSession session,HttpServletRequest request) {
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("st_info","   ");
            request.getSession().setAttribute("info","    ");
        request.getSession().setAttribute("add_info", "  ");

        return manage_students(1,10,session,request);
    }


    //返回所有教师列表
    @RequestMapping("/tomanage_teachers")
    public ModelAndView tomanage_teachers( HttpSession session,HttpServletRequest request) {
        request.getSession().setAttribute("error", "  ");
        request.getSession().setAttribute("st_info","   ");
        request.getSession().setAttribute("info","    ");
        request.getSession().setAttribute("add_info", "  ");

        return manage_teachers(1,10,session,request);
    }

    //返回所有预约列表
    @RequestMapping("/tomanage_reservations")
    public ModelAndView tomanage_reservations( HttpSession session,HttpServletRequest request) {
        request.getSession().setAttribute("error", "  ");
        request.getSession().setAttribute("res_info","   ");

        return manage_reservation(1,10,session,request);
    }


    //返回所有实验室列表
    @RequestMapping("/tomanage_laboratories")
    public ModelAndView tomanage_laboratories( HttpSession session,HttpServletRequest request) {
        request.getSession().setAttribute("error", "  ");
        request.getSession().setAttribute("lab_info","   ");
        request.getSession().setAttribute("add_lab_info", "   ");

        return manage_laboratory(1,10,session,request);
    }

    //管理员登录后修改密码
    @RequestMapping("/changePassword")
    public ModelAndView changePassword(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        String pre_password = request.getParameter("pre_password");
        String new_password = request.getParameter("new_password");
        String re_new_password = request.getParameter("re_new_password");
        String email=request.getParameter("email");
        String mgr_tele=request.getParameter("tele");
        if(!pre_password.equals(admin.getPasswd())){
            request.getSession().setAttribute("change_erro","原始密码输入错误，请重新输入");
            mav.setViewName("changeAdminPassword");
            return mav;
        }
        if(new_password.equals(re_new_password)) {
            int result=adminService.updatePassword2(admin.getMgr_num(),new_password,email,mgr_tele);
            if(result==1) {
                mav.setViewName("index");
                return mav;
            } else {
                request.setAttribute("change_erro", "出现错误，请重新进行密码修改");
                mav.setViewName("changeAdminPassword");
                return mav;
            }
        }else{
            request.setAttribute("change_erro","出现错误，请重新进行密码修改");
            mav.setViewName("changeAdminPassword");
            return mav;
        }
    }


    //管理员登陆后修改联系方式
    @RequestMapping("/changeTele")
    public ModelAndView changeTele(HttpSession session,HttpServletRequest request){
        ModelAndView mav=new ModelAndView();
        Admin admin=(Admin) session.getAttribute("admin");
        String mgr_num=admin.getMgr_num();
        String mgr_tele=request.getParameter("mgr_tele");
        if(mgr_tele==null || "".equals(mgr_tele)){
            request.setAttribute("tele_erro", "联系电话为空，请输入联系电话后提交");
        }else{
            if(adminService.updateTele(mgr_tele,mgr_num)==1){
                request.setAttribute("tele_erro", "联系电话修改成功");
                admin=adminService.getAdminByNum(admin.getMgr_num());
                request.getSession().setAttribute("admin", admin);
            }else{
                request.setAttribute("tele_erro", "修改联系方式出错，请重新进行修改");
            }
        }
        mav.setViewName("adminInfo");
        return mav;
    }

    //按搜索框内容搜索学生
    @RequestMapping("/searchUserBySearch_text")
    public String searchUserBySearch_text(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10")int size,@RequestParam("search_text") String search_text, HttpSession session, Model model,HttpServletRequest request){
        Admin admin=(Admin)session.getAttribute("admin");
        int col_id=admin.getCol_id();
        if (null != search_text || search_text.trim().length() != 0 ) {
            if(col_id!=0) {
                List<User> students = adminService.getUserBySearch_textAndUser_typeLimit(search_text, 1 ,col_id,page,size);
                int i=1;
                for (User stu : students) {
                    stu.setId(i++);
                }
                PageInfo<User> userPage=new PageInfo<>(students);
                if (!students.isEmpty()) {
                    model.addAttribute("userPage", userPage);
                    request.getSession().setAttribute("st_info", "  ");
                    request.getSession().setAttribute("error","   ");
                } else {
                    request.getSession().setAttribute("info", "  ");
                    request.getSession().setAttribute("error","   ");
                    request.getSession().setAttribute("st_info", "暂时无学生，可通过“新增”增加学生");
                }
            }else{
                request.getSession().setAttribute("info", "  ");
                request.getSession().setAttribute("st_info","   ");
                request.getSession().setAttribute("error","出现错误，请重新搜索！");
            }
        }else{
            if(session.getAttribute("admin")!=null){
                if(col_id!=0) {
                    List<User> students = userService.getUserByCol_idAndUser_typeLimit(col_id,1,page,size);
                    int i=0;
                    for (User stu : students) {
                        stu.setId(++i);
                    }
                    PageInfo<User> userPage=new PageInfo<>(students);
                    if (!students.isEmpty()) {
                        model.addAttribute("userPage", userPage);
                        request.getSession().setAttribute("info", "  ");
                        request.getSession().setAttribute("st_info","   ");
                        request.getSession().setAttribute("error","   ");
                    } else {
                        request.getSession().setAttribute("info", "  ");
                        request.getSession().setAttribute("error","   ");
                        request.getSession().setAttribute("st_info", "暂时无学生，可通过“新增”增加学生");
                    }
                }else{
                    request.getSession().setAttribute("info", "  ");
                    request.getSession().setAttribute("st_info","   ");
                    request.getSession().setAttribute("error","出现错误，请重新搜索！");
                }
            }else{
                request.getSession().setAttribute("info", "  ");
                request.getSession().setAttribute("st_info","   ");
                request.getSession().setAttribute("error","未检测到用户，请退出重新登录！");
            }
        }
        return "admin_manage_students";
    }

    //按搜索框内容搜索教师
    @RequestMapping("/searchTeacherBySearch_text")
    public String searchTeacherBySearch_text(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10")int size,@RequestParam("search_text") String search_text, HttpSession session, Model model,HttpServletRequest request){
        Admin admin=(Admin)session.getAttribute("admin");
        int col_id=admin.getCol_id();
        if (null != search_text || search_text.trim().length() != 0 ) {
            if(col_id!=0) {
                List<User> teachers = adminService.getUserBySearch_textAndUser_type(search_text, 2 ,col_id,page,size);
                int i=1;
                for (User tea : teachers) {
                    tea.setId(i++);
                }
                PageInfo<User> userPage=new PageInfo<>(teachers);

                if (!teachers.isEmpty()) {
                    model.addAttribute("userPage", userPage);
                    request.getSession().setAttribute("st_info", "  ");
                    request.getSession().setAttribute("error","   ");
                } else {
                    request.getSession().setAttribute("info", "  ");
                    request.getSession().setAttribute("error","   ");
                    request.getSession().setAttribute("st_info", "暂时无教师，可通过“新增”增加教师");
                }
            }else{
                request.getSession().setAttribute("info", "  ");
                request.getSession().setAttribute("st_info","   ");
                request.getSession().setAttribute("error","出现错误，请重新搜索！");
            }
        }else{
            if(session.getAttribute("admin")!=null){
                if(col_id!=0) {
                    List<User> teachers = userService.getUserByCol_idAndUser_typeLimit(col_id,2,page,size);
                    int i=0;
                    for (User tea : teachers) {
                        tea.setId(++i);
                    }
                    PageInfo<User> userPage=new PageInfo<>(teachers);
                    if (!teachers.isEmpty()) {
                        model.addAttribute("userPage", userPage);
                        request.getSession().setAttribute("info", "  ");
                        request.getSession().setAttribute("st_info","   ");
                        request.getSession().setAttribute("error","   ");
                    } else {
                        request.getSession().setAttribute("info", "  ");
                        request.getSession().setAttribute("error","   ");
                        request.getSession().setAttribute("st_info", "暂时无教师，可通过“新增”增加教师");
                    }
                }else{
                    request.getSession().setAttribute("info", "  ");
                    request.getSession().setAttribute("st_info","   ");
                    request.getSession().setAttribute("error","出现错误，请重新搜索！");
                }
            }else{
                request.getSession().setAttribute("info", "  ");
                request.getSession().setAttribute("st_info","   ");
                request.getSession().setAttribute("error","未检测到用户，请退出重新登录！");
            }
        }
        return "admin_manage_teachers";
    }


    //按搜索框内容搜索预约信息
    @RequestMapping("/searchReservationBySearch_text")
    public String searchReservationBySearch_text(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10")int size,@RequestParam("search_text") String search_text, HttpSession session, Model model,HttpServletRequest request){
        Admin admin=(Admin)session.getAttribute("admin");
        String col_name=admin.getCol_name();
        if (null != search_text || search_text.trim().length() != 0 ) {
            if(col_name!=null) {
                List<Reservation> reservation = adminService.getReservationBySearch_textAndCol_name(search_text,col_name,page,size);
                int i=1;
                for (Reservation res : reservation) {
                    User user=userService.getUserByNum(res.getUser_num());
                    res.setId(++i);
                    res.setUser_name(user.getUser_name());
                    res.setDept(user.getDept());
                    System.out.println(res);
                }
                PageInfo<Reservation> reservationPageInfo=new PageInfo<>(reservation);
                if (!reservation.isEmpty()) {
                    model.addAttribute("reservationPageInfo", reservationPageInfo);
                    request.getSession().setAttribute("res_info", "  ");
                    request.getSession().setAttribute("error","   ");
                } else {
                    request.getSession().setAttribute("error","   ");
                    request.getSession().setAttribute("res_info", "暂时无预约");
                }
            }else{
                request.getSession().setAttribute("res_info","   ");
                request.getSession().setAttribute("error","出现错误，请重新搜索！");
            }
        }else{
            if(session.getAttribute("admin")!=null){
                if(col_name!=null) {
                    List<Reservation> reservation = adminService.getReservationByCol_nameLimit(col_name,page,size);
                    int i=1;
                    for (Reservation res : reservation) {
                        User user=userService.getUserByNum(res.getUser_num());
                        res.setId(++i);
                        res.setUser_name(user.getUser_name());
                        res.setDept(user.getDept());
                    }
                    PageInfo<Reservation> reservationPageInfo=new PageInfo<>(reservation);
                    if (!reservation.isEmpty()) {
                        model.addAttribute("reservationPageInfo", reservationPageInfo);
                        request.getSession().setAttribute("res_info","   ");
                        request.getSession().setAttribute("error","   ");
                    } else {
                        request.getSession().setAttribute("error","   ");
                        request.getSession().setAttribute("res_info", "暂时无预约");
                    }
                }else{
                    request.getSession().setAttribute("res_info","   ");
                    request.getSession().setAttribute("error","出现错误，请重新搜索！");
                }
            }else{
                request.getSession().setAttribute("res_info","   ");
                request.getSession().setAttribute("error","未检测到用户，请退出重新登录！");
            }
        }
        return "admin_manage_reservations";
    }


    //按搜索框内容搜索实验室信息
    @RequestMapping("/searchLaboratoryBySearch_text")
    public String searchLaboratoryBySearch_text(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10")int size,@RequestParam("search_text") String search_text, HttpSession session, Model model,HttpServletRequest request){
        Admin admin=(Admin)session.getAttribute("admin");
        int col_id =admin.getCol_id();
        if (null != search_text || search_text.trim().length() != 0 ) {
            if(col_id!=0) {
                List<Laboratory> laboratories = adminService.getLaboratoryBySearch_textAndCol_id(search_text,col_id,page,size);
                int i=1;
                for (Laboratory lab : laboratories) {
                    lab.setId(++i);
                    System.out.println(lab);
                }
                PageInfo<Laboratory> laboratoryPageInfo=new PageInfo<>(laboratories);
                if (!laboratories.isEmpty()) {
                    model.addAttribute("laboratoryPageInfo", laboratoryPageInfo);
                    request.getSession().setAttribute("lab_info", "  ");
                    request.getSession().setAttribute("error","   ");
                } else {
                    request.getSession().setAttribute("error","   ");
                    request.getSession().setAttribute("lab_info", "暂无实验室信息");
                }
            }else{
                request.getSession().setAttribute("lab_info","   ");
                request.getSession().setAttribute("error","出现错误，请重新搜索！");
            }
        }else{
            if(session.getAttribute("admin")!=null){
                if(col_id!=0) {
                    List<Laboratory> laboratories = adminService.getLaboratoryByCol_idLimit(col_id,page,size);
                    int i=1;
                    for (Laboratory lab : laboratories) {
                        lab.setId(++i);
                    }
                    PageInfo<Laboratory> laboratoryPageInfo=new PageInfo<>(laboratories);
                    if (!laboratories.isEmpty()) {
                        model.addAttribute("laboratoryPageInfo", laboratoryPageInfo);
                        request.getSession().setAttribute("lab_info","   ");
                        request.getSession().setAttribute("error","   ");
                    } else {
                        request.getSession().setAttribute("error","   ");
                        request.getSession().setAttribute("lab_info", "暂无实验室信息");
                    }
                }else{
                    request.getSession().setAttribute("lab_info","   ");
                    request.getSession().setAttribute("error","出现错误，请重新搜索！");
                }
            }else{
                request.getSession().setAttribute("lab_info","   ");
                request.getSession().setAttribute("error","未检测到用户，请退出重新登录！");
            }
        }
        return "admin_manage_laboratory";
    }



    //按搜索框内容搜索公告信息
    @RequestMapping("/searchAnnouncementBySearch_text")
    public String searchAnnouncementBySearch_text(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "6")int size,@RequestParam("search_text") String search_text, HttpSession session, Model model,HttpServletRequest request){
        Admin admin=(Admin)session.getAttribute("admin");
        int col_id =admin.getCol_id();
        if (null != search_text || search_text.trim().length() != 0 ) {
            if(col_id!=0) {
                List<Announcement> announcements = adminService.getAnnouncementBySearch_textAndCol_id(search_text,col_id,page,size);
                PageInfo<Announcement> announcementPageInfo=new PageInfo<>(announcements);
                if (!announcements.isEmpty()) {
                    model.addAttribute("announcementPageInfo", announcementPageInfo);
                    request.getSession().setAttribute("anno_info", "  ");
                    request.getSession().setAttribute("error","   ");
                } else {
                    request.getSession().setAttribute("error","   ");
                    request.getSession().setAttribute("anno_info", "暂无公告信息");
                }
            }else{
                request.getSession().setAttribute("anno_info","   ");
                request.getSession().setAttribute("error","出现错误，请重新搜索！");
            }
        }else{
            if(session.getAttribute("admin")!=null){
                if(col_id!=0) {
                    List<Announcement> announcements = adminService.getAnnouncementByCol_idLimit(col_id,page,size);
                    PageInfo<Announcement> announcementPageInfo=new PageInfo<>(announcements);
                    if (!announcements.isEmpty()) {
                        model.addAttribute("announcementPageInfo", announcements);
                        request.getSession().setAttribute("anno_info","   ");
                        request.getSession().setAttribute("error","   ");
                    } else {
                        request.getSession().setAttribute("error","   ");
                        request.getSession().setAttribute("anno_info", "暂无公告信息");
                    }
                }else{
                    request.getSession().setAttribute("anno_info","   ");
                    request.getSession().setAttribute("error","出现错误，请重新搜索！");
                }
            }else{
                request.getSession().setAttribute("anno_info","   ");
                request.getSession().setAttribute("error","未检测到用户，请退出重新登录！");
            }
        }
        return "admin_manage_announcement";
    }


    //移除用户
    @RequestMapping("/removeUser")
    public ModelAndView removeUser(@RequestParam("user_num") String user_num, HttpSession session,HttpServletRequest request) {
        User user=userService.getUserByNum(user_num);
        adminService.deleteReserveByUser_id(user_num);
        int remove = adminService.removeUserByNum(user_num);
        if (remove == 1) {
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("st_info", "   ");
            request.getSession().setAttribute("info", "成功移除用户");
        } else {
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("st_info", "   ");
            request.getSession().setAttribute("info", "移除失败，请重新移除");
        }
        if (user.getUser_type()==1) {
            return manage_students(1,10,session, request);
        }else{
            return manage_teachers(1,10,session, request);
        }
    }

    //移除实验室
    @RequestMapping("/removeLab")
    public ModelAndView removeLab(@RequestParam("lab_id") String lab_id, HttpSession session,HttpServletRequest request) {
        adminService.deleteReserveByUser_id(lab_id);
        adminService.removeScheduleByLab_id(lab_id);
        int remove = adminService.removeLabByLab_id(lab_id);
        if (remove == 1) {
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("lab_info", "   ");
            request.getSession().setAttribute("info", "成功移除实验室");
        } else {
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("lab_info", "   ");
            request.getSession().setAttribute("info", "移除失败，请重新移除");
        }
        return manage_laboratory(1,10,session, request);
    }


    //移除用户
    @RequestMapping("/removeAnnouncement")
    public ModelAndView removeAnnouncement(@RequestParam("id") int id, HttpSession session,HttpServletRequest request) {
        int remove = adminService.removeAnnoById(id);
        if (remove == 1) {
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("anno_info", "   ");
            request.getSession().setAttribute("info", "成功移除实验室");
        } else {
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("anno_info", "   ");
            request.getSession().setAttribute("info", "移除失败，请重新移除");
        }
        return manage_announcement(1,6,session, request);
    }


    //添加学生
    @RequestMapping("/AddStudent")
    public ModelAndView AddStudent( HttpSession session,HttpServletRequest request) {
        System.out.println("jinru add ");
        String user_num=request.getParameter("user_num");
        String user_name=request.getParameter("user_name");
        String sex=request.getParameter("sex");
        String col_name=request.getParameter("col_name");
        String dept=request.getParameter("dept");
        String sClass=request.getParameter("sClass");
        String col_id=request.getParameter("col_id");
        int user_type=1;
        int add=0;
        if(userService.containsUser(user_num)==null) {
            add = adminService.addStudent(user_num, user_name, user_type, sex, sClass, col_name, dept, col_id);
            System.out.println(add);
            if (add == 1) {
                request.getSession().setAttribute("error", "  ");
                request.getSession().setAttribute("st_info", "   ");
                request.getSession().setAttribute("info", "成功添加用户");
            } else {
                request.getSession().setAttribute("error", "  ");
                request.getSession().setAttribute("st_info", "   ");
                request.getSession().setAttribute("info", "添加失败，请重新添加");
            }
        }else{
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("st_info", "   ");
            request.getSession().setAttribute("info", "该用户已存在");
        }
        return manage_students(1,10,session,request);
    }


    //添加教师
    @RequestMapping("/AddTeacher")
    public ModelAndView AddTeacher( HttpSession session,HttpServletRequest request) {
        String user_num=request.getParameter("user_num");
        String user_name=request.getParameter("user_name");
        String sex=request.getParameter("sex");
        String col_name=request.getParameter("col_name");
        String dept=request.getParameter("dept");
        String col_id=request.getParameter("col_id");
        int user_type=2;
        int add=0;

        if(userService.containsUser(user_num)==null) {
            add = adminService.addTeacher(user_num, user_name, user_type, sex, col_name, dept, col_id);
            if (add == 1) {
                request.getSession().setAttribute("error", "  ");
                request.getSession().setAttribute("st_info", "   ");
                request.getSession().setAttribute("info", "成功添加用户");
            } else {
                request.getSession().setAttribute("error", "  ");
                request.getSession().setAttribute("st_info", "   ");
                request.getSession().setAttribute("info", "添加失败，请重新添加");
            }
        }
        else{
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("st_info", "   ");
            request.getSession().setAttribute("info", "该用户已存在");
        }
        return manage_teachers(1,10,session,request);
    }


    //添加实验室
    @RequestMapping("/AddLaboratory")
    public ModelAndView addLaboratory( HttpSession session,HttpServletRequest request) {
        String lab_name=request.getParameter("lab_name");
        String lab_id=request.getParameter("lab_id");
        String lab_addr=request.getParameter("lab_addr");
        String description=request.getParameter("description");
        String lab_capacity=request.getParameter("lab_capacity");
        String statement=request.getParameter("statement");
        Admin admin=(Admin)session.getAttribute("admin");
        String mgr_name=admin.getMgr_name();
        String mgr_tel=admin.getMgr_tele();
        String mgr_num=admin.getMgr_num();
        String col_name=admin.getCol_name();
        int col_id=admin.getCol_id();

        if(adminService.containsLab(lab_id)==null) {
            int add = adminService.addLaboratory(lab_id, lab_name, lab_addr, description, lab_capacity, mgr_name, mgr_tel, col_id,statement,mgr_num,col_name);
            if (add == 1) {
                request.getSession().setAttribute("lab_info", "成功添加实验室");
                return manage_laboratory(1,10,session,request);
            } else {
                request.getSession().setAttribute("add_info", "添加失败，请重新添加");
                ModelAndView mav=new ModelAndView();
                mav.setViewName("admin_addLaboratory");
                return mav;
            }
        }else{
            request.getSession().setAttribute("add_info", "该实验室已存在");
            ModelAndView mav=new ModelAndView();
            mav.setViewName("admin_addLaboratory");
            return mav;
        }
    }


    //添加公告
    @RequestMapping("/AddAnnouncement")
    public ModelAndView addAnnouncement( HttpSession session,HttpServletRequest request) {
        String title=request.getParameter("title");
        String content=request.getParameter("content");
        Admin admin=(Admin)session.getAttribute("admin");
        String mgr_name=admin.getMgr_name();
        int col_id=admin.getCol_id();

            int add = adminService.addAnnouncement(title,content,mgr_name,col_id);
            if (add == 1) {
                request.getSession().setAttribute("anno_info", "成功发布公告");
                return manage_announcement(1,6,session,request);
            } else {
                request.getSession().setAttribute("anno_info", "发布失败，请重新发布");
                ModelAndView mav=new ModelAndView();
                mav.setViewName("admin_addAnnouncement");
                return mav;
            }
    }



    //修改学生信息
    @RequestMapping("/EditStudentInfo")
    public ModelAndView EditStudentInfo( HttpSession session,HttpServletRequest request) {
        System.out.println("jinru edit ");
        String user_num=request.getParameter("usernum");
        String user_name=request.getParameter("username");
        String sex=request.getParameter("usersex");
        String col_name=request.getParameter("colname");
        String dept=request.getParameter("userdept");
        String sClass=request.getParameter("usersClass");
        String col_id=request.getParameter("usersCol_id");
//        int col_id_int=Integer.parseInt(col_id);
        int edit=adminService.EditStudentInfo(user_num,user_name,sex,sClass,col_name,dept,col_id);
        if(edit==1){
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("st_info","   ");
            request.getSession().setAttribute("info","成功修改用户信息");
        }else{
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("st_info","   ");
            request.getSession().setAttribute("info","用户信息修改失败，请重新操作");
        }
        return manage_students(1,10,session,request);
    }

    //修改教师信息
    @RequestMapping("/EditTeacherInfo")
    public ModelAndView EditTeacherInfo( HttpSession session,HttpServletRequest request) {
        String user_num=request.getParameter("usernum");
        String user_name=request.getParameter("username");
        String sex=request.getParameter("usersex");
        String col_name=request.getParameter("colname");
        String dept=request.getParameter("userdept");
        String col_id=request.getParameter("usersCol_id");
        System.out.println("开始edit teacher");
        int edit=adminService.EditTeacherInfo(user_num,user_name,sex,col_name,dept,col_id);
        if(edit==1){
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("st_info","   ");
            request.getSession().setAttribute("info","成功修改用户信息");
        }else{
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("st_info","   ");
            request.getSession().setAttribute("info","用户信息修改失败，请重新操作");
        }
        return manage_teachers(1,10,session,request);
    }


    //修改实验室信息
    @RequestMapping("/EditLabInfo")
    public ModelAndView EditLabInfo( HttpSession session,HttpServletRequest request) {
        String lab_name=request.getParameter("lab_name");
        String lab_id=request.getParameter("lab_id");
        String lab_addr=request.getParameter("lab_addr");
        String description=request.getParameter("description");
        String lab_capacity=request.getParameter("lab_capacity");
        String statement=request.getParameter("statement");
        String mgr_num=request.getParameter("mgr_num");
        int col_id=Integer.parseInt( request.getParameter("col_id") );
        Admin mgr=adminService.getMgrByMgr_num(mgr_num);
        String col_name=adminService.getCol_nameByCol_id(col_id);
        int edit=adminService.EditLabInfo(lab_id,lab_name,lab_addr,description,lab_capacity,mgr.getMgr_name(),mgr.getMgr_tele(),col_id,statement,mgr_num,col_name);
        if(edit==1){
            request.getSession().setAttribute("info","成功修改实验室信息");
        }else{
            request.getSession().setAttribute("info","实验室信息修改失败，请重新操作");
        }
        return manage_laboratory(1,10,session,request);
    }



    //通过用户预约
    @RequestMapping("/passReserve")
    public ModelAndView passReserve(@RequestParam("reserve_id") int reserve_id,HttpSession session,HttpServletRequest request) {
        int edit=adminService.passReserve(reserve_id);
        if(edit==1){
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("st_info","   ");
            request.getSession().setAttribute("info","通过用户预约成功");
        }else{
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("st_info","   ");
            request.getSession().setAttribute("info","操作失败，请重新操作");
        }
        return manage_reservation(1,10,session,request);
    }


    //拒绝用户预约
    @RequestMapping("/refuseReserve")
    public ModelAndView refuseReserve(@RequestParam("reserve_id") int reserve_id,HttpSession session,HttpServletRequest request) {
        int edit=adminService.refuseReserve(reserve_id);
        if(edit==1){
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("st_info","   ");
            request.getSession().setAttribute("info","拒绝用户预约成功");
        }else{
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("st_info","   ");
            request.getSession().setAttribute("info","操作失败，请重新操作");
        }
        return manage_reservation(1,10,session,request);
    }


    //按条件搜索预约信息
    @RequestMapping("/searchReservationByLimit")
    public String searchReservationByLimit(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10")int size,@RequestParam("user_type") int user_type, @RequestParam("statement") int statement,
                                    @RequestParam("date_interval") int date_interval,Model model, HttpSession session,HttpServletRequest request) {
        Admin admin=(Admin)session.getAttribute("admin");
        String col_name=admin.getCol_name();
        if(user_type != 0 || statement!=3 ){
            request.getSession().setAttribute("res_info", "   ");
            List<Reservation> reservation=adminService.getReservationByLimit(user_type, statement, date_interval,col_name,page,size);
            int i=0;
            for (Reservation res : reservation) {
                User user=userService.getUserByNum(res.getUser_num());
                res.setId(++i);
                res.setUser_name(user.getUser_name());
                res.setDept(user.getDept());
            }
            PageInfo<Reservation> reservationPageInfo=new PageInfo<>(reservation);
            if (!reservation.isEmpty()) {
                model.addAttribute("reservationPageInfo", reservationPageInfo);
            } else {
                request.getSession().setAttribute("res_info", "暂时无预约信息");
            }
        }
        else if(date_interval==2){
           if(col_name!=null) {
               request.getSession().setAttribute("res_info", "   ");
           List<Reservation> reservation = adminService.getReservationByCol_nameLimit(col_name,page,size);
           int i=0;
           for (Reservation res : reservation) {
               User user=userService.getUserByNum(res.getUser_num());
               res.setId(++i);
               res.setUser_name(user.getUser_name());
               res.setDept(user.getDept());
           }
               PageInfo<Reservation> reservationPageInfo=new PageInfo<>(reservation);
               if (!reservation.isEmpty()) {
               model.addAttribute("reservationPageInfo", reservationPageInfo);
           } else {
               request.getSession().setAttribute("res_info", "暂时无预约信息");
           }
           }else{
               request.getSession().setAttribute("res_info","   ");
               request.getSession().setAttribute("error","出现错误，请退出重新登录！");
           }
        }else{
            request.getSession().setAttribute("res_info", "   ");
            List<Reservation> reservation=adminService.getReservationByDate_interval(date_interval,col_name,page,size);
            int i=0;
            for (Reservation res : reservation) {
                User user=userService.getUserByNum(res.getUser_num());
                res.setId(++i);
                res.setUser_name(user.getUser_name());
                res.setDept(user.getDept());
            }
            PageInfo<Reservation> reservationPageInfo=new PageInfo<>(reservation);
            if (!reservation.isEmpty()) {
                model.addAttribute("reservationPageInfo", reservationPageInfo);
            } else {
                request.getSession().setAttribute("res_info", "暂时无预约信息");
            }
        }
        return "admin_manage_reservations";
    }



    @RequestMapping("/remove_checked_user")
    @ResponseBody
    public String remove_checked(String[] ids) {
        try {
            for(String id:ids) {
                adminService.deleteReserveByUser_id(id);
            }
            //批量删除
            adminService.deleteList(ids);//删除的方法

        } catch (Exception e) {
            return "error";
        }
        return "ok";
    }

    @RequestMapping("/remove_checked_reserve")
    @ResponseBody
    public String remove_checked_reserve(Integer[] ids) {
        try {
            System.out.println("jinr  remove reserve ");
            //批量删除
            adminService.deleteReserveList(ids);//删除的方法
        } catch (Exception e) {
            return "error";
        }
        return "ok";
    }


    @RequestMapping("/pass_checked_reserve")
    @ResponseBody
    public String pass_checked_reserve(Integer[] ids) {
        try {
            System.out.println("jinr  pass ");
            //批量通过
            adminService.passReserveList(ids);//删除的方法
        } catch (Exception e) {
            return "error";
        }
        return "ok";
    }


    @RequestMapping("/refuse_checked_reserve")
    @ResponseBody
    public String refuse_checked_reserve(Integer[] ids) {
        try {
            System.out.println("jinr  refuse ");
            //批量拒绝
            adminService.refuseReserveList(ids);//删除的方法
        } catch (Exception e) {
            return "error";
        }
        return "ok";
    }


    @RequestMapping("/remove_checked_lab")
    @ResponseBody
    public String remove_checked_lab(String[] ids) {
        try {
            adminService.removeReserveByLab_id(ids);//删除实验室的预约信息
            for(String id:ids) {
                adminService.removeScheduleByLab_id(id);
            }
            adminService.removeLabList(ids);//删除的方法
        } catch (Exception e) {
            return "error";
        }
        return "ok";
    }


    @RequestMapping("/remove_checked_anno")
    @ResponseBody
    public String remove_checked_anno(int[] ids) {
        try {
            System.out.println("jinr  remove lab ");
            //批量拒绝
            adminService.removeAnnoList(ids);//删除的方法
        } catch (Exception e) {
            return "error";
        }
        return "ok";
    }

    //管理员每周五添加下一周的日程
    @RequestMapping("/add_checked_lab_schedule")
    @ResponseBody
    public String add_checked_lab_schedule(String[] ids,HttpServletRequest request) {
        try {
            System.out.println("jinr  add_checked_lab_schedule ");
            //添加实验室一周的日程
                int add = adminService.addLabScheduleList(ids);
                adminService.updateScheduleLab_name(ids);
                if (add == 1) {
                    return "ok";
                } else {
                    return "error";
                }
        } catch(Exception e){
                return "error";
        }

    }



}
