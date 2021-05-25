<script type="text/javascript">
    $(function () {
        $("#AddAnnouncement").click(function () {
            if($("#title").val() === "" ) {
                alert("公告标题不能为空");
                return false;
            }
            else if($("#content").val() === "" ) {
                alert("公告内容不能为空");
                return false;
            }
            return true;
        })
    })
</script>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

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
                        <li class="nav-item  "> <a href="/admin/adminInfo"><i class="glyphicon glyphicon-user icon"></i> 我的信息</a> </li>
                        <li class="nav-item nav-item-has-subnav ">
                            <a href="javascript:void(0)"><i class=" glyphicon glyphicon-cog icon"></i> 管理用户</a>
                            <ul class="nav nav-subnav">
                                <li > <a href="/admin/manage_students" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-magnet tubiao"></i>   管理学生</a> </li>
                                <li> <a href="/admin/manage_teachers" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-music tubiao"></i>   管理教师</a> </li>
                                <%--                                    <li> <a href="#"><i class="mdi mdi-palette"></i> 管理管理员</a> </li>--%>
                            </ul>
                        </li>
                        <li class="nav-item "> <a href="/admin/manage_reservation"><i class="glyphicon glyphicon-list-alt icon"></i> 预约管理</a> </li>
                        <li class="nav-item nav-item-has-subnav ">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-th-large icon"></i>实验室管理</a>
                            <ul class="nav nav-subnav">
                                <li > <a href="/admin/addLaboratory" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-plus tubiao" ></i>   新增实验室</a> </li>
                                <li > <a href="/admin/manage_laboratory" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-asterisk tubiao"></i>    管理实验室</a> </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav active open">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-comment icon"></i> 公告管理</a>
                            <ul class="nav nav-subnav">
                                <li class="active"> <a href="/admin/addAnnouncement" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-pencil tubiao"></i>    发布公告</a> </li>
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
                                <h4>发布公告</h4>
                                <p style="color:red;text-align: center">${add_anno_info}</p>
                            </div>

                            <div class="card-body">

                                <form action="/admin/AddAnnouncement" method="post" >
                                    <div>
                                        <div class="form-group" style="color:black;margin: 10px 30px">
                                            <div class="input-group-btn">
                                                <label class="btn control-label" for="title" style="color:black;margin-right: 27px">标题</label>
                                            </div>
                                            <input type="text" name="title" id="title" class="form-control" placeholder="请输入公告标题">
                                        </div>
                                        <div class="form-group" style="margin: 10px 30px">
                                            <div class="input-group-btn">
                                                <label class="btn control-label" for="content" style="color:black;margin-right: 27px">公告内容</label>
                                            </div>
                                            <textarea  name="content" id="content" class="form-control" placeholder="请输入公告的内容">
                                            </textarea>
                                        </div>
                                        <input type="hidden" id="mgr_name" name="mgr_name" value="${admin.getMgr_name()}">
                                        <input type="hidden" id="col_id" name="col_id" value="${admin.getCol_id()}">
                                    </div>
                                    <div class="form-group">
                                        <button class="btn bg-gray btn-round " id="reset" type="reset" style="margin: 10px 50px;padding: 5px 30px">清空</button>
                                        <button class="btn bg-gray btn-round " id="AddAnnouncement" type="submit" style="padding: 5px 30px">提交</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>



