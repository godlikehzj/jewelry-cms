<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="vendors/bootstrap-fileinput-master/css/fileinput.min.css" rel="stylesheet">
<link href="vendors/bootstrap-fileinput-master/css/fileinput-rtl.min.css" rel="stylesheet">

<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>首页banner管理</h3>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>添加banner</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <br />
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">选择类型</label>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <select class="select2_single form-control" tabindex="-1" id="type_select">
                                    <c:forEach var="type" items="${types}">
                                        <option value="${type.id}">${type.name}</option>
                                    </c:forEach>

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">选择部位</label>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <select class="select2_single form-control" tabindex="-1" id="body_select">
                                    <c:forEach var="body" items="${bodys}">
                                        <option value="${body.id}">${body.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">选择商品</label>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <select class="select2_single form-control" tabindex="-1" id="c_select">
                                    <option value="0">--</option>
                                    <c:forEach var="commodity" items="${commodities}">
                                        <option value="${commodity.id}">${commodity.title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="banner-pic" class="control-label col-md-3 col-sm-3 col-xs-12">图片</label>
                            <!--<div class="file-loading col-md-6 col-sm-6 col-xs-12">-->
                            <!--<input id="input-24" name="input24[]" type="file" multiple>-->
                            <!--</div>-->
                            <div class=" col-md-6 col-sm-6 col-xs-12">
                                <input id="banner-pic" type="file" multiple>
                            </div>
                        </div>


                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button type="button" onclick="home.banner.getList()" class="btn createbtn btn-primary">Cancel</button>
                                <button type="button" onclick="submitBanner()" class="btn createbtn btn-success">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="vendors/bootstrap-fileinput-master/js/fileinput.min.js"></script>
<script src="vendors/bootstrap-fileinput-master/js/plugins/sortable.min.js"></script>
<script src="vendors/bootstrap-fileinput-master/themes/fa/theme.js" type="text/javascript"></script>
<script src="vendors/wangEditor-3.0.15/release/wangEditor.min.js" type="text/javascript"></script>
<script src="vendors/custom/custom.min.js"></script>
<script>


    $("#type_select").on('change', function () {
        var typeId = $(this).find('option:selected').val();

        var params = {"typeId":typeId,"type":0};
        $.ajax({
            type : "POST",
            url : "type/change",
            data : params,
            error : function() {
            },
            success : function(ret) {
                $('#body_select').html(ret);
                var bodyId = $("#body_select").find('option:selected').val();
                var params2 = {"bodyId":bodyId};
                $.ajax({
                    type : "POST",
                    url : "home/body/change",
                    data : params2,
                    error : function() {
                    },
                    success : function(ret) {
                        $('#c_select').html('<option value="0">--</option>' + ret);
                    }
                });
            }
        });


    });

    $("#body_select").on('change', function () {

        var bodyId = $(this).find('option:selected').val();
        var params = {"bodyId":bodyId};
        $.ajax({
            type : "POST",
            url : "home/body/change",
            data : params,
            error : function() {
            },
            success : function(ret) {
                $('#c_select').html('<option value="0">--</option>' + ret);
            }
        });
    });


    // $("#detail-pic").fileinput({
    //     theme: 'explorer-fa',
    //     uploadUrl: 'img/upload',
    //     deleteUrl: "img/delete",
    //     overwriteInitial: false,
    //     // showPreview: false,
    //     initialPreviewAsData: true,
    //     initialPreview: [
    //         "http://lorempixel.com/1920/1080/nature/2",
    //         "http://lorempixel.com/1920/1080/nature/3"
    //     ],
    //     initialPreviewConfig: [
    //         {caption: "nature-2.jpg", size: 872378, width: "120px", key: 2},
    //         {caption: "nature-3.jpg", size: 632762, width: "120px", key: 3}
    //     ]
    // });

    $("#banner-pic").fileinput({
        theme: 'fa',
        uploadUrl: 'img/upload',
        deleteUrl: "img/delete",
        overwriteInitial: true,
        // showPreview: false,
        initialPreviewAsData: true,
        initialPreview: [],
        initialPreviewConfig: []
    });

    function submitBanner(){
        console.debug($("#list-pic").fileinput("getPreview"))
        // console.debug($("#list-pic").fileinput("getPreview").config[0].caption)
        var param = {};

        var partId = $('#body_select').find('option:selected').val();
        var cId = $('#c_select').find('option:selected').val();
        if (cId === "0")
            param.goId = partId;
        else
            param.goId = cId;

        var img = "";
        for(var i = 0; i < $("#banner-pic").fileinput("getPreview").config.length && i < 1; i ++){
            img = $("#banner-pic").fileinput("getPreview").config[i].caption;
        }
        param.imgUrl = img;

        home.banner.add(param);
    }
</script>