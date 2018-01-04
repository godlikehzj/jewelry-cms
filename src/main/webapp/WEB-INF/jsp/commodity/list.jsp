<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">

<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>商品管理</h3>
        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>商品列表</h2>
                    <button type="button" class="btn btn-success createbtn" onclick="commodity.toAdd()">创建</button>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>名称</th>
                            <th>类型</th>
                            <th>部位</th>
                            <th>材质</th>
                            <th>价格(元)</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="commodity" items="${commodities}">
                            <tr>
                                <td>${commodity.title}</td>
                                <td>${commodity.jewelryType.name}</td>
                                <td>${commodity.bodyPart.name}</td>
                                <td>${commodity.jewelryMeterial.name}</td>
                                <td>${commodity.price/100}</td>
                                <td><a onclick="commodity.toModify()"></a></td>
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

<script>
    $('#datatable').dataTable();
</script>