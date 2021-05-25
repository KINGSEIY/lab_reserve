package com.reservation.controller;


import com.github.pagehelper.PageInfo;
import com.reservation.mapper.PublicMapper;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

@Controller
@RequestMapping("public")
public class PublicController {

    @Autowired
    private PublicService publicService;
    @Autowired
    private UserService userService;
    @Autowired
    private AdminService adminService;

    @RequestMapping("/index")
    public String index( HttpSession session){
        return  "index";
    }

    // 用户登陆
    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request,HttpSession session, HttpServletResponse response){

        String user_num = request.getParameter("user_num");
        String passwd = request.getParameter("passwd");
        LoginInfo login = new LoginInfo();
        login.setUser_num(user_num);
        login.setPasswd(passwd);
        System.out.println(login);
        ModelAndView mav = new ModelAndView();
        User user;
        Admin admin;
        if(user_num.equals("admin")&&passwd.equals("admin")){
            request.getSession().setAttribute("superAdmin", "superAdmin");
            return manage_manager(1,10,session,request);
        }
        else if((user = userService.verify(login)) != null){
            request.getSession().setAttribute("user", user);
            mav.setViewName("userInfo");
        }else if((admin=adminService.verify(login)) != null) {
            request.getSession().setAttribute("admin", admin);
            System.out.println(admin);
            mav.setViewName("adminInfo");
        }else {
            request.setAttribute("login_erro","用户名或密码错误");
            mav.setViewName("index");
        }
        return mav;
    }

    // 退出
    @RequestMapping("/logout")
    public ModelAndView exit(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mav = new ModelAndView();
        Enumeration em = request.getSession().getAttributeNames();
        while(em.hasMoreElements()){
            request.getSession().removeAttribute(em.nextElement().toString());
        }
        mav.setViewName("index");
        return mav;
    }


    //查看管理员发布的公告信息
    @RequestMapping("/announcement")
    public ModelAndView getAnnouncement(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
        ModelAndView mav = new ModelAndView();
        User user = (User)session.getAttribute("user");
        List<Announcement> announcements=publicService.getAnnouncement();
        if(!announcements.isEmpty()){
            mav.addObject("announcements",announcements);
            if((1 == user.getUser_type())|| (2 == user.getUser_type())) {
                mav.setViewName("userAnnouncement");
            }else{
                request.getSession().setAttribute("error","出现错误，请重新登陆");
                mav.setViewName("userAnnouncement");
            }
        }else{
            request.getSession().setAttribute("error","暂无公告信息");
            mav.setViewName("userAnnouncement");
        }
        return mav;
    }



    //跳转到修改密码页面
    @RequestMapping("/changePassword")
    public ModelAndView changePassword(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
        ModelAndView mav=new ModelAndView();
        if(session.getAttribute("user")!=null){
            mav.setViewName("changePassword");
            return  mav;
        }
        if(session.getAttribute("admin")!=null){
            mav.setViewName("changeAdminPassword");
            return  mav;
        }
        mav.setViewName("publicChangePassword");
        return mav;
    }


    //忘记密码后通过邮箱发送验证码修改密码
    @RequestMapping("/changePasswordByEmail")
    public ModelAndView changePasswordByEmail(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        String user_num = request.getParameter("user_num");
        String email = request.getParameter("email");
        String new_password = request.getParameter("new_password");
        System.out.println(new_password);
        Admin admin=adminService.getAdminByNum(user_num);
        User user=userService.getUserByNum(user_num);
        if(null != user ) {
            System.out.println("得到user");
            int flag=userService.check(user_num,email);
            System.out.println(flag);
            if(flag==1) {
                System.out.println(user);
                user.setPasswd(new_password);
                user.setEmail(email);
                int result = userService.updatePassword(user.getUser_num(), new_password, email);
                System.out.println(result);
                if (result == 1) {
                    mav.setViewName("index");
                    return mav;
                }
            }else{
                System.out.println("进入错误提示");
                request.setAttribute("change_error","出现错误，请确认相关信息填写是否正确");
                mav.setViewName("publicChangePassword");
                return mav;
            }
        }
        if(null != admin ) {
            System.out.println("得到admin");
            int flag=adminService.check(user_num,email);
            System.out.println(flag);
            if(flag==1) {
                System.out.println(admin);
                admin.setPasswd(new_password);
                admin.setMgr_email(email);
                int result = adminService.updatePassword(admin.getMgr_num(), new_password, email);
                System.out.println(result);
                if (result == 1) {
                    mav.setViewName("index");
                    return mav;
                }
            }else{
                System.out.println("进入错误提示");
                request.setAttribute("change_error","出现错误，请确认相关信息填写是否正确");
                mav.setViewName("publicChangePassword");
                return mav;
            }
        }
        request.setAttribute("change_error","出现错误，请确认相关信息填写是否正确");
        mav.setViewName("publicChangePassword");
        return mav;
    }


    @RequestMapping("/InputStuExcel")
    public ModelAndView InputStuExcel(@RequestParam("file") MultipartFile file, MultipartHttpServletRequest request,HttpSession session) throws Exception {
        String flag = "02";// 上传标志
        if (!file.isEmpty()) {
            try {
                String originalFilename = file.getOriginalFilename();// 原文件名字
//                log.info("文件名：" + originalFilename);
                InputStream is = file.getInputStream();// 获取输入流
                flag = publicService.InputExcel(is, originalFilename);
            } catch (Exception e) {
                flag = "03";// 上传出错
                request.getSession().setAttribute("add_info","上传出错");
                e.printStackTrace();
                return new ModelAndView("redirect:/admin/manage_students");
            }
        }
        request.getSession().setAttribute("add_info","上传成功");
        return new ModelAndView("redirect:/admin/manage_students");
    }


    @RequestMapping("/InputTeaExcel")
    public ModelAndView InputTeaExcel(@RequestParam("file") MultipartFile file, MultipartHttpServletRequest request,HttpSession session) throws Exception {
        String flag = "02";// 上传标志
        if (!file.isEmpty()) {
            try {
                String originalFilename = file.getOriginalFilename();// 原文件名字
//                log.info("文件名：" + originalFilename);
                InputStream is = file.getInputStream();// 获取输入流
                flag = publicService.InputExcel(is, originalFilename);
            } catch (Exception e) {
                flag = "03";// 上传出错
                request.getSession().setAttribute("add_info","上传出错");
                e.printStackTrace();
                return new ModelAndView("redirect:/admin/manage_teachers");
            }
        }
        request.getSession().setAttribute("add_info","上传成功");
        return new ModelAndView("redirect:/admin/manage_teachers");
    }

    @RequestMapping("/InputLabExcel")
    public ModelAndView InputLabExcel(@RequestParam("file") MultipartFile file, MultipartHttpServletRequest request,HttpSession session) throws Exception {
        String flag = "02";// 上传标志
        if (!file.isEmpty()) {
            try {
                String originalFilename = file.getOriginalFilename();// 原文件名字
//                log.info("文件名：" + originalFilename);
                InputStream is = file.getInputStream();// 获取输入流
                flag = publicService.InputLabExcel(is, originalFilename);
            } catch (Exception e) {
                flag = "03";// 上传出错
                request.getSession().setAttribute("add_lab_info","上传出错");
                e.printStackTrace();
                return new ModelAndView("redirect:/admin/manage_laboratory");
            }
        }
        request.getSession().setAttribute("add_lab_info","上传成功");
        return new ModelAndView("redirect:/admin/manage_laboratory");
    }

    @RequestMapping("/InputAdminExcel")
    public ModelAndView InputAdminExcel(@RequestParam("file") MultipartFile file, MultipartHttpServletRequest request,HttpSession session) throws Exception {
        String flag = "02";// 上传标志
        if (!file.isEmpty()) {
            try {
                String originalFilename = file.getOriginalFilename();// 原文件名字
//                log.info("文件名：" + originalFilename);
                InputStream is = file.getInputStream();// 获取输入流
                flag = publicService.InputAdminExcel(is, originalFilename);
            } catch (Exception e) {
                flag = "03";// 上传出错
                request.getSession().setAttribute("add_mgr_info","上传出错");
                e.printStackTrace();
                return new ModelAndView("redirect:/public/manage_manager");
            }
        }
        request.getSession().setAttribute("add_mgr_info","上传成功");
        return new ModelAndView("redirect:/public/manage_manager");
    }

    @RequestMapping("/remove_checked_mgr")
    @ResponseBody
    public String remove_checked_mgr(String[] ids) {
        try {
            for(String id:ids) {
                publicService.removeAdminByMgr_num(id);//删除管理员
            }
        } catch (Exception e) {
            return "error";
        }
        return "ok";
    }


    //修改管理员信息
    @RequestMapping("/EditMgrInfo")
    public ModelAndView EditMgrInfo( HttpSession session,HttpServletRequest request) {
        String mgr_num=request.getParameter("mgr_num");
        String mgr_name=request.getParameter("mgr_name");
        String col_name=request.getParameter("col_name");
        int col_id=publicService.getCol_idByCol_name(col_name);

        int edit=publicService.EditMgrInfo(mgr_num,mgr_name,col_name,col_id);
        if(edit==1){
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("admin_info","   ");
            request.getSession().setAttribute("add_mgr_info","成功修改管理员信息");
        }else{
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("admin_info","   ");
            request.getSession().setAttribute("add_mgr_info","用户信息修改失败，请重新操作");
        }
        return manage_manager(1,10,session,request);
    }


    //添加管理员
    @RequestMapping("/AddManager")
    public ModelAndView AddManager( HttpSession session,HttpServletRequest request) {
        String mgr_num=request.getParameter("mgr_num");
        String mgr_name=request.getParameter("mgr_name");
        String col_name=request.getParameter("col_name");
        int col_id=publicService.getCol_idByCol_name(col_name);
        if(publicService.containsAdmin(mgr_num)==null) {
            int add = publicService.addAdmin(mgr_num, mgr_name,col_name,col_id);
            if (add == 1) {
                request.getSession().setAttribute("error", "  ");
                request.getSession().setAttribute("admin_info", "   ");
                request.getSession().setAttribute("add_mgr_info", "成功添加管理员");
            } else {
                request.getSession().setAttribute("error", "  ");
                request.getSession().setAttribute("admin_info", "   ");
                request.getSession().setAttribute("add_mgr_info", "添加失败，请重新添加");
            }
        }else{
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("admin_info", "   ");
            request.getSession().setAttribute("add_mgr_info", "该管理员已存在");
        }
        return manage_manager(1,10,session,request);
    }


    //移除管理员
    @RequestMapping("/removeAdmin")
    public ModelAndView removeAdmin(@RequestParam("mgr_num") String mgr_num, HttpSession session,HttpServletRequest request) {
        int remove = publicService.removeAdminByMgr_num(mgr_num);
        if (remove == 1) {
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("admin_info", "   ");
            request.getSession().setAttribute("add_mgr_info", "成功移除管理员");
        } else {
            request.getSession().setAttribute("error", "  ");
            request.getSession().setAttribute("admin_info", "   ");
            request.getSession().setAttribute("add_mgr_info", "移除失败，请重新移除");
        }
        return manage_manager(1,10,session, request);
    }

    //按搜索框内容搜索管理员
    @RequestMapping("/searchAdminBySearch_text")
    public String searchAdminBySearch_text(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10")int size,@RequestParam("search_text") String search_text, HttpSession session, Model model,HttpServletRequest request) {
        List<Admin> mgrs;
        if (null != search_text || search_text.trim().length() != 0) {
            mgrs = adminService.getAdminBySearch_textLimit(search_text, page, size);
        }else {
            mgrs = publicService.getAllMgr(page, size);
        }
            int i = 1;
            for (Admin mgr : mgrs) {
                mgr.setId(i++);
            }
            PageInfo<Admin> adminPage = new PageInfo<>(mgrs);
            if (!mgrs.isEmpty()) {
                model.addAttribute("adminPage", adminPage);
                request.getSession().setAttribute("admin_info", "  ");
                request.getSession().setAttribute("error", "   ");
                request.getSession().setAttribute("add_mgr_info", "  ");
            } else {
                request.getSession().setAttribute("add_mgr_info", "  ");
                request.getSession().setAttribute("error", "   ");
                request.getSession().setAttribute("admin_info", "暂时无管理员，可通过“新增”增加管理员");
            }
            return "adminPage";
    }

    //返回所有管理员列表
    @RequestMapping("/tomanage_manager")
    public ModelAndView tomanage_manager( HttpSession session,HttpServletRequest request) {
        request.getSession().setAttribute("error", "  ");
        request.getSession().setAttribute("admin_info","   ");
        request.getSession().setAttribute("add_mgr_info", "   ");

        return manage_manager(1,10,session,request);
    }


    //跳转到添加管理员页面
    @RequestMapping("/add_manager")
    public ModelAndView add_manager( HttpSession session){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("add_manager");
        return mav;
    }

    @RequestMapping("/manage_manager")
    public ModelAndView manage_manager(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10")int size,HttpSession session, HttpServletRequest request){
        ModelAndView mav=new ModelAndView();
        if(session.getAttribute("superAdmin").equals("superAdmin")){
                int i=0;
                List<Admin> mgrs = publicService.getAllMgr(page,size);

                for (Admin mgr : mgrs) {
                    mgr.setId(++i);
                }
                PageInfo<Admin> adminPage=new PageInfo<>(mgrs);
                if (!mgrs.isEmpty()) {
                    mav.addObject("adminPage",adminPage);
                    mav.setViewName("adminPage");
                    return mav;
                } else {
                    request.getSession().setAttribute("add_mgr_info", "  ");
                    request.getSession().setAttribute("error","   ");
                    request.getSession().setAttribute("admin_info", "暂时无管理员，可通过“新增”增加管理员");
                    mav.setViewName("adminPage");
                    return mav;
                }
            }else{
                request.getSession().setAttribute("add_mgr_info", "  ");
                request.getSession().setAttribute("admin_info","   ");
                request.getSession().setAttribute("error","出现错误，请退出重新登录！");
                mav.setViewName("adminPage");
                return mav;
            }
    }

}
