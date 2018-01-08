<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="vendors/bootstrap-fileinput-master/css/fileinput.min.css" rel="stylesheet">
<link href="vendors/bootstrap-fileinput-master/css/fileinput-rtl.min.css" rel="stylesheet">
<link href="vendors/bootstrap-fileinput-master/themes/explorer-fa/theme.css" media="all" rel="stylesheet" type="text/css"/>
<link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>商品管理</h3>
        </div>

        <div class="title_right">
            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>添加商品</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <br />
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">详情页标题<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="title" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="enTitle">详情页标题(英文)<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="enTitle" name="enTitle" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="listTitle">列表页标题<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="listTitle" name="listTitle" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="enlistTitle">列表页标题(英文)<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="enlistTitle" name="enlistTitle" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="price">价格<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="price" name="price" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>

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
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">选择材质</label>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <select class="select2_single form-control" tabindex="-1" id="m_select">
                                    <c:forEach var="meterial" items="${meterials}">
                                        <option value="${meterial.id}">${meterial.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">是否上线</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div id="status" class="btn-group" data-toggle="buttons">
                                    <label class="btn" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                        上线:<input type="radio" class="flat" name="status" id="online" value="1" checked="checked"/>
                                    </label>
                                    <label class="btn" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                        下线:<input type="radio" class="flat" name="status" id="offline" value="0" />
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="list-pic" class="control-label col-md-3 col-sm-3 col-xs-12">列表页图片</label>
                            <!--<div class="file-loading col-md-6 col-sm-6 col-xs-12">-->
                            <!--<input id="input-24" name="input24[]" type="file" multiple>-->
                            <!--</div>-->
                            <div class=" col-md-6 col-sm-6 col-xs-12">
                                <input id="list-pic" type="file" multiple>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="detail-pic" class="control-label col-md-3 col-sm-3 col-xs-12">详情页图片</label>
                            <!--<div class="file-loading col-md-6 col-sm-6 col-xs-12">-->
                            <!--<input id="input-24" name="input24[]" type="file" multiple>-->
                            <!--</div>-->
                            <div class=" col-md-6 col-sm-6 col-xs-12">
                                <input id="detail-pic" type="file" multiple>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editor" class="control-label col-md-3 col-sm-3 col-xs-12">文字描述:</label>
                            <div id="editor" class="col-md-8 col-sm-8 col-xs-12">
                                <p>This is some sample content.</p>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="editor" class="control-label col-md-3 col-sm-3 col-xs-12">文字描述(英文):</label>
                            <div id="en_editor" class="col-md-8 col-sm-8 col-xs-12">
                                <p>This is some sample content.</p>
                            </div>
                        </div>

                        <!--<div class="form-group">-->
                        <!--<label for="list-pic" class="control-label col-md-3 col-sm-3 col-xs-12">详情页图片</label>-->
                        <!--&lt;!&ndash;<div class="file-loading col-md-6 col-sm-6 col-xs-12">&ndash;&gt;-->
                        <!--&lt;!&ndash;<input id="input-24" name="input24[]" type="file" multiple>&ndash;&gt;-->
                        <!--&lt;!&ndash;</div>&ndash;&gt;-->
                        <!--<div class=" col-md-6 col-sm-6 col-xs-12">-->
                        <!--<input id="list-pic" type="file" multiple>-->
                        <!--</div>-->
                        <!--</div>-->

                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button type="button" onclick="commodity.getList()" class="btn btn-round btn-primary">Cancel</button>
                                <button type="button" onclick="submitCommodity()" class="btn btn-round btn-success">Submit</button>
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
<script src="vendors/bootstrap-fileinput-master/themes/explorer-fa/theme.js" type="text/javascript"></script>
<script src="vendors/bootstrap-fileinput-master/themes/fa/theme.js" type="text/javascript"></script>
<script src="vendors/wangEditor-3.0.15/release/wangEditor.min.js" type="text/javascript"></script>
<script src="vendors/iCheck/icheck.min.js"></script>
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
            }
        });

        params.type = 1;
        $.ajax({
            type : "POST",
            url : "type/change",
            data : params,
            error : function() {
            },
            success : function(ret) {
                $('#m_select').html(ret);
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

    $("#detail-pic").fileinput({
        theme: 'fa',
        uploadUrl: 'img/upload',
        deleteUrl: "img/delete",
        overwriteInitial: false,
        // showPreview: false,
        initialPreviewAsData: true,
        initialPreview: [],
        initialPreviewConfig: []
    });


    $("#list-pic").fileinput({
        theme: 'fa',
        uploadUrl: 'img/upload',
        deleteUrl: "img/delete",
        overwriteInitial: false,
        initialPreviewAsData: true,
        maxFileCount:1,
        initialPreview: [],
        initialPreviewConfig: []
    });

    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.customConfig.uploadImgServer = '/rich/img/upload'
    editor.create();


    var E2 = window.wangEditor;
    var en_editor = new E2('#en_editor');
    en_editor.customConfig.uploadImgServer = '/rich/img/upload'
    en_editor.create();



    function submitCommodity(){
        console.debug($("#list-pic").fileinput("getPreview"))
        // console.debug($("#list-pic").fileinput("getPreview").config[0].caption)
        var param = {};
        param.title = $('#title').val();
        param.enTitle = $('#enTitle').val();
        param.listTitle = $('#listTitle').val();
        param.enListTitle = $('#enlistTitle').val();
        param.price = $('#price').val();
        param.title = $('#title').val();
        param.typeId = $('#type_select').find('option:selected').val();
        param.meterialId = $('#m_select').find('option:selected').val();
        param.partId = $('#body_select').find('option:selected').val();
        param.title = $('#title').val();
        param.body = editor.txt.html();
        param.enBody = en_editor.txt.html();
        param.status = $('input:radio:checked').val();
        var detail_img = [];
        for(var i = 0; i < $("#detail-pic").fileinput("getPreview").config.length; i ++){
            detail_img.push($("#detail-pic").fileinput("getPreview").config[i].caption);
        }
        param.detail_img = JSON.stringify(detail_img);

        var list_img = [];
        for(var i = 0; i < $("#list-pic").fileinput("getPreview").config.length; i ++){
            list_img.push($("#list-pic").fileinput("getPreview").config[i].caption);
        }
        param.list_img = JSON.stringify(list_img);

        commodity.add(param);
    }
</script>