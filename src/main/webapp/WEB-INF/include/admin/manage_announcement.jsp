

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<script>


    //全选
    var oid=document.getElementsByName("id");

    jQuery( function() {
    // 复选框全选
        $("#check-all").change(function () {
            $("input[type='checkbox']").prop('checked', $(this).prop("checked"));
        });
    });

    /*批量删除*/
    function delAllAnnos() {
        var r = confirm("是否确认删除？");
        if (r == true) {
            //确认删除
            var ids = "";
            var n = 0;
            for (var i = 0; i < oid.length; i++) {
                if (oid[i].checked == true) {//选中为true
                    var id = oid[i].value;
                    if (n == 0) {
                        ids += "ids=" + id;
                    } else {
                        ids += "&ids=" + id;
                    }
                    n++;
                }
            }
            //上面会拼接出一个名为ids的数组ids=1&ids=2&ids=3&ids=4……
            $.get("/admin/remove_checked_anno", ids, function (data) {
                if (data == "ok") {
                    alert("删除成功!");
                    //删除成功后，调用action方法刷新页面信息
                    location.reload();
                    $("input[name=id]").removeAttr("checked");
                } else {
                    alert("请选中行!");
                }
            });
            return true;
        } else {
            //不删除
            return false;
        }
    }
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
                        <li class="nav-item "> <a href="/admin/adminInfo"><i class="glyphicon glyphicon-user icon"></i> 我的信息</a> </li>
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
                        <li class="nav-item nav-item-has-subnav active open ">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-comment icon"></i> 公告管理</a>
                            <ul class="nav nav-subnav ">
                                <li> <a href="/admin/addAnnouncement" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-pencil tubiao"></i>    发布公告</a> </li>
                                <li class="active"> <a href="/admin/manage_announcement" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-cloud tubiao"></i>    管理公告</a> </li>
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
                                <h4>管理公告</h4>
                            </div>
                            <div class="card-toolbar clearfix">
                                <form action="/admin/searchAnnouncementBySearch_text" method="post" class="pull-right search-bar" role="form">
                                    <div class="input-group" >
                                        <input type="text"  name="search_text" class="form-control" style="border-color: black" placeholder="请输入关键词...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-dark" type="submit">搜索</button>
                                        </span>
                                    </div>
                                </form>
                                <div class="toolbar-btn-action">
                                    <a class="btn btn-danger m-r-10   m-t-10"  onclick="delAllAnnos()"><i class="glyphicon glyphicon-minus "></i> 批量删除</a>
                                    <a class="btn btn-secondary m-t-10 m-r-10" href="/admin/tomanage_announcements" ><i class="glyphicon glyphicon-share-alt "></i> 返回所有实验室列表</a>
                                    <a class="btn btn-success m-t-10 m-r-10" >
                                        <label class="lyear-checkbox " style="color:white">
                                            <input type="checkbox" id="check-all">全选<span></span>
                                        </label>
                                    </a>

                                    <p style="color:red;text-align: center;margin-top: 20px">${anno_info}</p>
                                    <p style="color:red;text-align: center;margin-top: 20px">${info}</p>
                                    <p style="color:red;text-align: center">${error}</p>
                                </div>
                            </div>

                            <div class="card-body">

                                    <div class="row">

                                        <c:forEach items="${announcementPageInfo.list}" var="annos">
                                            <c:if test="${annos.getCol_id()==1}">
                                                <div class="col-sm-6 col-lg-4">
                                                    <div class="card">
                                                        <div class="card-header bg-dark">
                                                            <h4>${annos.getTitle()}</h4>
                                                            <ul class="card-actions">
                                                                <label class="lyear-checkbox checkbox-primary" style="display: inline-block;margin-top: 0">
                                                                    <input type="checkbox" name="id" value="${annos.getId()}"><span></span>
                                                                </label>
                                                                <div class="btn-group" style="display: inline-block;margin-top: 20px">
                                                                    <a class="btn btn-xs bg-dark" href="/admin/removeAnnouncement?id=${annos.getId()}" title="" data-toggle="tooltip" data-original-title="删除"><i class="glyphicon glyphicon-trash icon2"></i></a>
                                                                </div>
                                                            </ul>
                                                        </div>
                                                        <div class="card-body">
                                                            <p>${annos.getContent()}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- .col-sm-6 -->
                                            </c:if>

                                            <c:if test="${annos.getCol_id()==2}">
                                                <div class="col-sm-6 col-lg-4">
                                                    <div class="card">
                                                        <div class="card-header bg-yellow">
                                                            <h4>${annos.getTitle()}</h4>
                                                            <ul class="card-actions">
                                                                <label class="lyear-checkbox checkbox-primary" style="display: inline-block;margin-top: 0">
                                                                    <input type="checkbox" name="id" value="${annos.getId()}"><span></span>
                                                                </label>
                                                                <div class="btn-group" style="display: inline-block;margin-top: 20px">
                                                                    <a class="btn btn-xs bg-yellow" href="/admin/removeAnnouncement?id=${annos.getId()}" title="" data-toggle="tooltip" data-original-title="删除"><i class="glyphicon glyphicon-trash icon2"></i></a>
                                                                </div>
                                                            </ul>
                                                        </div>
                                                        <div class="card-body">
                                                            <p>${annos.getContent()}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- .col-sm-6 -->
                                            </c:if>

                                            <c:if test="${annos.getCol_id()==3}">
                                                <div class="col-sm-6 col-lg-4">
                                                    <div class="card">
                                                        <div class="card-header bg-cyan">
                                                            <h4>${annos.getTitle()}</h4>
                                                            <ul class="card-actions">
                                                                <label class="lyear-checkbox checkbox-primary" style="display: inline-block;margin-top: 0">
                                                                    <input type="checkbox" name="id" value="${annos.getId()}"><span></span>
                                                                </label>
                                                                <div class="btn-group" style="display: inline-block;margin-top: 20px">
                                                                    <a class="btn btn-xs bg-cyan" href="/admin/removeAnnouncement?id=${annos.getId()}" title="" data-toggle="tooltip" data-original-title="删除"><i class="glyphicon glyphicon-trash icon2"></i></a>
                                                                </div>
                                                            </ul>
                                                        </div>
                                                        <div class="card-body">
                                                            <p>${annos.getContent()}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- .col-sm-6 -->
                                            </c:if>


                                            <c:if test="${annos.getCol_id()==4}">
                                                <div class="col-sm-6 col-lg-4">
                                                    <div class="card">
                                                        <div class="card-header bg-danger">
                                                            <h4>${annos.getTitle()}</h4>
                                                            <ul class="card-actions">
                                                                <label class="lyear-checkbox checkbox-primary" style="display: inline-block;margin-top: 0">
                                                                    <input type="checkbox" name="id" value="${annos.getId()}"><span></span>
                                                                </label>
                                                                <div class="btn-group" style="display: inline-block;margin-top: 20px">
                                                                    <a class="btn btn-xs bg-danger" href="/admin/removeAnnouncement?id=${annos.getId()}" title="" data-toggle="tooltip" data-original-title="删除"><i class="glyphicon glyphicon-trash icon2"></i></a>
                                                                </div>
                                                            </ul>
                                                        </div>
                                                        <div class="card-body">
                                                            <p>${annos.getContent()}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- .col-sm-6 -->
                                            </c:if>

                                            <c:if test="${annos.getCol_id()==5}">
                                                <div class="col-sm-6 col-lg-4">
                                                    <div class="card">
                                                        <div class="card-header bg-secondary">
                                                            <h4>${annos.getTitle()}</h4>
                                                            <ul class="card-actions">
                                                                <label class="lyear-checkbox checkbox-primary" style="display: inline-block;margin-top: 0">
                                                                    <input type="checkbox" name="id" value="${annos.getId()}"><span></span>
                                                                </label>
                                                                <div class="btn-group" style="display: inline-block;margin-top: 20px">
                                                                    <a class="btn btn-xs bg-secondary" href="/admin/removeAnnouncement?id=${annos.getId()}" title="" data-toggle="tooltip" data-original-title="删除"><i class="glyphicon glyphicon-trash icon2"></i></a>
                                                                </div>
                                                            </ul>
                                                        </div>
                                                        <div class="card-body">
                                                            <p>${annos.getContent()}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- .col-sm-6 -->
                                            </c:if>

                                            <c:if test="${annos.getCol_id()==6}">
                                                <div class="col-sm-6 col-lg-4">
                                                    <div class="card">
                                                        <div class="card-header bg-success">
                                                            <h4>${annos.getTitle()}</h4>
                                                            <ul class="card-actions">
                                                                <label class="lyear-checkbox checkbox-primary" style="display: inline-block;margin-top: 0">
                                                                    <input type="checkbox" name="id" value="${annos.getId()}"><span></span>
                                                                </label>
                                                                <div class="btn-group" style="display: inline-block;margin-top: 20px">
                                                                   <a class="btn btn-xs bg-success" href="/admin/removeAnnouncement?id=${annos.getId()}" title="" data-toggle="tooltip" data-original-title="删除"><i class="glyphicon glyphicon-trash icon2"></i></a>
                                                                </div>
                                                            </ul>
                                                        </div>
                                                        <div class="card-body">
                                                            <p>${annos.getContent()}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- .col-sm-6 -->
                                            </c:if>

                                            <c:if test="${annos.getCol_id()==7}">
                                                <div class="col-sm-6 col-lg-4">
                                                    <div class="card">
                                                        <div class="card-header bg-warning">
                                                            <h4>${annos.getTitle()}</h4>
                                                            <ul class="card-actions" style="">
                                                                <label class="lyear-checkbox checkbox-success" style="display: inline-block;margin-top: 0">
                                                                    <input type="checkbox" name="id" value="${annos.getId()}"><span></span>
                                                                </label>
                                                                <div class="btn-group" style="display: inline-block;margin-top: 20px">
                                                                    <a class="btn btn-xs bg-warning"  href="/admin/removeAnnouncement?id=${annos.getId()}" title="" data-toggle="tooltip" data-original-title="删除"><i class="glyphicon glyphicon-trash icon2" style="color: black"></i></a>
                                                                </div>
                                                            </ul>
                                                        </div>
                                                        <div class="card-body">
                                                            <p>${annos.getContent()}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- .col-sm-6 -->
                                            </c:if>

                                            <c:if test="${annos.getCol_id()==8}">
                                                <div class="col-sm-6 col-lg-4">
                                                    <div class="card">
                                                        <div class="card-header bg-brown">
                                                            <h4>${annos.getTitle()}</h4>
                                                            <ul class="card-actions">
                                                                <label class="lyear-checkbox checkbox-primary" style="height:30px; line-height:30px">
                                                                    <input type="checkbox" name="id" value="${annos.getId()}"><span></span>
                                                                </label>
                                                                <div class="btn-group">
                                                                    <a class="btn btn-xs btn-default" href="/admin/removeAnnouncement?id=${annos.getId()}" title="" data-toggle="tooltip" data-original-title="删除"><i class="glyphicon glyphicon-trash icon2"></i></a>
                                                                </div>
                                                            </ul>
                                                        </div>
                                                        <div class="card-body">
                                                            <p>${annos.getContent()}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- .col-sm-6 -->
                                            </c:if>

                                            <c:if test="${annos.getCol_id()==9}">
                                                <div class="col-sm-6 col-lg-4">
                                                    <div class="card">
                                                        <div class="card-header bg-pink">
                                                            <h4>${annos.getTitle()}</h4>
                                                            <ul class="card-actions">
                                                                <label class="lyear-checkbox checkbox-primary" style="height:30px; line-height:30px">
                                                                    <input type="checkbox" name="id" value="${annos.getId()}"><span></span>
                                                                </label>
                                                                <div class="btn-group">
                                                                    <a class="btn btn-xs btn-default" href="/admin/removeAnnouncement?id=${annos.getId()}" title="" data-toggle="tooltip" data-original-title="删除"><i class="glyphicon glyphicon-trash icon2"></i></a>
                                                                </div>
                                                            </ul>
                                                        </div>
                                                        <div class="card-body">
                                                            <p>${annos.getContent()}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- .col-sm-6 -->
                                            </c:if>

                                            <c:if test="${annos.getCol_id()==10}">
                                                <div class="col-sm-6 col-lg-4">
                                                    <div class="card">
                                                        <div class="card-header bg-purple">
                                                            <h4>${annos.getTitle()}</h4>
                                                            <ul class="card-actions">
                                                                <label class="lyear-checkbox checkbox-primary" style="height:30px; line-height:30px">
                                                                    <input type="checkbox" name="id" value="${annos.getId()}"><span></span>
                                                                </label>
                                                                <div class="btn-group">
                                                                    <a class="btn btn-xs btn-default" href="/admin/removeAnnouncement?id=${annos.getId()}" title="" data-toggle="tooltip" data-original-title="删除"><i class="glyphicon glyphicon-trash icon2"></i></a>
                                                                </div>
                                                            </ul>
                                                        </div>
                                                        <div class="card-body">
                                                            <p>${annos.getContent()}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- .col-sm-6 -->
                                            </c:if>

                                        </c:forEach>
                                    </div>
                                <ul class="pagination">
                                    <span>第${announcementPageInfo.pageNum}/ ${announcementPageInfo.pages}页</span>
                                    <span>总记录数：${announcementPageInfo.total}  每页显示:6</span>
                                    <li><a href="/admin/manage_announcement?page=1&size=10" aria-label="Previous">首页</a></li>
                                    <li><a href="/admin/manage_announcement?page=${announcementPageInfo.pageNum-1}&size=10">上一页</a></li>

                                    <li><a href="/admin/manage_announcement?page=${announcementPageInfo.pageNum+1}&size=10">下一页</a></li>
                                    <li><a href="/admin/manage_announcement?page=${announcementPageInfo.pages}&size=10" aria-label="Next">尾页</a></li>

                                </ul>
                                </div>
                                </div>
                            </div>

                        </div>

                    </div>
        </main>
        <!--End 页面主要内容-->
    </div>
</div>






