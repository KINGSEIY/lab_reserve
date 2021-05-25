
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%--<script type="text/javascript">--%>
<%--    setTimeout(function(){--%>
<%--        window.location.reload();//刷新当前页面.--%>
<%--    },2000)--%>
<%--</script>--%>


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
                        <li class="nav-item "> <a href="/user/info"><i class="glyphicon glyphicon-user icon"></i> 我的信息</a> </li>
                        <li class="nav-item  "> <a href="/user/reservation"><i class="glyphicon glyphicon-list-alt icon"></i> 我的预约</a> </li>
                        <li class="nav-item "> <a href="/public/announcement"><i class="glyphicon glyphicon-comment  icon"></i> 公告信息</a> </li>
                        <li class="nav-item active"> <a href="/user/addReservation"><i class="glyphicon glyphicon-plus  icon"></i> 新建预约</a> </li>
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


                    <div class="col-lg-12">
                        <div class="card">

                            <div class="card-header">
                                <h4>${lab.getLab_name()}</h4>
                                <p style="color:red;text-align: center">${add_info}</p>
                            </div>
                            <div class="card-body">
                                <div style="border-bottom: #e5e5e5 solid 1px">
                                <div class="row">
                                    <div class="col-sm-6 col-xs-12 col-md-6 col-lg-6 bs-ib-wrap " style="display: inline-block;padding-right: 0">
                                        <dl class="dl-horizontal">
                                            <dt>实验室简介：</dt>
                                            <dd>${lab.getDescription()}</dd>
                                        </dl>
                                    </div>
                                    <div class="col-sm-6 col-xs-12 col-md-6 col-lg-6 bs-ib-wrap " style="display: inline-block;padding-right: 0">
                                        <dl class="dl-horizontal">
                                            <dt>所属学院：</dt>
                                            <dd>${lab.getCol_name()}</dd>
                                        </dl>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-xs-12 col-md-6 col-lg-6 bs-ib-wrap" style="display: inline-block;padding-right: 0">
                                        <dl class="dl-horizontal">
                                            <dt>地址：</dt>
                                            <dd>${lab.getLab_addr()}</dd>
                                        </dl>
                                    </div>
                                    <div class="col-sm-6 col-xs-12 col-md-6 col-lg-6 bs-ib-wrap" style="display: inline-block;padding-right: 0">
                                        <dl class="dl-horizontal">
                                            <dt>管理员-联系方式：</dt>
                                            <dd>${lab.getMgr_name()}—${lab.getMgr_tel()}</dd>
                                        </dl>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-xs-12 col-md-6 col-lg-6 bs-ib-wrap" style="display: inline-block;padding-right: 0">
                                        <dl class="dl-horizontal">
                                            <dt>最大可预约数：</dt>
                                            <dd>${lab.getLab_capacity()}</dd>
                                        </dl>
                                    </div>
                                    <div class="col-sm-6 col-xs-12 col-md-6 col-lg-6 bs-ib-wrap" style="display: inline-block;padding-right: 0">
                                        <dl class="dl-horizontal">
                                            <dt></dt>
                                            <dd></dd>
                                        </dl>
                                    </div>
                                </div>
                                </div>

                                <div style="background-color: #b2dba1">
                                <div  style="margin-bottom: 30px;padding-top: 20px">
                                    <p style="font-size: medium;text-align:center">实验室排课表</p>
                                    <table class="table table-bordered table-condensed" style="margin: 5px auto;width: auto;height:auto;padding-bottom: 20px">
                                        <thead>
                                        <tr>
                                            <th style="text-align: center">日期</th>
                                            <th style="text-align: center">8:00-10:00</th>
                                            <th style="text-align: center">10:00-12:00</th>
                                            <th style="text-align: center">14:00-16:00</th>
                                            <th style="text-align: center">16:00-18:00</th>
                                            <th style="text-align: center">19:00-21:00</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${reservations}" var="res">
                                            <tr style="font-size: x-small;text-align: center;align-items: center">
                                                <td style="vertical-align: middle;padding: auto">${res.getReserve_date()}</td>
                                                <td style="padding: auto">
                                                    <c:if test="${res.getTime_interval()=='T1'}">
                                                        ${res.getCourseName()}<br/>
                                                        ${res.getDescription()}<br/>
                                                        ${res.getUser_name()}<br/>
                                                    </c:if>
                                                </td>
                                                <td style="padding: auto">
                                                    <c:if test="${res.getTime_interval()=='T2'}">
                                                        ${res.getCourseName()}<br/>
                                                        ${res.getDescription()}<br/>
                                                        ${res.getUser_name()}<br/>
                                                    </c:if>
                                                </td>
                                                <td style="padding: auto">
                                                    <c:if test="${res.getTime_interval()=='T3'}">
                                                        ${res.getCourseName()}<br/>
                                                        ${res.getDescription()}<br/>
                                                        ${res.getUser_name()}<br/>
                                                    </c:if>
                                                </td>
                                                <td style="padding: auto">
                                                    <c:if test="${res.getTime_interval()=='T4'}">
                                                        ${res.getCourseName()}<br/>
                                                        ${res.getDescription()}<br/>
                                                        ${res.getUser_name()}<br/>
                                                    </c:if>
                                                </td>
                                                <td style="padding: auto">
                                                    <c:if test="${res.getTime_interval()=='T5'}">
                                                        ${res.getCourseName()}<br/>
                                                        ${res.getDescription()}<br/>
                                                        ${res.getUser_name()}<br/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                </div>


                                    <div class="table-responsive" style="margin-top: 30px">
                                        <table class="table table-hover">
                                            <thead >
                                            <tr  >
                                                <th style="text-align: center">日期</th>
                                                <th style="text-align: center">8:00-10:00</th>
                                                <th style="text-align: center">10:00-12:00</th>
                                                <th style="text-align: center">14:00-16:00</th>
                                                <th style="text-align: center">16:00-18:00</th>
                                                <th style="text-align: center">19:00-21:00</th>
                                                <th style="text-align: center">预约</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            <%--                                          在jsp页面中：--%>

                                            <%--                                          <!-- 使用c标签库，循环遍历出数据 ，命名为c-->--%>
                                            <%--                                          <c:forEach items="cs"var="c"varStatus="st"><tr><td>{c.id}</td>--%>
                                            <%--                                              <td>${c.name}</td>--%>
                                            <%--                                          </tr>--%>
                                            <%--                                          </c:forEach>--%>

                                            <c:forEach items="${schedules}" var="sc">
                                                <tr style="text-align: center;font-size: small">
                                                    <td>${sc.getSchedule_date()}</td>
                                                    <td>${sc.getT1()}</td>
                                                    <td>${sc.getT2()}</td>
                                                    <td>${sc.getT3()}</td>
                                                    <td>${sc.getT4()}</td>
                                                    <td>${sc.getT5()}</td>
                                                    <td>
                                                        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#${sc.getSchedule_date()}">
                                                            预约
                                                        </button>
                                                    </td>
                                                </tr>
                                                <div class="modal fade" id="${sc.getSchedule_date()}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                                                <h4 class="modal-title" id="myModalLabel">创建预约</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="/user/submitReservation" method="post" onsubmit="return check()">
                                                                    <div style="text-align: center">
                                                                        <c:if test="${user.getUser_type()== 2}">
                                                                            <input  type="radio" name="reserve_type" id="reserve_type" value="1" checked="checked" style="margin-left: 20px;margin-right: 20px"/><label>个人预约</label>
                                                                            <input  type="radio" name="reserve_type" id="reserve_type" value="2" style="margin-left: 30px;margin-right: 20px"/><label>课堂预约</label>
                                                                        </c:if>
                                                                    </div>
                                                                    <div style="margin: 10px 50px">
                                                                    <div class="input-group" style="margin-top: 10px">
                                                                        <div class="input-group-btn">
                                                                            <label  class="btn  " >选择时段</label>
                                                                        </div>
                                                                        <select class="form-control" id="time_interval" name="time_interval" >
                                                                            <option value="0">请选择要预约的时间段</option>
                                                                            <option value="T1">8:00—10:00</option>
                                                                            <option value="T2">10:00-12:00</option>
                                                                            <option value="T3">14:00-16:00</option>
                                                                            <option value="T4">16:00-18:00</option>
                                                                            <option value="T5">19:00-21:00</option>
                                                                        </select>
                                                                    </div>
                                                                    <c:if test="${user.getUser_type()== 2}">
                                                                        <div class="input-group" style="margin-top: 20px">
                                                                            <div class="input-group-btn">
                                                                                <label  class="btn " >课程名称</label>
                                                                            </div>
                                                                            <input type="text" name="courseName" id="courseName" class="form-control"  placeholder="个人预约时不需要填写">
                                                                        </div>
                                                                    </c:if>
                                                                    <div>
                                                                        <div class="input-group" style="margin-top: 20px">
                                                                            <div class="input-group-btn">
                                                                                <label  class="btn " >备注信息</label>
                                                                            </div>
                                                                            <input type="text" name="description" id="description" class="form-control"  placeholder="填写与预约相关的其他信息">
                                                                        </div>
                                                                        <input type="hidden" id="schedule_date" name="schedule_date" value="${sc.getSchedule_date()}">
                                                                    </div>
                                                                </div>

                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                                    <button type="submit" class="btn btn-primary"  name="submit_reserve" id="submit_reserve">提交</button>
                                                                </div>
                                                            </form>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                            </tbody>
                                        </table>


                                    </div>

                                </div>


                            </div>
                        </div>

            </div>

        </main>
        <!--End 页面主要内容-->
    </div>
</div>

<%
    String res=(String)session.getAttribute("result");
    if(res!=null){
%>
<script type="text/javascript">
    alert("<%=res%>");
</script>

<% }%>

<%--<script type="text/javascript">--%>
<%--    $(function () {--%>
<%--        $("#submit_reserve").click(function () {--%>
<%--            var time=$("#time_interval option:selected").val();--%>
<%--            if(time === 0 ){--%>
<%--                alert("请选择要预约的时间段");--%>
<%--                return false;--%>
<%--            }--%>
<%--            if($("input[type='radio']:checked").val() === 2 && $("#courseName").val() === null ){--%>
<%--                alert("课程名称不能为空");--%>
<%--                return false;--%>
<%--            }--%>
<%--            return true;--%>
<%--        })--%>
<%--    })--%>

<%--</script>--%>