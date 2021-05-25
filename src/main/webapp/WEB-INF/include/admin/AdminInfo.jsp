
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>



<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar ">
            <div class="sidebar-header bg-primary">
                <p>实验室预约后台管理</p>
            </div>
            <div class="lyear-layout-sidebar-scroll " style="background-color:#8b95a5">

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
                                <h4>我的信息</h4>
                                <p style="color:red;text-align: center">${error}</p>
                                <p style="color:red;text-align: center">${tele_erro}</p>
                            </div>
                            <div class="card-body">


                                <div class="table-responsive">
                                    <table class="table table-hover" style="border: 0">
                                        <tbody >
                                        <tr >
                                            <th>工号</th>
                                            <td>${admin.getMgr_num()}</td>
                                        </tr>
                                        <tr>
                                            <th>姓名</th>
                                            <td>${admin.getMgr_name()}</td>
                                        </tr>
                                        <tr>
                                            <th>联系电话</th>
                                            <td>${admin.getMgr_tele()}</td>
                                        </tr>
                                        <tr>
                                            <th>学院</th>
                                            <td>${admin.getCol_name()}</td>
                                        </tr>
<%--                                        <tr>--%>
<%--                                            <th>负责管理实验室</th>--%>
<%--                                            <td>${admin.getLab_name()}</td>--%>
<%--                                        </tr>--%>
                                        <%--  <c:if test="${user.getUser_type()==2}"></c:if>--%>
                                        <tr>
                                            <th>身份</th>
                                            <td>管理员</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div >
                                    <a href="/public/changePassword">
                                        <input id="change" type="button" class="btn  btn-w-md btn-round bg-gray"  value="修改密码">
                                    </a>
                                    <button  type="button" class="btn  btn-w-md btn-round bg-gray" style="margin-left: 50px" data-toggle="modal" data-target="#Model" >修改联系电话</button>
                                </div>
                                <div class="modal fade" id="Model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                                <h4 class="modal-title" id="myModalLabel">修改联系电话</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form action="/admin/changeTele" method="post" onsubmit="return check()">
                                                    <div style="margin: 10px 50px">

                                                        <div>
                                                            <div class="input-group" style="margin-top: 20px">
                                                                <div class="input-group-btn">
                                                                    <label  class="btn " >联系电话</label>
                                                                </div>
                                                                <input type="text" name="mgr_tele" id="mgr_tele" class="form-control"  placeholder="填写您的联系方式">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                        <button type="submit" class="btn btn-primary"  name="" id="">提交</button>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>

                    </div>

                </div>
                </div>
            </div>
        </main>
        <!--End 页面主要内容-->
    </div>
</div>





