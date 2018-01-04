<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>分类管理</h3>
        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">


        <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>珠宝分类</h2>
                    <ul class="nav panel_toolbox">

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a onclick="jtype.toAddType()">添加</a>
                                </li>
                                <li><a onclick='jtype.toModifyType($(".typeon th").text())'>修改</a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>名称</th>
                            <th>英文</th>
                            <th>状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="type" items="${types}">
                            <tr class="typetr <c:if test="${type.id == typeId}">typeon</c:if>">
                                <th scope="row">${type.id}</th>
                                <td>${type.name}</td>
                                <td>${type.enName}</td>
                                <td><c:if test="${type.status == 1}"><span class="onlineText">上线</span></c:if>
                                    <c:if test="${type.status == 0}">下线</c:if></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>二级分类</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a onclick='jtype.toAddPart($(".typeon th").text())'>添加</a>
                                </li>
                                <li><a onclick='jtype.toModifyPart($(".parton th").text())'>修改</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>名称</th>
                            <th>英文</th>
                            <th>状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="part" items="${parts}">
                            <tr class="parttr <c:if test="${part.id == partId}">parton</c:if>">
                                <th scope="row">${part.id}</th>
                                <td>${part.name}</td>
                                <td>${part.enName}</td>
                                <td><c:if test="${part.status == 1}"><span class="onlineText">上线</span></c:if>
                                    <c:if test="${part.status == 0}">下线</c:if></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>材质</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a onclick='jtype.toAddMeterial($(".typeon th").text())'>添加</a>
                                </li>
                                <li><a onclick='jtype.toModifyMeterial($(".meterialon th").text())'>修改</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>名称</th>
                            <th>英文</th>
                            <th>状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="meterial" items="${meterials}">
                            <tr class="meterialtr">
                                <th scope="row">${meterial.id}</th>
                                <td>${meterial.name}</td>
                                <td>${meterial.enName}</td>
                                <td><c:if test="${meterial.status == 1}"><span class="onlineText">上线</span></c:if>
                                    <c:if test="${meterial.status == 0}">下线</c:if></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

    </div>
</div>

<script>
    $(".typetr").bind("click", function () {
        console.debug($(".typeon th").text());
        $(".typeon").removeClass("typeon");
        $(this).addClass("typeon");
        jtype.getDetails($(".typeon th").text())
    });

    $(".parttr").bind("click", function () {
        console.debug($(".parton th").text());
        $(".parton").removeClass("parton");
        $(this).addClass("parton");
    });

    $(".meterialtr").bind("click", function () {
        console.debug($(".meterialon th").text());
        $(".meterialon").removeClass("meterialon");
        $(this).addClass("meterialon");
    });
</script>