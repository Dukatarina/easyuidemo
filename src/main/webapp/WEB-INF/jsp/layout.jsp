<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
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

<%--<div id="cc" class="easyui-layout" style="width:600px;height:400px;">--%>
<%--    <div data-options="region:'north',title:'North Title',split:true" style="height:100px;"></div>--%>
<%--    <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>--%>
<%--    <div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:100px;"></div>--%>
<%--    <div data-options="region:'west',title:'West',split:true" style="width:100px;"></div>--%>
<%--    <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;"></div>--%>
<%--</div>--%>

<div data-options="region:'north'" style="height:100px"></div>
<div data-options="region:'center'">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west'" style="width:180px"></div>
        <div data-options="region:'center'"></div>
    </div>
</div>
<script>

</script>
</body>
</html>
