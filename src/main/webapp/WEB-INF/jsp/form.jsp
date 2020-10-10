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
<input id="tb" type="text" style="width:300px">
<input id="dd" type="text" class="easyui-datebox" required="required">
<input class="iinput easyui-datebox" id="endDate" style="width:130px;height:30px;"   type="text" name="endDate"/>
<button onclick="startDate()">日历</button>
<%--<div class="easyui-layout" data-options="fit:true">--%>
<%--    <input type="radio" checked name="sex">男</input>--%>
<%--    <input type="radio" name="sex">女</input>--%>
<%--</div>--%>

<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north',align:'center',split:true,title:'状态查询'" style="height: 140px; text-align: center; padding: 0px 0px 0px 0px;">
        <form:form id="searchFrom" commandName="__MVC__" method="POST">
            <div style="width: 100%;text-align: left; clear: both; margin-top: 5px;">
                <table class="ser-table" border="0" align="center">
                    <tr>
                        <td class="ser-ltd">查询类别：&nbsp;&nbsp;</td>
                        <td class="ser-rtd" style="width:250px;height:30px;">
                            <input name="kind"  type="radio" value="ysc"/>运输车
                            <input name="kind" type="radio" value="scqy"/>乳制品生产企业
                            <input name="kind" checked type="radio" value="sgz"/>生鲜乳收购站
                        </td>
                        <td class="ser-ltd" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关键字：</td>
                        <td class="ser-rtd">
                            <input type="text" name="keyword" style="width:180px;height:30px;"/>
                        </td>
                        <td class="ser-ltd">添加时间：&nbsp;&nbsp;</td>
                        <td class="ser-rtd" style="width:250px;">
                            <input class="easyui-datebox" style="width:150px;height:30px;" id="endDay" type="text"
                                   name="endDay"/>
                        </td>
                        <td class="ser-ltd">交接单状态：&nbsp;&nbsp;</td>
                        <td class="ser-rtd">
                            <input name="isErrored" type="radio" value="1"/>已完成
                            <input name="isErrored" type="radio" value="0"/>未完成
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td colspan="2">
                            <a class="easyui-linkbutton" href="javascript:search()"
                               data-options="iconCls:'icon-search',iconAlign:'right'">查 询</a>
                            <a class="easyui-linkbutton" href="javascript:clear()"
                               data-options="iconCls:'icon-reload',iconAlign:'right'">重 置</a>
                        </td>
                    </tr>
                </table>
            </div>
        </form:form>
    </div>
    <div data-options="region:'center',title:''">
        <table id="dataTable" border=1></table>
    </div>

    <div id="menu">
        <c:if test="${coreAdmin.roles.roleLevel!=1&&coreAdmin.roles.name!='市级管理员'&&coreAdmin.roles.name!='县级管理员'}">
            <a id="exportExcel" style="width:120px;" href="#" class="easyui-linkbutton"
               onclick="exportExcel()">导出excel数据</a>
        </c:if>
    </div>
</div>
<script>
    $('#dd').datebox({
        onSelect: function(date){
            alert(date.getFullYear()+":"+(date.getMonth()+1)+":"+date.getDate());
        }
    });
    function startDate(){
        // $.messager.alert('日历',$("#dd").textbox())
        $.messager.alert('日历',$("#endDate").val())
    }
    $('#tb').textbox({
        buttonText:'Search',
        iconCls:'icon-man',
        iconAlign:'left',
        onClickButton:function () {
            $.messager.alert('警告',$("#tb").val());
            $.messager.alert('警告',$(this).textbox())
           var r=$(this).textbox('isValid');
            if (r){
                console.log("ajax")
            }else {
                console.log(false)
            }
        }
    })

</script>
</body>
</html>
