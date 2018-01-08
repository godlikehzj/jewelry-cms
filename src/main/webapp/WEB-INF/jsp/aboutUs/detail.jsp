<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>关于我们</h3>

        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-3 col-sm-3 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>标签 <button type="button" class="btn btn-round btn-success" onclick="about_us.toAdd()">创建</button>
                    </h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table id="datatable2" class="table table-hover">
                        <thead>
                        <tr >
                            <th>中文</th>
                            <th>英文</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="detail" items="${details}">
                            <tr class="linetr <c:if test="${detail.id == current.id}">lineon</c:if>" id="${detail.id}" >
                                <th scope="row">${detail.tabName}</th>
                                <th scope="row">${detail.enTabName}</th>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-9 col-sm-9 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>内容列表</h2>
                    <button type="button" class="btn btn-round btn-success" onclick="about_us.toModify($('.lineon').attr('id'))">修改</button>
                    <button type="button" class="btn btn-round btn-warning" onclick="about_us.delete($('.lineon').attr('id'))">删除</button>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>中文内容</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content" id="about_content">
                                ${current.content}
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>英文内容</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content" id="about_en_content">
                                ${current.enContent}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        var data = "${details}";
        console.log(data);

        $(".linetr").bind("click", function () {
            $(".lineon").removeClass("lineon");
            $(this).addClass("lineon");
            console.log(this.id)
            $.ajax({
                type : "POST",
                url : "aboutUs/getOne",
                data : {"id":this.id},
                error : function() {
                },
                success : function(ret) {
                    $("#about_content").html(ret.content);
                    $("#about_en_content").html(ret.enContent);
                }
            });
        });

    })

</script>