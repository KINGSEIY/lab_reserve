

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>


<div class="lyear-layout-web" >
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">
            <div class="sidebar-header bg-primary">
                <p>实验室预约系统</p>
            </div>
            <div class="lyear-layout-sidebar-scroll " style="background-color:#8b95a5">

                <nav class="sidebar-main">
                    <ul class="nav nav-drawer ">
                        <li class="nav-item "> <a href="/user/info"><i class="glyphicon glyphicon-user icon"></i> 我的信息</a> </li>
                        <li class="nav-item  "> <a href="/user/reservation"><i class="glyphicon glyphicon-list-alt icon"></i> 我的预约</a> </li>
                        <li class="nav-item active "> <a href="/public/announcement"><i class="glyphicon glyphicon-comment  icon"></i> 公告信息</a> </li>
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
                                <h4>公告信息</h4>
                                <p style="color:red;text-align: center">${error}</p>
                            </div>
                            <div class="example-box" style="margin: 5px 20px">
                                <p>
                                    <a href="/user/searchAnnouncement?col_id=1">
                                        <input  type="button" class="btn  btn-w-lg btn-sm btn-round btn-dark" name="col_id"  value="轻工科学与工程学院">
                                    </a>
                                    <a href="/user/searchAnnouncement?col_id=2">
                                        <input  type="button" class="btn  btn-w-lg btn-sm btn-round btn-yellow" name="col_id"  value="材料科学与工程学院" >
                                    </a>
                                    <a href="/user/searchAnnouncement?col_id=3">
                                        <input  type="button" class="btn  btn-w-lg btn-sm btn-round btn-cyan" name="col_id"  value="环境科学与工程学院">
                                    </a>
                                    <a href="/user/searchAnnouncement?col_id=4">
                                        <input  type="button" class="btn  btn-w-lg btn-sm btn-round btn-danger" name="col_id"  value="食品与生物工程学院">
                                    </a>
                                    <a href="/user/searchAnnouncement?col_id=5">
                                        <input  type="button" class="btn  btn-w-lg btn-sm btn-round btn-secondary" name="col_id"  value="机电工程学院">
                                    </a>
                                    <a href="/user/searchAnnouncement?col_id=6">
                                        <input  type="button" class="btn  btn-w-lg btn-sm btn-round btn-success" name="col_id"  value="电气与控制工程学院">
                                    </a>
                                    <a href="/user/searchAnnouncement?col_id=7">
                                        <input  type="button" class="btn  btn-w-lg btn-sm btn-round btn-warning" name="col_id"  value="电子信息与人工智能学院">
                                    </a>
                                    <a href="/user/searchAnnouncement?col_id=8">
                                        <input  type="button" class="btn  btn-w-lg btn-sm btn-round btn-brown" name="col_id"  value="经济与管理学院">
                                    </a>
                                    <a href="/user/searchAnnouncement?col_id=9">
                                        <input  type="button" class="btn  btn-w-lg btn-sm btn-round btn-pink" name="col_id"  value="化学与化工学院">
                                    </a>
                                    <a href="/user/searchAnnouncement?col_id=10">
                                        <input  type="button" class="btn  btn-w-lg btn-sm btn-round btn-purple" name="col_id"  value="设计与艺术学院">
                                    </a>
                                </p>
                            </div>
                            <div class="card-body">
                                <div class="row">

                                    <c:forEach items="${announcements}" var="annos">
                                        <c:if test="${annos.getCol_id()==1}">
                                            <div class="col-sm-6 col-lg-3">
                                                <div class="card">
                                                    <div class="card-header bg-dark">
                                                        <h4>${annos.getTitle()}</h4>
                                                        <ul class="card-actions">
                                                            <li>
                                                                <p class="mdi-format-float-right">${annos.getMgr_name()}</p>
                                                            </li>
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
                                            <div class="col-sm-6 col-lg-3">
                                                <div class="card">
                                                    <div class="card-header bg-yellow">
                                                        <h4>${annos.getTitle()}</h4>
                                                        <ul class="card-actions">
                                                            <li>
                                                                <p class="mdi-format-float-right">${annos.getMgr_name()}</p>
                                                            </li>
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
                                            <div class="col-sm-6 col-lg-3">
                                                <div class="card">
                                                    <div class="card-header bg-cyan">
                                                        <h4>${annos.getTitle()}</h4>
                                                        <ul class="card-actions">
                                                            <li>
                                                                <p class="mdi-format-float-right">${annos.getMgr_name()}</p>
                                                            </li>
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
                                            <div class="col-sm-6 col-lg-3">
                                                <div class="card">
                                                    <div class="card-header bg-danger">
                                                        <h4>${annos.getTitle()}</h4>
                                                        <ul class="card-actions">
                                                            <li>
                                                                <p class="mdi-format-float-right">${annos.getMgr_name()}</p>
                                                            </li>
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
                                            <div class="col-sm-6 col-lg-3">
                                                <div class="card">
                                                    <div class="card-header bg-secondary">
                                                        <h4>${annos.getTitle()}</h4>
                                                        <ul class="card-actions">
                                                            <li>
                                                                <p class="mdi-format-float-right">${annos.getMgr_name()}</p>
                                                            </li>
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
                                        <div class="col-sm-6 col-lg-3">
                                            <div class="card">
                                                <div class="card-header bg-success">
                                                    <h4>${annos.getTitle()}</h4>
                                                    <ul class="card-actions">
                                                        <li>
                                                            <p class="mdi-format-float-right">${annos.getMgr_name()}</p>
                                                        </li>
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
                                            <div class="col-sm-6 col-lg-3">
                                                <div class="card">
                                                    <div class="card-header bg-warning">
                                                        <h4>${annos.getTitle()}</h4>
                                                        <ul class="card-actions">
                                                            <li>
                                                                <p class="mdi-format-float-right">${annos.getMgr_name()}</p>
                                                            </li>
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
                                            <div class="col-sm-6 col-lg-3">
                                                <div class="card">
                                                    <div class="card-header bg-brown">
                                                        <h4>${annos.getTitle()}</h4>
                                                        <ul class="card-actions">
                                                            <li>
                                                                <p class="mdi-format-float-right">${annos.getMgr_name()}</p>
                                                            </li>
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
                                            <div class="col-sm-6 col-lg-3">
                                                <div class="card">
                                                    <div class="card-header bg-pink">
                                                        <h4>${annos.getTitle()}</h4>
                                                        <ul class="card-actions">
                                                            <li>
                                                                <p class="mdi-format-float-right">${annos.getMgr_name()}</p>
                                                            </li>
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
                                            <div class="col-sm-6 col-lg-3">
                                                <div class="card">
                                                    <div class="card-header bg-purple">
                                                        <h4>${annos.getTitle()}</h4>
                                                        <ul class="card-actions">
                                                            <li>
                                                                <p class="mdi-format-float-right">${annos.getMgr_name()}</p>
                                                            </li>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--End 页面主要内容-->
    </div>
</div>
