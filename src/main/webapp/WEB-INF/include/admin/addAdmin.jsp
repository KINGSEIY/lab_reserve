<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<script type="text/javascript">
    $(function () {
        $("#AddManager").click(function () {
            if($("#mgr_num").val() === "" ) {
                alert("管理员工号不能为空");
                return false;
            }
            else if($("#mgr_name").val() === "" ){
                alert("管理员姓名不能为空");
                return false;
            }
            else if($("#col_name").val() === "" ){
                alert("管理员管理的学院名称不能为空");
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
                        <li class="nav-item  "> <a href="/public/manage_manager"><i class="glyphicon glyphicon-cog icon"></i> 管理员列表</a> </li>
                        <li class="nav-item  active"> <a href="/public/add_manager"><i class="glyphicon glyphicon-add icon"></i> 添加管理员</a> </li>
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
                                <h4>新增管理员</h4>
                                <p style="color:red;text-align: center">${add_mgr_info}</p>
                            </div>

                            <div class="card-body">

                                <form action="/public/AddManager" method="post" >
                                    <div>
                                        <div class="form-group" style="color:black;margin: 10px 30px">
                                            <div class="input-group-btn">
                                                <label class="btn control-label" for="mgr_num" style="color:black;margin-right: 27px">工号</label>
                                            </div>
                                            <input type="text" name="mgr_num" id="mgr_num" class="form-control" placeholder="请输入管理员工号">
                                        </div>
                                        <div class="form-group" style="margin: 10px 30px">
                                            <div class="input-group-btn">
                                                <label class="btn control-label" for="mgr_name" style="color:black;margin-right: 27px">姓名</label>
                                            </div>
                                            <input type="text" name="mgr_name" id="mgr_name" class="form-control" placeholder="请输入管理员工号">
                                        </div>
                                        <div class="form-group" style="margin: 10px 30px">
                                            <div class="input-group-btn">
                                                <label  class="btn control-label" for="col_name" style="color:black;margin-right: 27px">学院</label>
                                            </div>
                                            <input type="text" name="col_name" id="col_name" class="form-control" placeholder="请输入管理员管理学院">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn bg-gray btn-round " id="reset" type="reset" style="margin: 10px 50px;padding: 5px 30px">清空</button>
                                        <button class="btn bg-gray btn-round " id="AddManager" type="submit" style="padding: 5px 30px">提交</button>

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
