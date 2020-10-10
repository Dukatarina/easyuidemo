<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>button</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/default/easyui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/icon.css"/>
    <script src="${pageContext.request.contextPath}/js/echars.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
    <style>
        .image {
            width: 500px;
            height: 500px;
            background-color: pink;
        }
    </style>
</head>
<body>
<div id="main" class="image">

</div>
<script type="text/javascript">

    $.ajax({
        url: '${pageContext.request.contextPath}/echars/demo',
        type: "post",
        data: null,
        success: function (json) {
            doEcharts(json)
        }
    })

    function doEcharts(json) {
        let myChart = echarts.init(document.getElementById('main'));
        let option = {
            title: {
                text: '用户数量统计',
                subtext: '模拟数据',
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                orient: 'vertical',
                left: 'left',
            },
            series: [
                {
                    name: '用户名占比',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    data: json,
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        myChart.setOption(option);
    }

</script>
</body>
</html>
