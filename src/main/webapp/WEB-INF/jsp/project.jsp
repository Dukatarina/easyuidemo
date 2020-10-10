<%@ page language="java" import="java.util.*" pageEncoding="GBK" %>
<html>
<head>
    <title>��Ϣ�б�</title>
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
                loadMsg: '�������ڼ��� ',
                rownumbers: true,//�к�
                pagination: true,//��ҳ�ؼ�
                collapsible: false,//�Ƿ���۵���
                pagePosition: "bottom",//Ĭ��Ϊbottom
                singleSelect: true,//��ѡ
                idField: 'id',//����json�����õ�idһ��
                fit: true,
                toolbar : "#menu",
                //������
                columns: [[
                    {
                        field: 'cv', title: '����', width: 180, align: 'center',
                        formatter: rowformater
                    },
                    {
                        field:'sgzname',width:150,title:'�������չ�վ����',align:'center'
                    },
                    {
                        field: 'cph', width: 60, title: '���ƺ�', align: 'center'
                    },
                    {
                        field: 'rqname', width: 150, title: '����Ʒ������ҵ', align: 'center'
                    },
                    {
                        field: 'status', width: 150, title: '״̬', align: 'center'
                    },
                    {
                        field: 'kind', width: 150, hidden:true, title: '״̬', align: 'center'
                    },
                ]]
            });
            // clear();
        }

        //����
        function rowformater(value, row, index) {
            return '��<a href="#" onclick="info(' + index + ') "><font color=blue>�鿴</font></a>��';
        }

        function info(index) {
            $('#dataTable').datagrid('selectRow', index);// ���û������Ҫ�����β鿴��ť�Ż���ת����ϸ��Ϣ��ҳ��
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
    <div data-options="region:'north',align:'center',split:true,title:'״̬��ѯ'"
         style="height: 140px; text-align: center; padding: 0px 0px 0px 0px;">
        <form id="searchFrom"  method="POST">
            <div style="width: 100%;text-align: left; clear: both; margin-top: 5px;">
                <table class="ser-table" border="0" align="center">
                    <tr>
                        <td class="ser-ltd">��ѯ���&nbsp;&nbsp;</td>
                        <td class="ser-rtd" style="width:250px;height:30px;">
                            <input name="kind"  type="radio" value="ysc"/>���䳵
                            <input name="kind" type="radio" value="scqy"/>����Ʒ������ҵ
                            <input name="kind" checked type="radio" value="sgz"/>�������չ�վ
                        </td>
                        <td class="ser-ltd" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ؼ��֣�</td>
                        <td class="ser-rtd">
                            <input type="text" name="keyword" style="width:180px;height:30px;"/>
                        </td>
                        <td class="ser-ltd">���ʱ�䣺&nbsp;&nbsp;</td>
                        <td class="ser-rtd" style="width:250px;">
                            <input class="easyui-datebox" style="width:150px;height:30px;" id="endDay" type="text"
                                   name="endDay"/>
                        </td>
                        <td class="ser-ltd">���ӵ�״̬��&nbsp;&nbsp;</td>
                        <td class="ser-rtd">
                            <input name="isErrored" type="radio" value="1"/>�����
                            <input name="isErrored" type="radio" value="0"/>δ���
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
                               data-options="iconCls:'icon-search',iconAlign:'right'">�� ѯ</a>
                            <a class="easyui-linkbutton" href="javascript:clear()"
                               data-options="iconCls:'icon-reload',iconAlign:'right'">�� ��</a>
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
<%--        <c:if test="${coreAdmin.roles.roleLevel!=1&&coreAdmin.roles.name!='�м�����Ա'&&coreAdmin.roles.name!='�ؼ�����Ա'}">--%>
<%--            <a id="exportExcel" style="width:120px;" href="#" class="easyui-linkbutton"--%>
<%--               onclick="exportExcel()">����excel����</a>--%>
<%--        </c:if>--%>
<%--    </div>--%>
</div>
</body>
</html>
<%--<%@include file="../../inc/attr.jsp" %>--%>