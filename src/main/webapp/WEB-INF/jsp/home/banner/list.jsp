<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>首页->banner</h3>
        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>banner列表</h2>
                    <button type="button" class="btn btn-round btn-success" onclick="home.banner.toAdd()">创建</button>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table id="datatable" class="table table-hover">
                        <thead>
                        <tr>
                            <th>顺序</th>
                            <th>图片</th>
                            <th>商品Id</th>
                            <th>操作</th>

                        </tr>
                        </thead>

                        <tbody id="bannerbody">
                        <c:forEach var="banner" items="${banners}">
                            <tr id="${banner.id}">
                                <td>${banner.pindex}</td>
                                <td><img style="height: 40px" src="${banner.imgUrl}"/></td>
                                <td>${banner.goId}</td>

                                <td><a href="javascript:void(0);" onclick="home.banner.toModify(${banner.id})">修改</a> |
                                    <a href="javascript:void(0);" onclick="home.banner.delete(${banner.id})">删除</a></td>
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
        $('#datatable').dataTable();
        $("#datatable").tableDnD({
            onDrop : function (table, row) {
                var rows = table.tBodies[0].rows;
                var order = [];
                for (var i=0; i<rows.length; i++) {
                    order.push(rows[i].id);
                }
                console.log(order);
                var param = {"order":JSON.stringify(order)};
                home.banner.orderList(param)
            }
        });
    })
    // $('#bannerbody').dragsort({
    //     // itemSelector: "tr",
    //     dragSelector: "tr",
    //     dragBetween: true,
    //     dragEnd: alert(123),//拖拽完成后调用方法
    //     // placeHolderTemplate: "<tr class='demo-placeholder'><td></td></tr>"
    // })

</script>