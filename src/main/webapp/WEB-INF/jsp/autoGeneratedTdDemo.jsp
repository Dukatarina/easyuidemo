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
<%--<div style="float: left;width: 66px;">--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <td>姓名</td>--%>
<%--        </tr>--%>
<%--        <c:forEach items="${vos}" var="vo">--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                        ${vo.name}--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>

<%--</div>--%>
<%--<div style="float: left;">--%>
<%--    <table>--%>
<%--        &lt;%&ndash;    <c:forEach items="${result}" var="r" begin="0" end="0">&ndash;%&gt;--%>
<%--        &lt;%&ndash;        <tr>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <c:forEach items="${r}" var="t">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                <td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                        ${t.name}&ndash;%&gt;--%>
<%--        &lt;%&ndash;                </td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            </c:forEach>&ndash;%&gt;--%>
<%--        &lt;%&ndash;        </tr>&ndash;%&gt;--%>
<%--        &lt;%&ndash;    </c:forEach>&ndash;%&gt;--%>

<%--        &lt;%&ndash;    <c:forEach items="${result}" var="r">&ndash;%&gt;--%>
<%--        &lt;%&ndash;        <tr>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <c:forEach items="${r}" var="t">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                <td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                        ${t.age}&ndash;%&gt;--%>
<%--        &lt;%&ndash;                </td>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            </c:forEach>&ndash;%&gt;--%>
<%--        &lt;%&ndash;        </tr>&ndash;%&gt;--%>
<%--        &lt;%&ndash;    </c:forEach>&ndash;%&gt;--%>


<%--        <tr>--%>
<%--            <td></td>--%>
<%--            <c:forEach items="${vos}" var="vo">--%>
<%--                <td>--%>
<%--                        ${vo.address}--%>
<%--                </td>--%>

<%--            </c:forEach>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td></td>--%>
<%--            <c:forEach items="${vos}" var="vo">--%>
<%--                <td>--%>
<%--                        ${vo.count}--%>
<%--                </td>--%>
<%--            </c:forEach>--%>
<%--        </tr>--%>
<%--    </table>--%>
<body>
<table>
    <%--    <c:forEach items="${result}" var="r" begin="0" end="0">--%>
    <%--        <tr>--%>
    <%--            <c:forEach items="${r}" var="t">--%>
    <%--                <td>--%>
    <%--                        ${t.name}--%>
    <%--                </td>--%>
    <%--            </c:forEach>--%>
    <%--        </tr>--%>
    <%--    </c:forEach>--%>
    <%--    <c:forEach items="${result}" var="r">--%>
    <%--    <tr>--%>

    <%--            <td>--%>
    <%--                    ${t.address}--%>
    <%--            </td>--%>

    <%--    </tr>--%>
    <%--    </c:forEach>--%>
    <%--    <c:forEach items="${result}" var="r">--%>
    <%--        <tr>--%>
    <%--            <c:forEach items="${r}" var="t">--%>
    <%--                <td>--%>
    <%--                        ${t.age}--%>
    <%--                </td>--%>
    <%--            </c:forEach>--%>
    <%--        </tr>--%>
    <%--    </c:forEach>--%>


    <tr>
        <td></td>
        <c:forEach items="${list}" var="r">
            <td>
                    ${r}
            </td>
        </c:forEach>
    </tr>

    <c:forEach items="${result}" var="r">
        <tr>
            <td>
                    ${r.name}
            </td>
            <c:forEach items="${r.list}" var="t">
                <td>
                        ${t}
                </td>
            </c:forEach>
        </tr>
    </c:forEach>

</table>
</body>
</div>

</body>
</html>