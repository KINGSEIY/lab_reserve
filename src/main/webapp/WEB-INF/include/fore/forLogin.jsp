
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" isELIgnored="false" %>

<script type="text/javascript">
    $(function () {
        $("#confirm1").click(function () {
            if($("#inputUsernum1").val() === "" ){
                alert("用户名不能为空");
                return false;
            }
            else if($("#inputPassword1").val() === "" ){
                alert("密码不能为空");
                return false;
            }
            return true;
        })
    })
</script>




<script >
    history.go(1);
</script>

<div class="container">
        <div class="page-body">
            <div class="row">
                <div class="col-md-12 col-lg-6 col-xs-12 col-sm-12 content">
                    <div id="left" >
                        <br/><br/><br/>
                      <img src="../../img/appointments.png" alt="">
                            <span class=" text-secondary" style="font-size: 28px"><b>使用须知</b></span>
                             <br/><br/>
                                <div class="text-bg">
                                    <br/>
                                    <div class="text-block">
                                         <span class="constantsSummary " >
                                             学院新生（本科生、研究生）入学时，会有老师进行一堂安全知识与操作规程的教育课程。师生在使用实验室时需遵守实验室规范，对于违反规范的行为所造成的后果将承担一切相应的责任。<br/>
                                             本校学生和教师均可通过学号/工号及密码登陆系统进行实验室的预约。<br/>
                                             用户应准时到达并自觉出示相关证件。<br/>
                                             每人一周最多可预约 4 次；每周一开放下周预约。<br/>
                                             每次使用预约时段不可迟到 15 分钟以上； 未使用+迟到超过 3 次进入黑名单,本实验室将不再通过该用户的预约申请。<br/>
                                         </span>
                                        <br/>
                                    </div>
                                </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-6  col-sm-12 col-sm-12 content">
                    <div id="right">
                        <br/>
                        <div class="login">
                            ${login_erro}
<%--                            <c:if test="${way == 'admin'.toString()}"> <form action= "admin/login" method="post"></c:if>--%>
<%--                            <c:if test="${way == 'user'.toString()}"> <form action= "user/login" method="post"></c:if>--%>
                            <form action= "/public/login" method="post">
                                <span class="heading">登   录</span>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="user_num"   id="inputUsernum1" placeholder="用户名">
                                    <i class="fa fa-user"></i>
                                </div>
                                <div class="form-group help">
                                    <input type="password" class="form-control"  name="passwd" id="inputPassword1" placeholder="密　码">
                                    <i class="fa fa-lock"></i>
                                    <a href="#" class="fa fa-question-circle"></a>
                                </div>
                                <div class="form-group">
                                    <div class="main-checkbox">
                                        <input type="checkbox" value="None" id="rememberPw1" name="rememberPw"/>
                                        <label for="rememberPw1"></label>
                                    </div>
                                    <span class="text"  >Remember me</span><br/><br/>
                                    <a href="/public/changePassword">
                                        <input id="button1" type="button" class="btn-left btn-default" value="忘记密码">
                                    </a>
                                    <button  id="confirm1" type="submit" class="btn-right btn-default">登录</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
        </div>
    </div>
</div>


