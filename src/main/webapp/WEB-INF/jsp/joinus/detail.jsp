<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>加入我们 <button type="button" class="btn btn-round btn-success" onclick="joinus.toModify(${joinus.id})">修改</button></h3>

        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>中文内容</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    ${joinus.content}
                </div>
            </div>
        </div>

        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>英文内容</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    ${joinus.enContent}
                </div>
            </div>
        </div>
    </div>
</div>


