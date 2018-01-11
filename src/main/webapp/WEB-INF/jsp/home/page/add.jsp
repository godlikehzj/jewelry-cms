<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="vendors/bootstrap-fileinput-master/css/fileinput.min.css" rel="stylesheet">
<link href="vendors/bootstrap-fileinput-master/css/fileinput-rtl.min.css" rel="stylesheet">

<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3 id="page_title"></h3>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>创建内容</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <br />
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">选择行数</label>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <select class="select2_single form-control" tabindex="-1" id="line">
                                    <option value="0" >请选择</option>
                                    <c:forEach var="line" items="${lines}">
                                        <option value="${line}">第${line - type * 1000}行</option>
                                    </c:forEach>
                                    <option value="${newLine}">新建行</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="width">宽度<span class="required">*</span>
                            </label>
                            <div class="col-md-3 col-sm-3s col-xs-12">
                                <input type="text" id="width" required="required" placeholder="0-16数字，每行总和16" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">选择类型</label>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <select class="select2_single form-control" tabindex="-1" id="ctype">
                                    <option value=1 selected="selected">文字</option>
                                    <option value=2 >图片</option>
                                    <option value=3 >视频</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group img_type none">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">选择类型</label>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <select class="select2_single form-control" tabindex="-1" id="type_select">
                                    <c:forEach var="type" items="${types}">
                                        <option value="${type.id}">${type.name}</option>
                                    </c:forEach>

                                </select>
                            </div>
                        </div>
                        <div class="form-group img_type none">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">选择部位</label>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <select class="select2_single form-control" tabindex="-1" id="body_select">
                                    <c:forEach var="body" items="${bodys}">
                                        <option value="${body.id}">${body.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group img_type none">
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

                        <div class="form-group img_type video_type none">
                            <label for="page-file" class="control-label col-md-3 col-sm-3 col-xs-12" id="content_label">图片</label>
                            <!--<div class="file-loading col-md-6 col-sm-6 col-xs-12">-->
                            <!--<input id="input-24" name="input24[]" type="file" multiple>-->
                            <!--</div>-->
                            <div class=" col-md-6 col-sm-6 col-xs-12">
                                <input id="page-file" type="file" multiple>
                            </div>
                        </div>

                        <div class="form-group text_type">
                            <label for="editor" class="control-label col-md-3 col-sm-3 col-xs-12">文字描述:</label>
                            <div id="editor" class="col-md-8 col-sm-8 col-xs-12">
                                <p>This is some sample content.</p>
                            </div>
                        </div>

                        <div class="form-group text_type">
                            <label for="editor" class="control-label col-md-3 col-sm-3 col-xs-12">文字描述(英文):</label>
                            <div id="en_editor" class="col-md-8 col-sm-8 col-xs-12">
                                <p>This is some sample content.</p>
                            </div>
                        </div>

                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button type="button" onclick="home.page.getList(home.page.type)" class="btn createbtn btn-primary">Cancel</button>
                                <button type="button" onclick="submitPage()" class="btn createbtn btn-success">Submit</button>
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


    if (home.page.type === 0){
        $("#page_title").html("首页->商品->修改")
    }else if (home.page.type === 1){
        $("#page_title").html("首页->加入我们->修改")
    }else{
        $("#page_title").html("首页->关于我们->修改")
    }


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

    $("#ctype").on('change', function () {

        var type = $(this).find('option:selected').val();
        if (type === "1"){
            $(".text_type").removeClass("none");
            $(".img_type").addClass("none");
            $(".video_type").addClass("none");
        }else if (type === "2"){
            $(".text_type").addClass("none");
            $(".video_type").addClass("none");
            $(".img_type").removeClass("none");
            $("#content_label").html("图片")
        }else{
            $(".text_type").addClass("none");
            $(".img_type").addClass("none");
            $(".video_type").removeClass("none");
            $("#content_label").html("视频")
        }
    });

    $("#page-file").fileinput({
        theme: 'fa',
        uploadUrl: img_upload_url,
        deleteUrl: img_delete_url,
        overwriteInitial: true,
        maxFileCount:1,
        // showPreview: false,
        showUpload:true,
        initialPreviewAsData: true,
        initialPreview : [],
        initialPreviewConfig:[],
        maxFileSize: 10000000
    });

    var E = window.wangEditor;
    var editor = new E('#editor');
    // editor.customConfig.uploadImgServer = rich_upload_url;
    editor.create();
    <%--editor.txt.html('${commodity.body}');--%>


    var E2 = window.wangEditor;
    var en_editor = new E2('#en_editor');
    // en_editor.customConfig.uploadImgServer = rich_upload_url;
    en_editor.create();
    <%--en_editor.txt.html('${commodity.enBody}');--%>

    function submitPage(){
        var param = {};

        param.lineOrder = parseInt($('#line').find('option:selected').val());
        param.cType = $('#ctype').find('option:selected').val();

        param.goId = 0;
        if (param.cType === "1"){
            //文字
            param.content = editor.txt.html();
            param.enContent = en_editor.txt.html();
        }else {
            //图片 视频
            var file = "";
            for(var i = 0; i < $("#page-file").fileinput("getPreview").config.length && i < 1; i ++){
                file = $("#page-file").fileinput("getPreview").config[i].caption;
            }

            param.content = file;
            param.enContent = file;

            if (param.cType === "2"){
                var partId = $('#body_select').find('option:selected').val();
                var cId = $('#c_select').find('option:selected').val();
                if (cId === "0")
                    param.goId = partId;
                else
                    param.goId = cId;
            }
        }

        param.widthNum =$('#width').val();

        console.log(param);
        home.page.add(param);
    }
</script>