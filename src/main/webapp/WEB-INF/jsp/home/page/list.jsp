<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3><c:choose>
                <c:when test="${type == 0}">首页->商品</c:when>
                <c:when test="${type == 1}">首页->关于我们</c:when>
                <c:when test="${type == 2}">首页->加入我们</c:when>
            </c:choose></h3>

        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-2 col-sm-2 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>行号</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table id="datatable2" class="table table-hover">
                        <thead>
                        <tr >
                            <th>行号</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="line" items="${lines}">
                            <tr class="linetr <c:if test="${line == cline}">typeon</c:if>">
                                <th scope="row">${line - type*1000}</th>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-10 col-sm-10 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>内容列表</h2>
                    <button type="button" class="btn createbtn btn-success" onclick="home.page.toAdd()">创建</button>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table id="datatable" class="table table-hover">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>宽度</th>
                            <th>内容类型</th>
                            <th>内容</th>
                            <th>跳转商品</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="page" items="${pages}">
                            <tr id="${page.id}">
                                <td>${page.indexOrder}</td>
                                <td>${page.widthNum}</td>
                                <td><c:choose>
                                    <c:when test="${page.cType == 1}">文字</c:when>
                                    <c:when test="${page.cType == 2}">图片</c:when>
                                    <c:when test="${page.cType == 3}">视频</c:when>
                                </c:choose></td>
                                <td><c:choose>
                                    <c:when test="${page.cType == 1}">${page.content}</c:when>
                                    <c:when test="${page.cType == 2}"><img style="height: 40px" src="${page.content}"/></c:when>
                                    <c:when test="${page.cType == 3}"><video style="height: 40px" src="${page.content}"></c:when>
                                        </c:choose>
                                </td>
                                <td>${page.goId}</td>

                                <td><a href="javascript:void(0);" onclick="home.page.toModify(${page.id})">修改</a> |
                                    <a href="javascript:void(0);" onclick="home.page.delete(${page.id})">删除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

    </div>
</div>

<script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src = "vendors/TableDnD-0.9.2/js/jquery.tablednd.js"></script>
<%--<script src="../../../../vendors/dragsort-0.5.2/jquery.dragsort-0.5.2.min.js"></script>--%>
<%--<script src = "vendors/bootstrap-table-1.11.1/src/extensions/reorder-rows/bootstrap-table-reorder-rows.js"></script>--%>
<script>
    $(document).ready(function() {
        $(".linetr").bind("click", function () {
            console.debug($(".lineon th").text());
            $(".lineon").removeClass("lineon");
            $(this).addClass("lineon");
            home.page.getList(home.page.type, $(".lineon th").text())
        });

        $("#datatable").tableDnD({
            onDrop : function (table, row) {
                console.log(row);
                var rows = table.tBodies[0].rows;
                var order = [];
                for (var i=0; i<rows.length; i++) {
                    order.push(rows[i].id);
                }
                console.log(order);
                var param = {"order":JSON.stringify(order)};
                home.page.orderList(param)
            }
        });
    })

</script>