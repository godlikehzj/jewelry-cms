<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>关于我们->创建</h3>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>创建标签</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <br />
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">标签标题<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="title" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="enTitle">标签标题(英文)<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="enTitle" name="enTitle" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="editor" class="control-label col-md-3 col-sm-3 col-xs-12">文字描述:</label>
                            <div id="editor" class="col-md-8 col-sm-8 col-xs-12">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="editor" class="control-label col-md-3 col-sm-3 col-xs-12">文字描述(英文):</label>
                            <div id="en_editor" class="col-md-8 col-sm-8 col-xs-12">
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
                                <button type="button" onclick="about_us.detail()" class="btn btn-round btn-primary">Cancel</button>
                                <button type="button" onclick="submitAbout()" class="btn btn-round btn-success">Submit</button>
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

    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.customConfig.uploadImgServer = '/rich/img/upload';
    editor.customConfig.uploadFileName = 'editorUploadFileName';
    editor.create();


    var E2 = window.wangEditor;
    var en_editor = new E2('#en_editor');
    en_editor.customConfig.uploadImgServer = '/rich/img/upload';
    en_editor.customConfig.uploadFileName = 'editorUploadFileName';
    en_editor.create();



    function submitAbout(){

        var param = {};
        param.tabName = $('#title').val();
        param.enTabName = $('#enTitle').val();
        param.content = editor.txt.html();
        param.enContent = en_editor.txt.html();
        param.status = 1;
        console.log(param)

        about_us.add(param);
    }
</script>