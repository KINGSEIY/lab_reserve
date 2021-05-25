
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<script>

    $(function(){

        // $('#edit').modal('show');
        // function values(user_num) {
        //     $('#username').val(user_num);
        // }

        $("#editMgrInfo").bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                mgr_name: {
                    message: '姓名不能为空',
                    validators: {
                        notEmpty: {
                            message: '姓名不能为空'
                        }
                    }
                },
                mgr_num: {
                    message: '工号不能为空',
                    validators: {
                        notEmpty: {
                            message: '工号不能为空'
                        }
                    }
                },
                col_name: {
                    message: '学院不能为空',
                    validators: {
                        notEmpty: {
                            message: '学院不能为空'
                        }
                    }
                }
            }
        });
    });



    function editMgr() {
        var EditMgr = $('#${mgr.getMgr_num()}');
        var bootstrapValidator = $("#editMgrInfo").data("bootstrapValidator");
        bootstrapValidator.validate();

        if (bootstrapValidator.isValid()) { // 模态框是否通过验证
            EditMgr.modal('hide');
        }
        EditMgr.on("hide.bs.modal", function() {
            $("#editMgrInfo").bootstrapValidator('resetForm');
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
            $.get("/public/remove_checked_mgr", ids, function (data) {
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
                        <li class="nav-item active "> <a href="/public/manage_manager"><i class="glyphicon glyphicon-cog icon"></i> 管理员列表</a> </li>
                        <li class="nav-item "> <a href="/public/add_manager"><i class="glyphicon glyphicon-add icon"></i> 添加管理员</a> </li>
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
                            <div class="card-toolbar clearfix">
                                <form action="/public/searchAdminBySearch_text" method="post" class="pull-right search-bar" role="form">
                                    <div class="input-group" >
                                        <input type="text"  name="search_text" class="form-control" style="border-color: black" placeholder="请输入关键词...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-dark" type="submit">搜索</button>
                                        </span>
                                    </div>
                                </form>
                                <div class="toolbar-btn-action">
                                    <a class="btn btn-danger" id="delAll" onclick="delAll()" ><i class="glyphicon glyphicon-minus "></i> 批量删除</a>
                                    <a class="btn btn-secondary m-l-5 m-t-5" href="/public/tomanage_manager" ><i class="glyphicon glyphicon-share-alt "></i> 返回所有管理员列表</a>

                                    <div style="margin-top: 10px">
                                        <form action="/public/InputAdminExcel" method="post" enctype="multipart/form-data">
                                            <input type="file" id="file" name="file" value="" style="border:1px solid lightgray;display: inline-block;width: auto"/>
                                            <button type="submit" class="btn  btn-primary m-l-5 m-t-5" style="display: inline-block;padding: 5px 8px"> 导入</button>
                                        </form>
                                    </div>
                                </div>
                                <div>
                                    <p style="color:red;text-align: center;margin-top: 20px">${admin_info}</p>
                                    <p style="color:red;text-align: center">${error}</p>
                                    <p style="color:red;text-align: center">${add_mgr_info}</p>
                                </div>
                            </div>

                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead style="font-size: small;">
                                        <tr>
                                            <th>
                                                <label class="lyear-checkbox checkbox-primary">
                                                    <input type="checkbox" id="check-all"><span></span>
                                                </label>
                                            </th>
                                            <th style="text-align: center">编号</th>
                                            <th style="text-align: center">工号</th>
                                            <th style="text-align: center">姓名</th>
                                            <th style="text-align: center">联系方式</th>
                                            <th style="text-align: center">学院</th>
                                            <th style="text-align: center">邮箱</th>

                                            <th style="text-align: center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${adminPage.list}" var="mgr">
                                        <tr style="font-size: x-small;text-align: center">
                                            <td>
                                                <label class="lyear-checkbox checkbox-primary">
                                                    <input type="checkbox" name="id" value="${mgr.getMgr_num()}"><span></span>
                                                </label>
                                            </td>
                                            <td>${mgr.getId()}</td>
                                            <td>${mgr.getMgr_num()}</td>
                                            <td>${mgr.getMgr_name()}</td>
                                            <td>${mgr.getMgr_tele()}</td>
                                            <td>${mgr.getCol_name()}</td>
                                            <td>${mgr.getMgr_email()}</td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-xs btn-default" data-toggle="modal" data-target="#${mgr.getMgr_num()}">
                                                            <%--                                                        <button type="button" class="btn btn-xs btn-default" data-toggle="modal" data-target="#edit" onclick="values(${stu.getUser_num()})">--%>
                                                        <i class="glyphicon glyphicon-pencil icon2"></i>
                                                    </button>
                                                        <%--                                                        <a class="btn btn-xs btn-default" href="#!" title="" data-toggle="tooltip" data-original-title="编辑"><i class="glyphicon glyphicon-pencil icon2"></i></a>--%>
                                                    <a class="btn btn-xs btn-default" href="/public/removeAdmin?mgr_num=${mgr.getMgr_num()}" title="" data-toggle="tooltip" data-original-title="删除"><i class="glyphicon glyphicon-trash icon2"></i></a>
                                                </div>

                                            </td>
                                        </tr>

                                        <div class="modal fade" id="${mgr.getMgr_num()}" tabindex="-1" role="dialog" aria-labelledby="myModal" style="display: none;" data-backdrop="static" data-keyboard="false">
                                                <%--                                                <div class="modal fade" id="#edit" tabindex="-1" role="dialog" aria-labelledby="myModal" style="display: none;" data-backdrop="static" data-keyboard="false">--%>
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                                        <h4 class="modal-title" id="myModal">修改管理员信息</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="/public/EditMgrInfo" method="post" id="editMgrInfo" >
                                                            <div>
                                                                <div class="form-group" style="color:black;margin: 10px 30px">
                                                                    <div class="input-group-btn">
                                                                        <label class="btn control-label" for="mgr_name" style="color:black;margin-right: 27px">姓名</label>
                                                                    </div>
                                                                    <input type="text" name="mgr_name" id="mgr_name" class="form-control" placeholder="请输入管理员姓名">
                                                                </div>
                                                                <div class="form-group" style="margin: 10px 30px">
                                                                    <div class="input-group-btn">
                                                                        <label class="btn control-label" for="mgr_num" style="color:black;margin-right: 27px">工号</label>
                                                                    </div>
                                                                    <input type="text" name="mgr_num" id="mgr_num" class="form-control" readonly="readonly" value="${mgr.getMgr_num()}">
                                                                </div>
                                                                <div class="form-group" style="margin: 10px 30px">
                                                                    <div class="input-group-btn">
                                                                        <label  class="btn control-label" for="col_name" style="color:black;margin-right: 27px">负责学院</label>
                                                                    </div>
                                                                    <input type="text" name="col_name" id="col_name" class="form-control"  placeholder="请输入管理员负责学院">
                                                                </div>

                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                                <button type="submit" class="btn btn-primary" onclick="editMgr()" >提交</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                        </tbody>

                                    </table>
                                </div>

                                <%--                                分页，未实现，下面只是样子--%>
                                <ul class="pagination">
                                    <span>第${adminPage.pageNum}/ ${adminPage.pages}页</span>
                                    <span>总记录数：${adminPage.total}  每页显示:10</span>
                                    <li><a href="/public/manage_manager?page=1&size=10" aria-label="Previous">首页</a></li>
                                    <li><a href="/public/manage_manager?page=${adminPage.pageNum-1}&size=10">上一页</a></li>

                                    <li><a href="/public/manage_manager?page=${adminPage.pageNum+1}&size=10">下一页</a></li>
                                    <li><a href="/public/manage_manager?page=${adminPage.pages}&size=10" aria-label="Next">尾页</a></li>

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


