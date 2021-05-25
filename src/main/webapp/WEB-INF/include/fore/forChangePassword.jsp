

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
            else if($("#pre_password").val() === "" ){
                alert("原始密码不能为空");
                return false;
            }
            else if($("#new_password").val() === "" ){
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
                <p>实验室预约系统</p>
            </div>
            <div class="lyear-layout-sidebar-scroll" style="background-color:#8b95a5">

                <nav class="sidebar-main">
                    <ul class="nav nav-drawer ">
                        <li class="nav-item active"> <a href="/user/info"><i class="glyphicon glyphicon-user icon"></i> 我的信息</a> </li>
                        <li class="nav-item  "> <a href="/user/reservation"><i class="glyphicon glyphicon-list-alt icon"></i> 我的预约</a> </li>
                        <li class="nav-item "> <a href="/public/announcement"><i class="glyphicon glyphicon-comment  icon"></i> 公告信息</a> </li>
                        <li class="nav-item "> <a href="/user/addReservation"><i class="glyphicon glyphicon-plus  icon"></i> 新建预约</a> </li>
                    </ul>
                </nav>

                <div class="sidebar-footer navbar-fixed-bottom">
                    <p> </p>
                    <p class="copyright " style="text-align:center">版权所有©Naomi  </p>
                    <p class="copyright" style="text-align:center">联系我们：lalala@163.cn  </p>
                    <p> &nbsp;</p>
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
                                <p style="color:red;text-align: center">${change_error}</p>
                            </div>
                            <div class="card-body">

                                    <form action="/user/changePassword" method="post" >
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
                                        <div class="form-group">
                                            <label for="email">邮箱</label>
                                            <input class="form-control" type="email" id="email" name="email" placeholder="请输入可以接收邮件的邮箱">
                                        </div>
                                        <br/>
                                        <div class="form-group">
                                            <button class="btn bg-gray" id="reset" type="reset">清空</button>
                                            <button class="btn bg-gray" id="changePassword" type="submit">提交</button>
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
