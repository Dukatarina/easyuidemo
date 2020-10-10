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
<button onclick="downExcel()">按钮</button>
<button onclick="downExcel2()">按钮2</button>
<button style="margin-left: 50px;">
    <a href="${pageContext.request.contextPath}/downExcel" download="userlist.xls" style="color: #fff;">导出</a>
</button>
<button onclick="formBtn()">formBtn</button>
<script>

    function downExcel() {
        window.location.href = '${pageContext.request.contextPath}/downExcel'
    }

    function formBtn() {
        var $form = $('<form method="post"></form>');
        $form.attr('action', '${pageContext.request.contextPath}/downExcelPost?dws='+"dws");
        $form.appendTo($('body'));
        $form.submit();
        $form.remove();
    }
</script>
</body>
</html>
