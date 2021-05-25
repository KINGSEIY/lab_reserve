

<%@ page language="java"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<script src="../../js/jquery/2.0.0/jquery.min.js"></script>
<link href="../../css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="../../js/bootstrap/3.3.6/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../../js/main.min.js"></script>
<link href="../../css/fore/style.css" rel="stylesheet">
<link href="../../css/style.min.css" rel="stylesheet">
<link rel="stylesheet" href="../../css/bootstrap/3.3.6/bootstrapValidator.css" >
<link rel="stylesheet" href="../../css/bootstrap/3.3.6/bootstrapValidator.min.css" >
<script type="text/javascript" src="../../js/bootstrap/3.3.6/bootstrapValidator.min.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="../../js/bootstrap/bootstrap-datepicker/bootstrap-datepicker3.min.css">
<script src="../../js/bootstrap/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="../../js/bootstrap/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<!--头部信息-->
<header class="lyear-layout-header">
    <nav class="navbar navbar-default bg-primary" >
        <div class="topbar">

            <div class="topbar-left">
                <div class="lyear-aside-toggler">
                    <span class="lyear-toggler-bar bg-white"></span>
                    <span class="lyear-toggler-bar bg-white"></span>
                    <span class="lyear-toggler-bar bg-white"></span>
                </div>
                <c:if test="${user.getUser_type()==1||user.getUser_type()==2}">
                    <span class="navbar-page-title "style="color: white"> 个人中心 </span>
                </c:if>
            </div>

            <ul class="topbar-right">
                <li class="dropdown dropdown-profile">
                    <a href="javascript:void(0)" data-toggle="dropdown">
                        <c:if test="${user.getUser_type()==1||user.getUser_type()==2}">
                            <span>${user.getUser_name()} <span class="caret"></span></span>
                        </c:if>
                        <c:if test="${admin.getUser_type()==3}">
                            <span>${admin.getMgr_name()} <span class="caret"></span></span>
                        </c:if>
                        <c:if test="${superAdmin=='superAdmin'}">
                            <span>Admin<span class="caret"></span></span>
                        </c:if>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li class="divider"></li>
                        <li> <a href="/public/logout"><i class="mdi mdi-logout-variant"></i> 退出登录</a> </li>
                        <li> <a href="/public/changePassword"><i class="mdi mdi-logout-variant"></i> 修改密码</a> </li>
                    </ul>
                </li>

            </ul>

        </div>
    </nav>

</header>
<!--End 头部信息-->

<script >
    history.go(1);
</script>