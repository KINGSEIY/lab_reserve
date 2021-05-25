<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<script >
    history.go(1);
</script>

<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">
            <div class="sidebar-header bg-primary">
                <p>实验室预约系统</p>
            </div>
            <div class="lyear-layout-sidebar-scroll" style="background-color:#8b95a5">

                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li class="nav-item active "> <a href="/user/info"><i class="glyphicon glyphicon-user icon"></i> 我的信息</a> </li>
                        <li class="nav-item  "> <a href="/user/reservation"><i class="glyphicon glyphicon-list-alt icon"></i> 我的预约</a> </li>
                        <li class="nav-item "> <a href="/public/announcement"><i class="glyphicon glyphicon-comment  icon"></i> 公告信息</a> </li>
                        <li class="nav-item "> <a href="/user/addReservation"><i class="glyphicon glyphicon-plus  icon"></i> 新建预约</a> </li>
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
                                <div style="display: inline-block;margin-left: 100px">
                                    <span style="color:lightslategrey;padding-bottom: 15px">提示：若基本信息有错误请联系管理员进行修改</span>
                                </div>
                            </div>
                            <div class="card-body">


                                        <div class="table-responsive">
                                           <table class="table table-hover" style="border: 0">
                                               <tbody >
                                                <tr >
                                                    <th>
                                                        <c:if test="${user.getUser_type()==1}">学号</c:if>
                                                        <c:if test="${user.getUser_type()==2}">工号</c:if>
                                                    </th>
                                                    <td>${user.getUser_num()}</td>
                                                </tr>
                                               <tr>
                                                   <th>姓名</th>
                                                   <td>${user.getUser_name()}</td>
                                               </tr>
                                               <tr>
                                                   <th>学院</th>
                                                   <td>${user.getCol_name()}</td>
                                               </tr>
                                               <tr>
                                                   <th>所在系</th>
                                                   <td>${user.getDept()}</td>
                                               </tr>
                                                <c:if test="${user.getUser_type()==1}">
                                                    <tr>
                                                        <th>班级</th>
                                                        <td>${user.getsClass()}</td>
                                                    </tr>
                                                </c:if>
<%--                                                <c:if test="${user.getUser_type()==2}"></c:if>--%>
                                               <tr>
                                                   <th>身份</th>
                                                   <td>
                                                    <c:if test="${user.getUser_type()==1}">学生</c:if>
                                                    <c:if test="${user.getUser_type()==2}">教师</c:if>
                                                   </td>

                                               </tr>
                                               </tbody>
                                           </table>
                                    </div>
                            <div >
                            <a href="/public/changePassword">
                                <input id="change" type="button" class="btn  btn-w-md btn-round bg-gray" value="修改密码">
                            </a>
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


