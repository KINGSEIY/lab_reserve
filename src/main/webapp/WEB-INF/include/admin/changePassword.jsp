
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<script type="text/javascript">
    $(function () {
        $("#changePassword").click(function () {
            if($("#email").val() === "" ){
                alert("邮箱不能为空");
                return false;
            }else if(!$("input[name='email']").val().match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {
                alert("邮箱格式不正确！请重新输入");
                return false;
            }
            else if($("#tele").val()===""){
                alert("联系电话不能为空");
                return false;
            } else if($("#pre_password").val() === "" ){
                alert("原密码不能为空");
                return false;
            } else if($("#new_password").val() === "" ){
                alert("新密码不能为空");
                return false;
            }
            else if($("#re_new_password").val() === "" ) {
                alert("请再次输入新密码");
                return false;
            }else if($("#new_password").val() !== $("#re_new_password").val()){
                alert("请确保两次输入的新密码相同");
                return false;
            }
            return true;
        })
    })
</script>

<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">
            <div class="sidebar-header bg-primary">
                <p>实验室预约后台管理</p>
            </div>
            <div class="lyear-layout-sidebar-scroll" style="background-color:#8b95a5">

                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li class="nav-item active "> <a href="/admin/adminInfo"><i class="glyphicon glyphicon-user icon"></i> 我的信息</a> </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class=" glyphicon glyphicon-cog icon"></i> 管理用户</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="/admin/manage_students" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-magnet tubiao"></i>   管理学生</a> </li>
                                <li> <a href="/admin/manage_teachers" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-music tubiao"></i>   管理教师</a> </li>
                                <%--                                    <li> <a href="#"><i class="mdi mdi-palette"></i> 管理管理员</a> </li>--%>
                            </ul>
                        </li>
                        <li class="nav-item "> <a href="/admin/manage_reservation"><i class="glyphicon glyphicon-list-alt icon"></i> 预约管理</a> </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-th-large icon"></i>实验室管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="/admin/addLaboratory" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-plus tubiao" ></i>   新增实验室</a> </li>
                                <li> <a href="/admin/manage_laboratory" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-asterisk tubiao"></i>    管理实验室</a> </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-comment icon"></i> 公告管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="/admin/addAnnouncement" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-pencil tubiao"></i>    发布公告</a> </li>
                                <li> <a href="/admin/manage_announcement" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-cloud tubiao"></i>    管理公告</a> </li>
                            </ul>
                        </li>
                    </ul>
                </nav>

                <div class="sidebar-footer navbar-fixed-bottom">
                    <p> </p>
                    <p class="copyright " style="text-align:center">版权所有©Naomi  </p>
                    <p class="copyright" style="text-align:center">联系我们：lalala@163.cn  </p>
                    <p></p>
                </div>
            </div>

        </aside>
        <!--End 左侧导航-->


        <!--页面主要内容-->
        <main class="lyear-layout-content">

            <div class="container-fluid">

                <div class="row">

                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>修改密码</h4>
                                <p style="color:red;text-align: center">${change_erro}</p>
                            </div>
                            <div class="card-body">

                                <form action="/admin/changePassword" method="post" >
                                    <div class="form-group">
                                        <label for="email">邮箱</label>
                                        <input class="form-control" type="email" id="email" name="email" placeholder="请输入可以接收邮件的邮箱">
                                    </div>
                                    <div class="form-group">
                                        <label for="tele">联系电话</label>
                                        <input class="form-control" type="text" id="tele" name="tele" placeholder="请输入您的联系方式">
                                    </div>
                                    <div class="form-group">
                                        <label for="pre_password">原密码</label>
                                        <input class="form-control" type="password" id="pre_password" name="pre_password" placeholder="请输入原始密码">
                                    </div>
                                    <div class="form-group">
                                        <label for="new_password">新密码</label>
                                        <input class="form-control" type="password" id="new_password" name="new_password" placeholder="请输入新密码">
                                    </div>
                                    <div class="form-group">
                                        <label for="re_new_password">确认密码</label>
                                        <input class="form-control" type="password" id="re_new_password" name="re_new_password" placeholder="请再次输入新密码">
                                    </div>

                                    <br/>
                                    <div class="form-group">
                                        <button class="btn bg-gray btn-round" id="reset" type="reset" style="margin-right: 50px;padding:7px 25px">清空</button>
                                        <button class="btn bg-gray btn-round" id="changePassword" type="submit" style="padding:7px 25px">提交</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </main>
        <!--End 页面主要内容-->
    </div>
</div>
