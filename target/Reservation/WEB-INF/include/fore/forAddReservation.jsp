
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
                        <li class="nav-item "> <a href="/user/reservation"><i class="glyphicon glyphicon-list-alt icon"></i> 我的预约</a> </li>
                        <li class="nav-item "> <a href="/public/announcement"><i class="glyphicon glyphicon-comment  icon"></i> 公告信息</a> </li>
                        <li class="nav-item active "> <a href="/user/addReservation"><i class="glyphicon glyphicon-plus  icon"></i> 新建预约</a> </li>
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
                            <div class="card-header" style="display: inline-block">
                                <h4 style="display: inline-block">新建预约</h4>
                                <div style="display: inline-block;margin-left: 100px">
                                    <span style="color:lightslategrey;padding-bottom: 15px">提示：请通过输入关键字搜索或通过选择部分选项进行搜索，可对未来一周实验室的使用进行预约</span>
                                </div>
                            </div>

                            <div class="card-body">
                                <div style="padding-bottom: 20px;border-bottom: solid 1px #e5e5e5">

                                        <h5 style="color: black">实验室查找</h5>
                                        <br/>
                                        <div class="row" style="margin-left: 3px">
                                            <div class="col-lg-6 col-md-6 col-sm-11 col-xs-11" >
                                                <form action="/user/searchLaboratoryBySearch_text" method="post" >
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

                                    <form action="/user/searchLaboratory" method="post" >
                                        <div class="row" style="margin-left: 3px">
                                            <div class="col-lg-6 col-md-6 col-sm-7 col-xs-7" >
                                                <div class="input-group" >
                                                    <div style="display: inline-block;margin-left: 50px;margin-top: 10px">
                                                        <span style="color:lightslategrey;padding-bottom: 15px;padding-top: 10px;">提示：以下选择可不选择或选择输入某几项内容进行查找</span>
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
                                            <div class="col-md-6" style="margin-top:20px">
                                                <div class="input-group">
                                                    <div class="input-group-btn">
                                                        <label  class="btn btn-dark " >学院</label>
                                                    </div>
                                                    <select class="form-control" id="col_id" name="col_id"  style="border-color: black">
                                                        <option value="0">请选择学院</option>
                                                        <option value="1">轻工科学与工程学院</option>
                                                        <option value="2">材料科学与工程学院</option>
                                                        <option value="3">环境科学与工程学院</option>
                                                        <option value="4">食品与生物工程学院</option>
                                                        <option value="5">机电工程学院</option>
                                                        <option value="6">电气与控制工程学院</option>
                                                        <option value="7">电子信息与人工智能学院</option>
                                                        <option value="8">经济与管理学院</option>
                                                        <option value="9">化学与化工学院</option>
                                                        <option value="10">设计与艺术学院	</option>
                                                        <option value="11">文理学院</option>
                                                        <option value="12">继续教育学院</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-6" style="margin-top:20px">
                                                <div class="input-group">
                                                    <div class="input-group-btn">
                                                        <label  class="btn btn-dark " >实验室名称</label>
                                                    </div>
                                                    <input type="text" name="lab_name"  id="lab_name"  class="form-control" style="border-color: black" placeholder="请输入实验室名称">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row" style="margin:0">
                                            <div class="col-md-6" style="margin-top:20px">

                                                <div class="input-group">
                                                    <div class="input-group-btn">
                                                        <label  class="btn btn-dark " >实验室编号</label>
                                                    </div>
                                                    <input type="text" name="lab_id" id="lab_id" class="form-control" style="border-color: black" placeholder="请输入实验室编号">
                                                </div>
                                            </div>

                                            <div class="col-md-6" style="margin-top:20px">
                                                <div class="input-group">
                                                    <div class="input-group-btn">
                                                        <label  class="btn btn-dark " >实验室状态</label>
                                                    </div>
                                                    <select class="form-control" id="statement" name="statement" style="border-color: black">
                                                        <option value="0">请选择要搜索的实验室状态</option>
                                                        <option value="0">全部</option>
                                                        <option value="1">可使用</option>
                                                        <option value="2">已禁用</option>
                                                    </select>
                                                </div>
                                            </div>

                                        </div>
                                    </form>



                                </div>

                            </div>
                                <div>
                                    <c:forEach items="${laboratories}" var="lab">
                                        <div class="media" style="margin: 10px 2px;border-bottom: #0FB25F dashed 1px">

                                            <div class="col-sm-9 col-xs-9 col-md-9 col-lg-9" style="padding-right: 5px">
                                                <h4 class="media-heading" style="margin-bottom: 10px" id="media-heading">${lab.getLab_name()}</h4>
                                                <div class="row">
                                                    <div class=" col-sm-2 col-xs-2 col-md-2 col-lg-2" style="padding:0">
                                                        <div class="media-center" style="text-align: center;margin-top:50px ">
                                                            <c:if test="${lab.getCol_id()==1}">
                                                                <input type="button" class="btn btn-dark btn-round"  style="width:37.9px" value="">
                                                            </c:if>
                                                            <c:if test="${lab.getCol_id()==2}">
                                                                <input type="button" class="btn btn-yellow btn-round"  style="width:37.9px" value="">
                                                            </c:if>
                                                            <c:if test="${lab.getCol_id()==3}">
                                                                <input type="button" class="btn btn-cyan btn-round"  style="width:37.9px" value="">
                                                            </c:if>
                                                            <c:if test="${lab.getCol_id()==4}">
                                                                <input type="button" class="btn btn-danger btn-round"  style="width:37.9px" value="">
                                                            </c:if>
                                                            <c:if test="${lab.getCol_id()==5}">
                                                                <input type="button" class="btn btn-secondary btn-round"  style="width:37.9px" value="">
                                                            </c:if>
                                                            <c:if test="${lab.getCol_id()==6}">
                                                                <input type="button" class="btn btn-success btn-round"  style="width:37.9px" value="">
                                                            </c:if>
                                                            <c:if test="${lab.getCol_id()==7}">
                                                                <input type="button" class="btn btn-warning btn-round"  style="width:37.9px" value="">
                                                            </c:if>
                                                            <c:if test="${lab.getCol_id()==8}">
                                                                <input type="button" class="btn btn-brown btn-round"  style="width:37.9px" value="">
                                                            </c:if>
                                                            <c:if test="${lab.getCol_id()==9}">
                                                                <input type="button" class="btn btn-pink btn-round"  style="width:37.9px" value="">
                                                            </c:if>
                                                            <c:if test="${lab.getCol_id()==10}">
                                                                <input type="button" class="btn btn-purple btn-round"  style="width:37.9px" value="">
                                                            </c:if>
                                                            <c:if test="${lab.getCol_id()==11}">
                                                                <input type="button" class="btn btn-success btn-round"  style="width:37.9px" value="">
                                                            </c:if>
                                                            <c:if test="${lab.getCol_id()==12}">
                                                                <input type="button" class="btn btn-success btn-round"  style="width:37.9px" value="">
                                                            </c:if>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-10 col-xs-10 col-md-10 col-lg-10" style="padding-right:5px;padding-left: 0">
                                                        <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 bs-ib-wrap" style="display: inline-block;padding-right:5px">
                                                            <dl class="dl-horizontal">
                                                                <dt>实验室简介：</dt>
                                                                <dd>${lab.getDescription()}</dd>
                                                            </dl>
                                                        </div>
                                                        <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 bs-ib-wrap " style="display: inline-block;padding-right: 0">
                                                            <dl class="dl-horizontal">
                                                                <dt>所属学院：</dt>
                                                                <dd>${lab.getCol_name()}</dd>
                                                            </dl>
                                                        </div>
                                                        <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 bs-ib-wrap" style="display: inline-block;padding-right: 0">
                                                            <dl class="dl-horizontal">
                                                                <dt>地址：</dt>
                                                                <dd>${lab.getLab_addr()}</dd>
                                                            </dl>
                                                        </div>
                                                        <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 bs-ib-wrap" style="display: inline-block;padding-right: 0">
                                                            <dl class="dl-horizontal">
                                                                <dt>管理员-联系方式：</dt>
                                                                <dd>${lab.getMgr_name()}—${lab.getMgr_tel()}</dd>
                                                            </dl>
                                                        </div>
                                                        <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 bs-ib-wrap" style="display: inline-block;padding-right: 0">
                                                            <dl class="dl-horizontal">
                                                                <dt>最大可预约数：</dt>
                                                                <dd>${lab.getLab_capacity()}</dd>
                                                            </dl>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-3 col-xs-3 col-md-3 col-lg-3" style="padding-left:3px">
                                                <c:if test="${lab.getStatement()==1}">
                                                    <a  href="/user/toCreateReservation?lab_id=${lab.getLab_id()}"  methods="post"><input type="button"  class=" btn btn-success " style="align-items: center;margin-top: 50px;border-radius: 10px;margin-right: 20px"  value="点击预约"></a>
                                                </c:if>
                                                <c:if test="${lab.getStatement()==2}">
                                                    <input  type="button" style="align-items: center;margin-top: 50px;border-radius: 10px;margin-right: 20px"  class=" btn btn-danger "  value="暂停使用">
                                                </c:if>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                </div>
            </div>

        </main>
        <!--End 页面主要内容-->
    </div>
</div>
