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
<div id="win" class="easyui-window" title="My Window" style="width:800px;height:400px" data-options="iconCls:'icon-save',modal:true">
    Window Content
</div>

<div id="win1" class="easyui-window" title="My Window" style="width:600px;height:400px" data-options="iconCls:'icon-save',modal:true">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:true" style="height:100px"></div>
        <div data-options="region:'center'">
            The Content.
        </div>
    </div>
</div>
<script>


</script>
</body>
</html>
