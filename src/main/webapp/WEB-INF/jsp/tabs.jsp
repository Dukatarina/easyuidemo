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
    <style>
        #login-div {
            margin: 100px auto;
            width: 800px;
            height: 400px;
            background-color: red;
        }
    </style>
</head>
<body>
<div id="login-div">
    <button id="resize" onclick="resizeTab()">resize</button>
    <div id="tt" class="easyui-tabs" style="width:500px;height:250px;">
        <div title="Tab1" data-options="closable:true" style="padding:20px;display:none;">
            tab1
        </div>
        <div title="Tab2" data-options="closable:true,disabled:true" style="overflow:auto;padding:20px;display:none;">
            tab2
        </div>
        <div title="Tab3" data-options="closable:true,href:'${pageContext.request.contextPath}/personProcessIndex'"
             style="overflow:auto;padding:20px;display:none;">
            tab2
        </div>
    </div>
</div>
<script>
    function resizeTab() {
        $("#tt").tabs("resize")
        // var tab = $('#tt').tabs('getSelected');
        // var index = $('#tt').tabs('getTabIndex',tab);
        // alert(index);
    }
</script>

</body>
</html>
