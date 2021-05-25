

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>


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
                        <li class="nav-item active "> <a href="/user/reservation"><i class="glyphicon glyphicon-list-alt icon"></i> 我的预约</a> </li>
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
                                <h4>我的预约</h4>
                                <p style="color:red;text-align: center">${info}</p>

                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                     <table class="table table-hover">
                                          <thead >
                                               <tr >
                                                   <th style="text-align: center">#</th>
                                                   <th style="text-align: center">实验室名称</th>
                                                   <th style="text-align: center">实验室地址</th>
                                                   <th style="text-align: center">学院</th>
                                                   <th style="text-align: center">预约日期</th>
                                                   <th style="text-align: center">时段</th>
                                                   <th style="text-align: center">备注</th>
                                                   <th style="text-align: center">状态</th>
                                                   <th style="text-align: center">取消</th>

                                               </tr>
                                          </thead>
                                          <tbody>

<%--                                          在jsp页面中：--%>

<%--                                          <!-- 使用c标签库，循环遍历出数据 ，命名为c-->--%>
<%--                                          <c:forEach items="cs"var="c"varStatus="st"><tr><td>{c.id}</td>--%>
<%--                                              <td>${c.name}</td>--%>
<%--                                          </tr>--%>
<%--                                          </c:forEach>--%>

                                            <c:forEach items="${reservations}" var="res">
                                               <tr style="font-size: small;align-items: center;text-align: center">
                                                   <td>${res.getId()}</td>
                                                   <td>${res.getLab_name()}</td>
                                                   <td>${res.getLab_addr()}</td>
                                                   <td>${res.getCol_name()}</td>
                                                   <td>${res.getReserve_date()}</td>
                                                   <td>${res.getTime_interval()}</td>
                                                   <td>${res.getDescription()}</td>
                                                   <td>
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
                                                       <div class="btn-group">
                                                           <a class="btn btn-sm btn-default" href="/user/cancelReservation?reserve_id=${res.getReserve_id()}&reserve_type=${res.getReserve_type()}&schedule_date=${res.getReserve_date()}&time_interval=${res.getTime_interval()}&lab_name=${res.getLab_name()} "
                                                                        title="" data-toggle="tooltip" data-original-title="取消"><i class="glyphicon glyphicon-trash icon2"></i></a>
                                                       </div>
                                                   </td>


                                               </tr>
                                            </c:forEach>
                                          </tbody>
                                     </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--End 页面主要内容-->
</div>
</div>