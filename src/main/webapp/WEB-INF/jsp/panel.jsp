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
<div id="p" class="easyui-panel"
     title="My Panel"
     style="width:500px;height:150px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-save',closable:true,collapsible:true,minimizable:true,maximizable:true">
    <p>panel content.</p>
    <p>panel content.</p>
</div>

<div id="panelId">
    什么鬼
</div>
<script>
$("#panelId").panel({
    title:"hi panel",
    width:"300px",
    height:"100px",
    iconCls:'icon-save',
    closable:"true",
    href:"${pageContext.request.contextPath}/button"

})

</script>
</body>
</html>
