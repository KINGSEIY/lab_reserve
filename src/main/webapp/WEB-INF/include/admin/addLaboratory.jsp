
<script type="text/javascript">
    $(function () {
        $("#AddLaboratory").click(function () {
            if($("#lab_name").val() === "" ) {
                alert("实验室名称不能为空");
                return false;
            }
            else if($("#lab_id").val() === "" ){
                alert("实验室编号不能为空");
                return false;
            }
            else if($("#lab_addr").val() === "" ){
                alert("实验室地址不能为空");
                return false;
            }
            else if($("#description").val() === "" ) {
                alert("对于该实验室的简介不能为空");
                return false;
            }else if($("#lab_capacity").val()===""){
                alert("实验室最大容纳人数不能为空");
                return false;
            }else if($("#statement").val()===""){
                alert("实验室状态不能为空,1表示可使用，2表示暂停使用");
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
                        <li class="nav-item nav-item-has-subnav active open">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-th-large icon"></i>实验室管理</a>
                            <ul class="nav nav-subnav">
                                <li class="active"> <a href="/admin/addLaboratory" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-plus tubiao" ></i>   新增实验室</a> </li>
                                <li > <a href="/admin/manage_laboratory" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-asterisk tubiao"></i>    管理实验室</a> </li>
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
                                <h4>新增实验室</h4>
                                <p style="color:red;text-align: center">${add_info}</p>
                            </div>

                            <div class="card-body">

                                    <form action="/admin/AddLaboratory" method="post" >
                                        <div>
                                            <div class="form-group" style="color:black;margin: 10px 30px">
                                                <div class="input-group-btn">
                                                    <label class="btn control-label" for="lab_name" style="color:black;margin-right: 27px">名称</label>
                                                </div>
                                                <input type="text" name="lab_name" id="lab_name" class="form-control" placeholder="请输入实验室名称">
                                            </div>
                                            <div class="form-group" style="margin: 10px 30px">
                                                <div class="input-group-btn">
                                                    <label class="btn control-label" for="lab_id" style="color:black;margin-right: 27px">ID</label>
                                                </div>
                                                <input type="text" name="lab_id" id="lab_id" class="form-control" placeholder="请输入实验室编号">
                                            </div>
                                            <div class="form-group" style="margin: 10px 30px">
                                                <div class="input-group-btn">
                                                    <label  class="btn control-label" for="lab_addr" style="color:black;margin-right: 27px">地址</label>
                                                </div>
                                                <input type="text" name="lab_addr" id="lab_addr" class="form-control" placeholder="请输入实验室地址">
                                            </div>
                                            <div class="form-group" style="margin: 10px 30px">
                                                <div class="input-group-btn">
                                                    <label class="btn control-label" for="description" style="color:black;margin-right: 27px" >介绍</label>
                                                </div>
                                                <input type="text" name="description" id="description" class="form-control"  placeholder="请输入对于该实验室的简介">
                                            </div>
                                            <div class="form-group" style="margin: 10px 30px">
                                                <div class="input-group-btn">
                                                    <label class="btn control-label" for="lab_capacity" style="color:black;margin-right: 12px">容量</label>
                                                </div>
                                                <input type="text" name="lab_capacity" id="lab_capacity" class="form-control"  placeholder="请输入该实验室的最大容纳人数">
                                            </div>
                                            <div class="form-group" style="margin: 10px 30px">
                                                <div class="input-group-btn">
                                                    <label class="btn control-label" for="statement" style="color:black">状态</label>
                                                </div>
                                                <input type="text" name="statement" id="statement" class="form-control"  placeholder="请输入该实验室状态，1表示可使用，2表示暂停使用">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn bg-gray btn-round " id="reset" type="reset" style="margin: 10px 50px;padding: 5px 30px">清空</button>
                                            <button class="btn bg-gray btn-round " id="AddLaboratory" type="submit" style="padding: 5px 30px">提交</button>
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


