
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" isELIgnored="false" %>

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
            else if($("#user_num").val() === "" ){
                alert("用户名不能为空");
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

<div class="container">
    <div class="page-body">
        <div class="row">
            <div class="col-md-2 content">

            </div>
            <div class="col-md-8 content">
                <div class="card2"  style="margin-top: 80px;background-color: white;opacity: 70%;border-radius: 10px ">
                    <div style="padding:20px 20px">
                        <div id="card-header" style="border-bottom: 1px solid #f0f0f0;
                margin-bottom: 15px;text-align: center">
                            <h4 style="font-size: 25px;font-weight: 400">修改密码</h4>
                            <div style="display: inline-block;margin-left: 100px">
                                <span style="color:lightslategrey;padding-bottom: 15px">提示：如未绑定邮箱则您的密码为原始密码，无需修改</span>
                            </div>
                        </div>
                        <div >
                            <form action="/public/changePasswordByEmail" method="post" >
                                <div class="form-group">
                                    <label for="user_num">用户名</label>
                                    <input class="form-control" type="text" id="user_num" name="user_num" placeholder="请输入用户名">
                                </div>
                                <div class="form-group">
                                    <label for="email">邮箱</label>
                                    <input class="form-control" type="email" id="email" name="email" placeholder="请输入绑定邮箱">
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
                                <div class="form-group" style="text-align: center">
                                    <div class="row">
                                        <div class="col-md-4 col-lg-4  col-sm-4 col-xs-4 content">
                                            <button class="btn " id="reset" type="reset" style="border-radius: 20px;padding:5px 20px;color:white;background-color:indianred;margin-right: 20px">重置</button>
                                        </div>
                                        <div class="col-md-4 col-lg-4  col-sm-4 col-xs-4 content">
                                            <a href="/public/index">
                                                <button  type="button" class="btn" style="border-radius: 20px;padding:5px 15px;color:white;background-color:indianred;margin-right: 20px">去登录</button>
                                            </a>
                                        </div>
                                        <div class="col-md-4 col-lg-4  col-sm-4 col-xs-4 content">
                                            <button class="btn " id="changePassword" type="submit" style="border-radius: 20px;padding:5px 20px;color:white;background-color:indianred">提交</button>
                                        </div>
                                    </div>
                                </div>

                                <p> ${change_error}</p>
                            </form>
                        </div>
                     </div>
                </div>
            </div>
            <div class="col-md-2 content">

            </div>
        </div>
    </div>
</div>



