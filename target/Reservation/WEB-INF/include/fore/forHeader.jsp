
<%@ page language="java"
         pageEncoding="UTF-8" isELIgnored="false" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>


<!DOCTYPE html>
<html>
<head>
    <script src="../../js/jquery/2.0.0/jquery.min.js"></script>
    <link href="../../css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="../../js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="../../css/fore/style.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>实验室预约管理系统</title>
</head>
<script>
    //iframe自适应
    $(window).on('resize', function() {
        // 设置Iframe窗口大小
        configIframe();
    }).resize();
    function configIframe(){
        var $content = $('.layui-body');
        $content.height($(this).height() - 75);
        $content.width($(this).width() - 250);
        $content.find('iframe').each(function() {
            $(this).height($content.height());
            $(this).width($content.width());
        });
        var $screenWidth = $("body").width();
        var $mainHeader = $(".layui-header");
        $mainHeader.width($screenWidth - $(".layui-side ").width());

    }
</script>
<body>

</body>
</html>
