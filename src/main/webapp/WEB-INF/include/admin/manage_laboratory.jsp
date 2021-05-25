
<script>

    $(function(){

        // $('#edit').modal('show');
        // function values(user_num) {
        //     $('#username').val(user_num);
        // }

        $("#editLabInfo").bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                lab_name: {
                    message: '实验室名称不能为空',
                    validators: {
                        notEmpty: {
                            message: '实验室名称不能为空'
                        }
                    }
                },
                description: {
                    message: '实验室的简介不能为空',
                    validators: {
                        notEmpty: {
                            message: '实验室的简介不能为空'
                        }
                    }
                },
                lab_capacity: {
                    message: '实验室的最大容纳人数不能为空',
                    validators: {
                        notEmpty: {
                            message: '实验室的最大容纳人数不能为空'
                        }
                    }
                },
                mgr_num: {
                    message: '管理员工号不能为空',
                    validators: {
                        notEmpty: {
                            message: '管理员工号不能为空'
                        }
                    }
                },
                col_id: {
                    message: '实验室所属学院的编号不能为空',
                    validators: {
                        notEmpty: {
                            message: '实验室所属学院的编号不能为空'
                        }
                    }
                },
                statement: {
                    message: '实验室状态不能为空',
                    validators: {
                        notEmpty: {
                            message: '实验室状态不能为空'
                        }
                    }
                }
            }
        });
    });


    function editLab() {
        var EditLab = $('#${lab.getLab_id()}');
        var bootstrapValidator = $("#editLabInfo").data("bootstrapValidator");
        bootstrapValidator.validate();

        if (bootstrapValidator.isValid()) { // 模态框是否通过验证
            EditLab.modal('hide');
        }
        EditLab.on("hide.bs.modal", function() {
            $("#editLabInfo").bootstrapValidator('resetForm');
        });
    }

</script>

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
    function delAllLab() {
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
            $.get("/admin/remove_checked_lab", ids, function (data) {
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


    /*批量删除*/
    function AddAllLabSchedule() {
        var r = confirm("是否确认创建下一周日程？");
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
            $.get("/admin/add_checked_lab_schedule", ids, function (data) {
                if (data == "ok") {
                    alert("创建成功!");
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
                        <li class="nav-item "> <a href="/admin/manage_reservation"><i class="glyphicon glyphicon-list-alt icon"></i> 预约管理</a> </li>
                        <li class="nav-item nav-item-has-subnav active open">
                            <a href="javascript:void(0)"><i class="glyphicon glyphicon-th-large icon"></i>实验室管理</a>
                            <ul class="nav nav-subnav">
                                <li > <a href="/admin/addLaboratory" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-plus tubiao" ></i>   新增实验室</a> </li>
                                <li class="active"> <a href="/admin/manage_laboratory" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-asterisk tubiao"></i>    管理实验室</a> </li>
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
                                <h4>实验室管理</h4>
                            </div>
                            <div class="card-toolbar clearfix">
                            <form action="/admin/searchLaboratoryBySearch_text" method="post" class="pull-right search-bar" role="form">
                                <div class="input-group" >
                                    <input type="text"  name="search_text" class="form-control" style="border-color: black" placeholder="请输入关键词...">
                                    <span class="input-group-btn">
                                            <button class="btn btn-dark" type="submit">搜索</button>
                                        </span>
                                </div>
                            </form>
                            <div class="toolbar-btn-action">
                                <a class="btn btn-danger m-r-10   m-t-10"  onclick="delAllLab()"><i class="glyphicon glyphicon-minus "></i> 批量删除</a>
                                <a class="btn btn-warning m-r-10   m-t-10"  onclick="AddAllLabSchedule()"><i class="glyphicon glyphicon-minus "></i> 批量创建日程</a>
                                <a class="btn btn-secondary m-t-10" href="/admin/tomanage_laboratories" ><i class="glyphicon glyphicon-share-alt "></i> 返回所有实验室列表</a>
                                <div style="margin-top: 10px">
                                    <form action="/public/InputLabExcel" method="post" enctype="multipart/form-data">
                                        <input type="file" id="file" name="file" value="" style="border:1px solid lightgray;display: inline-block;width: auto"/>
                                        <button type="submit" class="btn  btn-primary m-l-5 m-t-5" style="display: inline-block;padding: 5px 8px"> 导入实验室</button>
                                    </form>
                                </div>
                                <p style="color:red;text-align: center;margin-top: 20px">${lab_info}</p>
                                <p style="color:red;text-align: center;margin-top: 20px">${add_lab_info}</p>
                                <p style="color:red;text-align: center">${error}</p>
                            </div>
                        </div>

                            <div class="card-body">

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
                                            <th style="text-align: center">实验室ID</th>
                                            <th style="text-align: center">地址</th>
                                            <th style="text-align: center">介绍</th>
                                            <th style="text-align: center">容量</th>
                                            <th style="text-align: center">管理员</th>
                                            <th style="text-align: center">管理员联系方式</th>
                                            <th style="text-align: center">状态</th>
                                            <th style="text-align: center">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${laboratoryPageInfo.list}" var="lab">
                                                <tr style="font-size: xx-small;text-align: center;align-items: center">
                                                    <td>
                                                        <label class="lyear-checkbox checkbox-primary" style="height:30px; line-height:30px">
                                                            <input type="checkbox" name="id" value="${lab.getLab_id()}"><span></span>
                                                        </label>
                                                    </td>
                                                    <td style="height:30px; line-height:30px">${lab.getId()}</td>
                                                    <td style="height:30px; line-height:30px">${lab.getLab_name()}</td>
                                                    <td style="height:30px; line-height:30px">${lab.getLab_id()}</td>
                                                    <td style="height:30px; line-height:30px"> ${lab.getLab_addr()}</td>
                                                    <td style="height:30px; line-height:30px">${lab.getDescription()}</td>
                                                    <td style="height:30px; line-height:30px">${lab.getLab_capacity()}</td>
                                                    <td style="height:30px; line-height:30px">${lab.getMgr_name()}</td>
                                                    <td style="height:30px; line-height:30px">${lab.getMgr_tel()}</td>
                                                    <td style="height:30px; line-height:30px">
                                                        <c:if test="${lab.getStatement()==1}">
                                                            <span class="label label-success" style="height:30px; line-height:30px">可使用</span>
                                                        </c:if>
                                                        <c:if test="${lab.getStatement()==2}">
                                                            <span class="label label-danger" style="height:30px; line-height:30px">暂停使用</span>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <div class="btn-group">
                                                            <button type="button" class="btn btn-xs btn-default" data-toggle="modal" data-target="#${lab.getLab_id()}">
                                                                    <%--                                                        <button type="button" class="btn btn-xs btn-default" data-toggle="modal" data-target="#edit" onclick="values(${stu.getUser_num()})">--%>
                                                                <i class="glyphicon glyphicon-pencil icon2"></i>
                                                            </button>
                                                                <%--                                                        <a class="btn btn-xs btn-default" href="#!" title="" data-toggle="tooltip" data-original-title="编辑"><i class="glyphicon glyphicon-pencil icon2"></i></a>--%>
                                                            <a class="btn btn-xs btn-default" href="/admin/removeLab?lab_id=${lab.getLab_id()}" title="" data-toggle="tooltip" data-original-title="删除"><i class="glyphicon glyphicon-trash icon2"></i></a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <div class="modal fade" id="${lab.getLab_id()}" tabindex="-1" role="dialog" aria-labelledby="myModal" style="display: none;" data-backdrop="static" data-keyboard="false">
                                                    <%--                                                <div class="modal fade" id="#edit" tabindex="-1" role="dialog" aria-labelledby="myModal" style="display: none;" data-backdrop="static" data-keyboard="false">--%>
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                                            <h4 class="modal-title" id="myModal">修改实验室信息</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="/admin/EditLabInfo" method="post" id="editLabInfo" >
                                                                <div>
                                                                    <div class="form-group" style="color:black;margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label class="btn control-label" for="lab_name" style="color:black;margin-right: 27px">名称</label>
                                                                        </div>
                                                                        <input type="text" name="lab_name" id="lab_name" class="form-control" placeholder="请输入实验室名称">
                                                                    </div>
                                                                    <div class="form-group" style="margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label class="btn control-label" for="lab_id" style="color:black;margin-right: 27px">ID</label>
                                                                        </div>
                                                                        <input type="text" name="lab_id" id="lab_id" class="form-control" readonly="readonly" value="${lab.getLab_id()}">
                                                                    </div>
                                                                    <div class="form-group" style="margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label  class="btn control-label" for="lab_addr" style="color:black;margin-right: 27px">地址</label>
                                                                        </div>
                                                                        <input type="text" name="lab_addr" id="lab_addr" class="form-control" readonly="readonly" value="${lab.getLab_addr()}">
                                                                    </div>
                                                                    <div class="form-group" style="margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label class="btn control-label" for="description" style="color:black;margin-right: 27px" >介绍</label>
                                                                        </div>
                                                                        <input type="text" name="description" id="description" class="form-control"  placeholder="请输入对于该实验室的简介">
                                                                    </div>
                                                                    <div class="form-group" style="margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label class="btn control-label" for="lab_capacity" style="color:black;margin-right: 12px">容量</label>
                                                                        </div>
                                                                        <input type="text" name="lab_capacity" id="lab_capacity" class="form-control"  placeholder="请输入该实验室的最大容纳人数">
                                                                    </div>
                                                                    <div class="form-group" style="margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label class="btn control-label" for="mgr_num" style="color:black">管理员</label>
                                                                        </div>
                                                                        <input type="text" name="mgr_num" id="mgr_num" class="form-control"  placeholder="请输入该实验室的管理员工号">
                                                                    </div>
                                                                    <div class="form-group" style="margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label class="btn control-label" for="col_id" style="color:black">所属学院</label>
                                                                        </div>
                                                                        <input type="text" name="col_id" id="col_id" class="form-control"  placeholder="请输入该实验室所属学院的编号">
                                                                    </div>
                                                                    <div class="form-group" style="margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label class="btn control-label" for="statement" style="color:black">状态</label>
                                                                        </div>
                                                                        <input type="text" name="statement" id="statement" class="form-control"  placeholder="请输入该实验室状态，1表示可使用，2表示暂停使用">
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                                    <button type="submit" class="btn btn-primary" onclick="editLab()" >提交</button>
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
                                <ul class="pagination">
                                    <span>第${laboratoryPageInfo.pageNum}/ ${laboratoryPageInfo.pages}页</span>
                                    <span>总记录数：${laboratoryPageInfo.total}  每页显示:10</span>
                                    <li><a href="/admin/manage_laboratory?page=1&size=10" aria-label="Previous">首页</a></li>
                                    <li><a href="/admin/manage_laboratory?page=${laboratoryPageInfo.pageNum-1}&size=10">上一页</a></li>

                                    <li><a href="/admin/manage_laboratory?page=${laboratoryPageInfo.pageNum+1}&size=10">下一页</a></li>
                                    <li><a href="/admin/manage_laboratory?page=${laboratoryPageInfo.pages}&size=10" aria-label="Next">尾页</a></li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

