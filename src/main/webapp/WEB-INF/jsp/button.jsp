<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>button</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/default/easyui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/icon.css"/>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
</head>
<body>
<a href="#" class="easyui-linkbutton">黄蜂</a>
<a href="#" id="huangfeng">黄蜂</a>
<a id="btn" href="#" class="easyui-linkbutton" onclick="clickA()">easyui</a>
<script>

    $('#huangfeng').linkbutton();
    function clickA(){
        $('#btn').linkbutton({
            iconCls: 'icon-search'
        });
    }
</script>
</body>
</html>
