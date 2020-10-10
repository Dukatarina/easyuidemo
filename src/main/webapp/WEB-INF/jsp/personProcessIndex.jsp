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
<div id="datagrid_toolbar">
    <a href="#">删除</a>
    <a href="#" onclick="addPerson()">添加</a>
    <input type="text" id="keyword">
</div>
<div id="dialog_person_add_buttons">
    <a href="#">删除</a>
    <a href="#">添加</a>
</div>
<div id="dialog_person_modify_buttons">
    <a href="#">重置</a>
    <a href="#">提交</a>
</div>
<div>
    <table id="datagrid_person">
        <thead>
        <tr>
            <th data-options="align:'center',checkbox:true,field:'id',title:'id',fixed:true"></th>
            <th data-options="align:'center',field:'name',title:'名字',fixed:true"></th>
            <th data-options="align:'center',field:'age',sortable:true,title:'年龄',fixed:true"></th>
            <th data-options="align:'center',field:'birthday',title:'生日',fixed:true"></th>
            <th data-options="align:'center',field:'address',title:'地址',fixed:true"></th>
            <th data-options="align:'center',field:'status',formatter:statue_fmt,title:'状态',fixed:true"></th>
            <th data-options="align:'center',field:'cz',formatter:link_btn,title:'操作',width:'180'"></th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>
<div id="dialog_person_add">
    <form id="dialog_person_add_from" action="${pageContext.request.contextPath}/person/add" method="post">
        <table>
            <tr>
                <td>id</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>名字</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><input type="text" name="age"></td>
            </tr>
            <tr>
                <td>生日</td>
                <td><input type="text" name="birthday"></td>
            </tr>
            <tr>
                <td>地址</td>
                <td><input type="text" name="address"></td>
            </tr>
            <tr>
                <td>状态</td>
                <td><input type="text" name="status"></td>
            </tr>

        </table>
    </form>
</div>
<div id="dialog_person_modify">
    <form id="dialog_person_modify_from" action="${pageContext.request.contextPath}/person/update" method="post">
        <table>
            <tr>
                <td>id</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>名字</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><input type="text" name="age"></td>
            </tr>
            <tr>
                <td>生日</td>
                <td><input type="text" name="birthday"></td>
            </tr>
            <tr>
                <td>地址</td>
                <td><input type="text" name="address"></td>
            </tr>
            <tr>
                <td>状态</td>
                <td><input type="text" name="status"></td>
            </tr>

        </table>
    </form>
</div>
<script>


    function link_btn(value, row, index) {
        return '<a href="#" class="datagrid_update">修改</a> <a class="datagrid_delete" href="#">删除</a>'
    }

    function statue_fmt(value, row, index) {
        switch (row.status) {
            case 'enabled':
                return "可用";
            case 'accountNonExpired':
                return "账户没有失效";
            case 'credentialsNonExpired':
                return "密码没有失效";
            case 'accountNonLocked':
                return "账户没有锁定";
            default:
                return ""
        }
    }

    $("#datagrid_person").datagrid({
        method: 'GET',
        title: "学生信息",
        iconCls: "icon-man",
        height: 500,
        width: 1000,
        url: '${pageContext.request.contextPath}/persons',
        toolbar: "#datagrid_toolbar",
        rownumbers: true,
        // checkOnSelect: true,
        pagination: true,
        onLoadSuccess: function () {
            $(".datagrid_update").linkbutton({
                iconCls: "icon-edit",
                onClick: function () {
                    updatePerson($(this).parent().parent().parent().children().eq(0).find('input').val());
                }
            })
            $(".datagrid_delete").linkbutton({
                iconCls: "icon-cancel",
                onClick: function () {
                    delPerson("id=" + $(this).parent().parent().parent().children().eq(0).find('input').val())
                }
            })
        }
    });

    function updatePerson(id) {
        $("#dialog_person_modify").dialog({
            closed: false,
            modal: true
        })
        $("#dialog_person_modify_from").form("load", "${pageContext.request.contextPath}/person?id="+id)

    }
    $("#dialog_person_modify_from").form({
        success: function (data) {
            $.messager.show({
                title: "提示",
                msg: data === "ok" ? "修改成功" : "修改失败"
            })
            $("#datagrid_person").datagrid('reload')
            $("#dialog_person_modify").dialog({closed: true}).form("clear")
        }
    })

    function addPerson() {
        $("#dialog_person_add").dialog({
            closed: false,
            modal: true
        })
    }


    $("#dialog_person_add_from").form({
        success: function (data) {
            $.messager.show({
                title: "提示",
                msg: data === "ok" ? "添加成功" : "添加失败"
            })
            $("#datagrid_person").datagrid('reload')
            $("#dialog_person_add").dialog({closed: true})
            $("#dialog_person_add").form("clear")
        }
    })

    $("#dialog_person_add").dialog({
        width: 300,
        title: '添加用户',
        iconCls: 'icon-man',
        buttons: "#dialog_person_add_buttons",
        closed: true
    })
    $("#dialog_person_modify").dialog({
        width: 300,
        title: '修改用户',
        iconCls: 'icon-man',
        buttons: "#dialog_person_modify_buttons",
        closed: true
    })
    $("#datagrid_toolbar>a:contains(删除)").linkbutton({
        iconCls: "icon-remove",
        onClick: function () {
            var delParam = "";
            var rs = $("#datagrid_person").datagrid('getChecked');
            for (var i = 0; i < rs.length; i++) {
                if (i === 0) {
                    delParam = "id=" + rs[i].id;
                } else {
                    delParam += "&id=" + rs[i].id;
                }
            }
            delPerson(delParam)
        }
    })

    function delPerson(delParam) {
        $.ajax({
            url: '${pageContext.request.contextPath}/person/delete',
            type: "post",
            data: delParam,
            success: function (json) {
                $.messager.show({
                    title: "提示",
                    msg: json === "ok" ? "删除成功" : "删除失败"
                })
                $("#datagrid_person").datagrid('reload')
            }
        })
    }

    function queryPerson(id) {
        $.ajax({
            url: '${pageContext.request.contextPath}/person/delete',
            type: "post",
            data: delParam,
            success: function (json) {
                $.messager.show({
                    title: "提示",
                    msg: json === "ok" ? "删除成功" : "删除失败"
                })
                $("#datagrid_person").datagrid('reload')
            }
        })
    }

    $("#datagrid_toolbar>a:contains(添加)").linkbutton({iconCls: "icon-add"})

    $("#datagrid_toolbar>input").textbox({
        buttonIcon: "icon-search",
        buttonText: "search",
        onClickButton:function () {
            $("#datagrid_person").datagrid('load',{"keywords":$("#keyword").val()})
        }
    })
    $("#dialog_person_add_buttons>a:contains(添加)").linkbutton({
        iconCls: "icon-add",
        onClick: function () {
            $("#dialog_person_add_from").form('submit')
        }
    })
    $("#dialog_person_modify_buttons>a:contains(提交)").linkbutton({
        iconCls: "icon-add",
        onClick: function () {
            $("#dialog_person_modify_from").form('submit')
        }
    })

    $("#dialog_person_add_buttons")
        // .css("width", "240px")
        .css("text-align", "center")

</script>
</body>
</html>





















