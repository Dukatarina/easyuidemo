<%@ page language="java" import="java.util.*" pageEncoding="GBK" %>
<html>
<head>
    <title>信息列表</title>
<%--    <%@include file="../../inc/easyui.jsp" %>--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/default/easyui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/icon.css"/>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        /*.myheadtb1 {*/
        /*    margin-bottom: 10px;*/
        /*    width: 98%;*/
        /*    height: 30px;*/
        /*    font-size: 12px;*/
        /*    white-space: nowrap;*/
        /*}*/

        /*.myheadtb1 td {*/
        /*    height: 30px;*/
        /*    font-size: 12px;*/
        /*    white-space: nowrap;*/
        /*    padding: 3px;*/
        /*}*/

        /*.ser-table {*/
        /*    width: 99%;*/
        /*}*/

        /*.ser-table td {*/
        /*    height: 35px;*/
        /*}*/

        /*.ser-table .ser-ltd {*/
        /*    width: 105px;*/
        /*    text-align: left;*/
        /*    text-indent: 5px;*/
        /*}*/

        /*.ser-table .ser-rtd {*/
        /*    width: 240px;*/
        /*}*/
    </style>

    <script type="text/javascript">
        function addTab(title, href, flag) {
            window.top.frames.addTab(title, href, flag);
        }

        var baseOptionUrl = "${pageContext.request.contextPath}/BMS/nyjg/buyChange/";
        $(function () {
            showData();
        });

        function search() {
            // jQuery('#dataTable').datagrid('clearSelections');
            $("#dataTable").datagrid('load', getFormPara($("#searchFrom")));
        }

        function showData() {
            $("#dataTable").datagrid({
                url: baseOptionUrl + "statisticCount",
                method: "post",
                loadMsg: '数据正在加载 ',
                rownumbers: true,//行号
                pagination: true,//分页控件
                collapsible: false,//是否可折叠的
                pagePosition: "bottom",//默认为bottom
                singleSelect: true,//单选
                idField: 'id',//和你json中设置的id一样
                fit: true,
                toolbar : "#menu",
                //列设置
                columns: [[
                    {
                        field: 'cv', title: '操作', width: 180, align: 'center',
                        formatter: rowformater
                    },
                    {
                        field:'sgzname',width:150,title:'生鲜乳收购站名称',align:'center'
                    },
                    {
                        field: 'cph', width: 60, title: '车牌号', align: 'center'
                    },
                    {
                        field: 'rqname', width: 150, title: '乳制品生产企业', align: 'center'
                    },
                    {
                        field: 'status', width: 150, title: '状态', align: 'center'
                    },
                    {
                        field: 'kind', width: 150, hidden:true, title: '状态', align: 'center'
                    },
                ]]
            });
            // clear();
        }

        //操作
        function rowformater(value, row, index) {
            return '【<a href="#" onclick="info(' + index + ') "><font color=blue>查看</font></a>】';
        }

        function info(index) {
            $('#dataTable').datagrid('selectRow', index);// 如果没有这句就要点两次查看按钮才会跳转到详细信息的页面
            var row = $('#dataTable').datagrid('getSelected');
            if ("wwc_sgz"===row.kind){
                document.location = "${pageContext.request.contextPath}/BMS/nyjg/buySgz/info?id=" + row.id;
            }else {
                document.location = "${pageContext.request.contextPath}/BMS/nyjg/buyChange/info?id=" + row.id;
            }
        }

        function exportExcel() {
            $('#searchFrom').form('submit', {
                url:'${pageContext.request.contextPath}/BMS/nyjg/buyChange/statisticCountExcel'
            });
        }
        function getRadioButtonChecked(tagNameAttr){
            var radio_tag = document.getElementsByName(tagNameAttr);
            for(var i=0;i<radio_tag.length;i++){
                if(radio_tag[i].checked){
                    var checkvalue = radio_tag[i].value;
                    return checkvalue;
                }
            }
        }

        function clear() {
            $("#searchFrom").form('clear');
        }
    </script>
</head>

<body>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north',align:'center',split:true,title:'状态查询'"
         style="height: 140px; text-align: center; padding: 0px 0px 0px 0px;">
        <form id="searchFrom"  method="POST">
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
        </form>
    </div>
<%--    <div data-options="region:'center',title:''">--%>
<%--        <table id="dataTable" border=1></table>--%>
<%--    </div>--%>

<%--    <div id="menu">--%>
<%--        <c:if test="${coreAdmin.roles.roleLevel!=1&&coreAdmin.roles.name!='市级管理员'&&coreAdmin.roles.name!='县级管理员'}">--%>
<%--            <a id="exportExcel" style="width:120px;" href="#" class="easyui-linkbutton"--%>
<%--               onclick="exportExcel()">导出excel数据</a>--%>
<%--        </c:if>--%>
<%--    </div>--%>
</div>
</body>
</html>
<%--<%@include file="../../inc/attr.jsp" %>--%>