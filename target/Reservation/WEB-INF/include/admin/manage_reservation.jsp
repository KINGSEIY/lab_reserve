

<script>


    //    //全选
    var oall=document.getElementById("all");
    var oid=document.getElementsByName("id");
    jQuery( function() {
// 复选框全选
        $("#check-all").change(function () {
            $("input[type='checkbox']").prop('checked', $(this).prop("checked"));
        });
    });

    /*批量删除*/
    function delAll() {
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
            $.get("/admin/remove_checked_reserve", ids, function (data) {
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

    /*批量通过*/
    function passAll() {
        var r = confirm("是否确认全部通过？");
        if (r == true) {
            //确认全部通过
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
            $.get("/admin/pass_checked_reserve", ids, function (data) {
                if (data == "ok") {
                    alert("全部通过成功!");
                    //删除成功后，调用action方法刷新页面信息
                    location.reload();
                    $("input[name=id]").removeAttr("checked");
                } else {
                    alert("请选中行!");
                }
            });
            return true;
        } else {
            //不全部通过
            return false;
        }
    }


    /*批量拒绝*/
    function refuseAll() {
        var r = confirm("是否确认全部拒绝？");
        if (r == true) {
            //确认全部通过
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
            $.get("/admin/refuse_checked_reserve", ids, function (data) {
                if (data == "ok") {
                    alert("全部拒绝成功!");
                    //删除成功后，调用action方法刷新页面信息
                    location.reload();
                    $("input[name=id]").removeAttr("checked");
                } else {
                    alert("请选中行!");
                }
            });
            return true;
        } else {
            //不全部拒绝
            return false;
        }
    }
</script>


<%@ page buffer="8192kb" %>
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
                        <li class="nav-item active"> <a href="/admin/manage_reservation"><i class="glyphicon glyphicon-list-alt icon"></i> 预约管理</a> </li>
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
                                <h4>预约管理</h4>
                                <p style="color:red;text-align: center">${error}</p>
                            </div>
                            <div class="card-body">
                                <div style="padding-bottom: 20px;border-bottom: solid 1px #e5e5e5">
                                    <div class="row" style="margin-left: 3px">
                                        <div class="col-lg-6 col-md-6 col-sm-11 col-xs-11" >
                                            <form action="/admin/searchReservationBySearch_text" method="post" >
                                                <div class="input-group" >
                                                    <input type="text" name="search_text" class="form-control" style="border-color: black" placeholder="请输入关键词...">
                                                    <span class="input-group-btn">
                                                      <button class="btn btn-dark" type="submit">搜索</button>
                                                    </span>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-1 col-xs-1">

                                        </div>
                                    </div>
                                    <div>
                                        <form action="/admin/searchReservationByLimit" method="post" >
                                            <div class="row" style="margin-left: 3px">
                                                <div class="col-lg-6 col-md-6 col-sm-7 col-xs-7" >
                                                    <div class="input-group" >
                                                        <div style="display: inline-block;margin-left: 50px;margin-top: 10px">
                                                            <span style="color:lightslategrey;padding-bottom: 15px;padding-top: 10px;">提示：以下选择可不选择或选择某几项内容进行查找</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-5 col-xs-5">
                                                    <div style="text-align: right;margin-right: 50px">
                                                        <input id="search" type="submit" class="btn  btn-success" style="font-size: 15px;border-radius: 10px"  value="查找" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="margin:0">
                                                <div class="col-sm-4" style="margin-top:20px">
                                                    <div class="input-group">
                                                        <div class="input-group-btn">
                                                            <label  class="btn btn-dark " >用户类型</label>
                                                        </div>
                                                        <select class="form-control" id="user_type" name="user_type"  style="border-color: black">
                                                            <option value="0">请选择用户类型（默认为所有用户）</option>
                                                            <option value="1">学生</option>
                                                            <option value="2">教师</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-sm-4" style="margin-top:20px">
                                                    <div class="input-group">
                                                        <div class="input-group-btn">
                                                            <label  class="btn btn-dark " >预约状态</label>
                                                        </div>
                                                        <select class="form-control" id="statement" name="statement" style="border-color: black">
                                                            <option value="3">请选择预约的状态（默认为所有预约信息）</option>
                                                            <option value="0">未审批</option>
                                                            <option value="1">已通过</option>
                                                            <option value="2">已拒绝</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-sm-4" style="margin-top:20px">
                                                    <div class="input-group">
                                                        <div class="input-group-btn">
                                                            <label  class="btn btn-dark " >时间范围</label>
                                                        </div>
                                                        <select class="form-control" id="date_interval" name="date_interval"  style="border-color: black">
                                                            <option value="2">请选择预约的时间范围</option>
                                                            <option value="0">一周内</option>
                                                            <option value="1">一个月内</option>
                                                            <option value="2">全部预约</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <div class="card-toolbar clearfix">
                                    <div class="toolbar-btn-action">
                                        <a class="btn btn-danger btn-xs m-r-10" id="delAll" onclick="delAll()"><i class="glyphicon glyphicon-minus "></i> 删除</a>
                                        <a class="btn btn-success btn-xs m-r-10" onclick="passAll()"><i class="glyphicon glyphicon-ok "></i> 通过</a>
                                        <a class="btn btn-warning btn-xs" onclick="refuseAll()"><i class="glyphicon glyphicon-remove "></i> 拒绝</a>
                                    </div>
                                    <div>
                                        <a class="btn btn-secondary btn-xs m-t-10" href="/admin/tomanage_reservations" ><i class="glyphicon glyphicon-share-alt "></i> 返回所有预约列表</a>
                                        <p style="color:red;text-align: center;margin-top: 20px">${res_info}</p>
                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead style="font-size: x-small;">
                                        <tr>
                                            <th>
                                                <label class="lyear-checkbox checkbox-primary">
                                                    <input type="checkbox" id="check-all"><span></span>
                                                </label>
                                            </th>
                                            <th style="text-align: center">编号</th>
                                            <th style="text-align: center">实验室名称</th>
                                            <th style="text-align: center">用户名</th>
                                            <th style="text-align: center">学号/工号</th>
                                            <th style="text-align: center">所在系</th>
                                            <th style="text-align: center">预约日期</th>
                                            <th style="text-align: center">时段</th>
                                            <th style="text-align: center">类型</th>
                                            <th style="text-align: center">备注</th>
                                            <th style="text-align: center">状态</th>
                                            <%--                                            <th>预约次数</th>--%>
                                            <%--                                            <th>取消次数</th>--%>
                                            <th style="text-align: center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${reservationPageInfo.list}" var="res">
                                            <tr style="font-size: xx-small;text-align: center;align-items: center">
                                                <td>
                                                    <label class="lyear-checkbox checkbox-primary" style="height:30px; line-height:30px">
                                                        <input type="checkbox" name="id" value="${res.getReserve_id()}"><span></span>
                                                    </label>
                                                </td>
                                                <td style="height:30px; line-height:30px">${res.getId()}</td>
                                                <td style="height:30px; line-height:30px">${res.getLab_name()}</td>
                                                <td style="height:30px; line-height:30px">${res.getUser_name()}</td>
                                                <td style="height:30px; line-height:30px"> ${res.getUser_num()}</td>
                                                <td style="height:30px; line-height:30px">${res.getDept()}</td>
                                                <td style="height:30px; line-height:30px">${res.getReserve_date()}</td>
                                                <td style="height:30px; line-height:30px">${res.getTime_interval()}</td>
                                                <td style="height:30px; line-height:30px">
                                                    <c:if test="${res.getReserve_type()==1}">个人</c:if>
                                                    <c:if test="${res.getReserve_type()==2}">课堂</c:if>
                                                </td>
                                                <td style="height:30px; line-height:30px">${res.getDescription()}</td>
                                                <td >
                                                    <c:if test="${res.getStatement()==0}">
                                                        <span class="label label-warning" style="height:30px; line-height:30px">待审批</span>
                                                    </c:if>
                                                    <c:if test="${res.getStatement()==1}" >
                                                        <span class="label label-success" style="height:30px; line-height:30px">通过</span>
                                                    </c:if>
                                                    <c:if test="${res.getStatement()==2}">
                                                        <span class="label label-danger" style="height:30px; line-height:30px">不通过</span>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <c:if test="${res.getStatement()==0}">
                                                        <a type="button" class="btn btn-success btn-xs btn-round" href="/admin/passReserve?reserve_id=${res.getReserve_id()}" data-toggle="tooltip" data-original-title="通过" style="height:30px; line-height:30px">
                                                            <i class="glyphicon glyphicon-ok icon2" style="font-size: 12px"></i>
                                                        </a>
                                                        <a type="button" class="btn btn-danger btn-xs btn-round" href="/admin/refuseReserve?reserve_id=${res.getReserve_id()}"  data-toggle="tooltip" data-original-title="拒绝" style="height:30px; line-height:30px">
                                                            <i class="glyphicon glyphicon-remove icon2" style="font-size: 12px"></i>
                                                        </a>
                                                    </c:if>
                                                </td>
                                            </tr>

                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <%--                                分页，未实现，下面只是样子--%>
                                <ul class="pagination">
                                    <span>第${reservationPageInfo.pageNum}/ ${reservationPageInfo.pages}页</span>
                                    <span>总记录数：${reservationPageInfo.total}  每页显示:10</span>
                                    <li><a href="/admin/manage_reservation?page=1&size=10" aria-label="Previous">首页</a></li>
                                    <li><a href="/admin/manage_reservation?page=${reservationPageInfo.pageNum-1}&size=10">上一页</a></li>

                                    <li><a href="/admin/manage_reservation?page=${reservationPageInfo.pageNum+1}&size=10">下一页</a></li>
                                    <li><a href="/admin/manage_reservation?page=${reservationPageInfo.pages}&size=10" aria-label="Next">尾页</a></li>

                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
