<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">


<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>分类管理</h3>
        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>添加二级分类</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <br />
                    <form id="modify_type" data-parsley-validate class="form-horizontal form-label-left" role="form">
                        <input type="text" id="type_id" class="none" value="${type.id}">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="type-name">所属一级分类
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="type-name" readonly="readonly" placeholder="${type.name}" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">中文名称<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="name" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="en-name">英文名称<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="en-name" name="en-name" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">是否上线</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div id="gender" class="btn-group" data-toggle="buttons">
                                    <label class="btn" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                        上线:<input type="radio" class="flat" name="status" id="online" value="1" checked="checked"/>
                                    </label>
                                    <label class="btn" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                        下线:<input type="radio" class="flat" name="status" id="offline" value="0" />
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button type="button" class="btn createbtn btn-success" onclick="addPart()">创建</button>
                                <button type="button" class="btn createbtn btn-primary" onclick="jtype.getDetails($('#type_id').val())">取消</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="vendors/iCheck/icheck.min.js"></script>
<script src="vendors/custom/custom.min.js"></script>
<script>
    function addPart() {
        var param = {};
        param.name = $('#name').val();
        param.enName = $('#en-name').val();
        param.status = $('input:radio:checked').val();
        param.typeId = $('#type_id').val();
        jtype.addPart(param);
    }
</script>