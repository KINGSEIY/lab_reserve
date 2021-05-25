
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<script>

    $(function(){
        $("#modalform").bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                user_name: {
                    message: '姓名不能为空',
                    validators: {
                        notEmpty: {
                            message: '姓名不能为空'
                        }
                    }
                },
                user_num: {
                    message: '学号不能为空',
                    validators: {
                        notEmpty: {
                            message: '学号不能为空'
                        }
                    }
                },
                sex: {
                    message: '性别不能为空',
                    validators: {
                        notEmpty: {
                            message: '性别不能为空'
                        }
                    }
                },
                dept: {
                    message: '用户所在系不能为空',
                    validators: {
                        notEmpty: {
                            message: '用户所在系不能为空'
                        }
                    }
                },
                sClass: {
                    message: '用户所在班级不能为空',
                    validators: {
                        notEmpty: {
                            message: '用户所在班级不能为空'
                        }
                    }
                }
            }
        });
    });

    function addUser() {
        var AddUser = $('#AddUser');
        var bootstrapValidator = $("#modalform").data("bootstrapValidator");
        bootstrapValidator.validate();

        if (bootstrapValidator.isValid()) { // 模态框是否通过验证
            AddUser.modal('hide');
        }
        AddUser.on("hide.bs.modal", function() {
            $("#modalform").bootstrapValidator('resetForm');
        });
    }




</script>


<script>

    $(function(){

        // $('#edit').modal('show');
        // function values(user_num) {
        //     $('#username').val(user_num);
        // }

        $("#editStudentInfo").bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {
                    message: '姓名不能为空',
                    validators: {
                        notEmpty: {
                            message: '姓名不能为空'
                        }
                    }
                },
                usernum: {
                    message: '学号不能为空',
                    validators: {
                        notEmpty: {
                            message: '学号不能为空'
                        }
                    }
                },
                usersex: {
                    message: '性别不能为空',
                    validators: {
                        notEmpty: {
                            message: '性别不能为空'
                        }
                    }
                },
                userdept: {
                    message: '用户所在系不能为空',
                    validators: {
                        notEmpty: {
                            message: '用户所在系不能为空'
                        }
                    }
                },
                usersClass: {
                    message: '用户所在班级不能为空',
                    validators: {
                        notEmpty: {
                            message: '用户所在班级不能为空'
                        }
                    }
                },
                colname: {
                    message: '用户所在学院不能为空',
                    validators: {
                        notEmpty: {
                            message: '用户所在学院不能为空'
                        }
                    }
                },
                usersCol_id: {
                    message: '用户所在学院的编号不能为空',
                    validators: {
                        notEmpty: {
                            message: '用户所在学院的编号不能为空'
                        }
                    }
                }
            }
        });
    });



    function editUser() {
        var EditUser = $('#${stu.getUser_num()}');
        var bootstrapValidator = $("#editStudentInfo").data("bootstrapValidator");
        bootstrapValidator.validate();

        if (bootstrapValidator.isValid()) { // 模态框是否通过验证
            EditUser.modal('hide');
        }
        EditUser.on("hide.bs.modal", function() {
            $("#editStudentInfo").bootstrapValidator('resetForm');
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
           $.get("/admin/remove_checked_user", ids, function (data) {
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
                        <li class="nav-item  "> <a href="/admin/adminInfo"><i class="glyphicon glyphicon-user icon"></i> 我的信息</a> </li>
                        <li class="nav-item nav-item-has-subnav active open">
                            <a href="javascript:void(0)"><i class=" glyphicon glyphicon-cog icon"></i> 管理用户</a>
                            <ul class="nav nav-subnav">
                                <li class="active"> <a href="/admin/manage_students" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-magnet tubiao"></i>   管理学生</a> </li>
                                <li > <a href="/admin/manage_teachers" style="font-size: 15px;margin-left: 10px"><i class="glyphicon glyphicon-music tubiao"></i>   管理教师</a> </li>
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
                <%--                  显示此管理员所在学院的所有学生信息，管理员具有删除教师和增加学生的权限--%>

                <div class="row">

                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-toolbar clearfix">
                                <form action="/admin/searchUserBySearch_text" method="post" class="pull-right search-bar" role="form">
                                    <div class="input-group" >
                                        <input type="text"  name="search_text" class="form-control" style="border-color: black" placeholder="请输入关键词...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-dark" type="submit">搜索</button>
                                        </span>
                                    </div>
                                </form>
                                <div class="toolbar-btn-action">
                                    <button type="button" class="btn btn-primary m-r-5" data-toggle="modal" data-target="#AddUser">
                                        <i class="glyphicon glyphicon-plus " ></i> 新增
                                    </button>
                                    <a class="btn btn-danger" id="delAll" onclick="delAll()" ><i class="glyphicon glyphicon-minus "></i> 批量删除</a>
                                    <a class="btn btn-secondary m-l-5 m-t-5" href="/admin/tomanage_students" ><i class="glyphicon glyphicon-share-alt "></i> 返回所有学生列表</a>

                                    <div style="margin-top: 10px">
                                    <form action="/public/InputStuExcel" method="post" enctype="multipart/form-data">
                                        <input type="file" id="file" name="file" value="" style="border:1px solid lightgray;display: inline-block;width: auto"/>
                                        <button type="submit" class="btn  btn-primary m-l-5 m-t-5" style="display: inline-block;padding: 5px 8px"> 导入</button>
                                    </form>
                                </div>
                                </div>
                                <div>
                                    <p style="color:red;text-align: center;margin-top: 20px">${st_info}</p>
                                    <p style="color:red;text-align: center;margin-top: 20px">${add_info}</p>
                                    <p style="color:red;text-align: center">${error}</p>
                                    <p style="color:red;text-align: center">${info}</p>
                                </div>
                                <div class="modal fade" id="AddUser" tabindex="-1" data-backdrop="static" data-keyboard="false"  role="dialog" aria-labelledby="myModalLabel" style="display: none;">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form action="/admin/AddStudent" method="post" role="form" id="modalform" autocomplete="off">
                                                    <div>
                                                        <div class="form-group" style="margin: 10px 30px ">
                                                            <div class="input-group-btn">
                                                                <label class="btn m-r-10 control-label" for="user_name" style="color:black">姓名</label>
                                                            </div>
                                                            <input type="text" name="user_name" id="user_name" class="form-control"  placeholder="填写用户姓名">
                                                        </div>
                                                        <div class="form-group" style="margin: 10px 30px" >
                                                            <div class="input-group-btn">
                                                                <label class="btn m-r-10 control-label" for="user_num" style="color:black">学号</label>
                                                            </div>
                                                            <input type="text" name="user_num" id="user_num" class="form-control"  placeholder="填写用户学号">
                                                        </div>
                                                        <div class="form-group" style="margin: 10px 30px">
                                                            <div class="input-group-btn">
                                                                <label class="btn m-r-10 control-label" for="sex"  style="color:black">性别</label>
                                                            </div>
                                                            <input type="text" name="sex" id="sex" class="form-control"  placeholder="填写用户性别">
                                                        </div>
                                                        <div class="form-group" style="margin: 10px 30px">
                                                            <div class="input-group-btn">
                                                                <label class="btn control-label" for="dept" style="color:black">所在系</label>
                                                            </div>
                                                            <input type="text" name="dept" id="dept" class="form-control"  placeholder="填写用户所在系">
                                                        </div>
                                                        <div class="form-group" style="margin: 10px 30px">
                                                            <div class="input-group-btn">
                                                                <label  class="btn m-r-10 control-label" for="sClass" style="color:black">班级</label>
                                                            </div>
                                                            <input type="text" name="sClass" id="sClass" class="form-control"  placeholder="填写用户班级">
                                                        </div>
                                                        <input type="hidden" id="col_id" name="col_id" value="${admin.getCol_id()}">
                                                        <input type="hidden" id="col_name" name="col_name" value="${admin.getCol_name()}">
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                        <button type="submit" class="btn btn-primary" >提交</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
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
                                            <th style="text-align: center">姓名</th>
                                            <th style="text-align: center">性别</th>
                                            <th style="text-align: center">学号</th>
                                            <th style="text-align: center">学院</th>
                                            <th style="text-align: center">所在系</th>
                                            <th style="text-align: center">班级</th>
                                            <%--                                            <th>预约次数</th>--%>
                                            <%--                                            <th>取消次数</th>--%>
                                            <th style="text-align: center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${userPage.list}" var="stu">
                                            <tr style="font-size: x-small;text-align: center">
                                                <td>
                                                    <label class="lyear-checkbox checkbox-primary">
                                                        <input type="checkbox" name="id" value="${stu.getUser_num()}"><span></span>
                                                    </label>
                                                </td>
                                                <td>${stu.getId()}</td>
                                                <td>${stu.getUser_name()}</td>
                                                <td>${stu.getSex()}</td>
                                                <td>${stu.getUser_num()}</td>
                                                <td>${stu.getCol_name()}</td>
                                                <td>${stu.getDept()}</td>
                                                <td>${stu.getsClass()}</td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button type="button" class="btn btn-xs btn-default" data-toggle="modal" data-target="#${stu.getUser_num()}">
                                                                <%--                                                        <button type="button" class="btn btn-xs btn-default" data-toggle="modal" data-target="#edit" onclick="values(${stu.getUser_num()})">--%>
                                                            <i class="glyphicon glyphicon-pencil icon2"></i>
                                                        </button>
                                                            <%--                                                        <a class="btn btn-xs btn-default" href="#!" title="" data-toggle="tooltip" data-original-title="编辑"><i class="glyphicon glyphicon-pencil icon2"></i></a>--%>
                                                        <a class="btn btn-xs btn-default" href="/admin/removeUser?user_num=${stu.getUser_num()}" title="" data-toggle="tooltip" data-original-title="删除"><i class="glyphicon glyphicon-trash icon2"></i></a>
                                                    </div>

                                                </td>
                                            </tr>

                                            <div class="modal fade" id="${stu.getUser_num()}" tabindex="-1" role="dialog" aria-labelledby="myModal" style="display: none;" data-backdrop="static" data-keyboard="false">
                                                    <%--                                                <div class="modal fade" id="#edit" tabindex="-1" role="dialog" aria-labelledby="myModal" style="display: none;" data-backdrop="static" data-keyboard="false">--%>
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                                            <h4 class="modal-title" id="myModal">修改用户信息</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="/admin/EditStudentInfo" method="post" id="editStudentInfo" >
                                                                <div>
                                                                    <div class="form-group" style="color:black;margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label class="btn control-label" for="username" style="color:black;margin-right: 27px">姓名</label>
                                                                        </div>
                                                                        <input type="text" name="username" id="username" class="form-control" placeholder="请输入用户姓名">
                                                                    </div>
                                                                    <div class="form-group" style="margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label class="btn control-label" for="usernum" style="color:black;margin-right: 27px">学号</label>
                                                                        </div>
                                                                        <input type="text" name="usernum" id="usernum" class="form-control" readonly="readonly" value="${stu.getUser_num()}">
                                                                    </div>
                                                                    <div class="form-group" style="margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label  class="btn control-label" for="usersex" style="color:black;margin-right: 27px">性别</label>
                                                                        </div>
                                                                        <input type="text" name="usersex" id="usersex" class="form-control"  placeholder="请输入用户性别}">
                                                                    </div>
                                                                    <div class="form-group" style="margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label class="btn control-label" for="colname" style="color:black;margin-right: 27px" >学院</label>
                                                                        </div>
                                                                        <input type="text" name="colname" id="colname" class="form-control"  placeholder="请输入用户所在学院名称">
                                                                    </div>
                                                                    <div class="form-group" style="margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label class="btn control-label" for="userdept" style="color:black;margin-right: 12px">所在系</label>
                                                                        </div>
                                                                        <input type="text" name="userdept" id="userdept" class="form-control"  placeholder="请输入用户所在系">
                                                                    </div>
                                                                    <div class="form-group" style="margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label class="btn control-label" for="usersClass" style="color:black;margin-right: 27px">班级</label>
                                                                        </div>
                                                                        <input type="text" name="usersClass" id="usersClass" class="form-control"  placeholder="请输入用户所在班级">
                                                                    </div>
                                                                    <div class="form-group" style="margin: 10px 30px">
                                                                        <div class="input-group-btn">
                                                                            <label class="btn control-label" for="usersCol_id" style="color:black">学院编号</label>
                                                                        </div>
                                                                        <input type="text" name="usersCol_id" id="usersCol_id" class="form-control"  placeholder="请输入用户所在学院的编号">
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                                    <button type="submit" class="btn btn-primary" onclick="editUser()" >提交</button>
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
                                    <span>第${userPage.pageNum}/ ${userPage.pages}页</span>
                                    <span>总记录数：${userPage.total}  每页显示:10</span>
                                    <li><a href="/admin/manage_students?page=1&size=10" aria-label="Previous">首页</a></li>
                                    <li><a href="/admin/manage_students?page=${userPage.pageNum-1}&size=10">上一页</a></li>

                                    <li><a href="/admin/manage_students?page=${userPage.pageNum+1}&size=10">下一页</a></li>
                                    <li><a href="/admin/manage_students?page=${userPage.pages}&size=10" aria-label="Next">尾页</a></li>

                                </ul>

                            </div>

                        </div>

                    </div>

                </div>
        </main>
        <!--End 页面主要内容-->
    </div>
</div>


