
function getContent(url, params){
    $.ajax({
        type : "POST",
        url : url,
        data : params,
        error : function() {
        },
        success : function(ret) {
            $('#content').html(ret);
        }
    });
}

var rich_upload_url = "/cms/rich/img/upload";
var img_upload_url = "img/upload";
var img_delete_url = "img/delete";

var user = {
    login : function (params) {
        $.ajax({
            type : "POST",
            url : "login",
            data : params,
            error : function() {
            },
            success : function(ret) {
                if (ret.code === 0){
                    window.location.href = "/";
                }else{
                    alert(ret.msg);
                }
            }
        });
    },

    logout : function (params) {
        $.ajax({
            type : "POST",
            url : "logout",
            data : params,
            error : function() {
            },
            success : function(ret) {
                if (ret.code === 0){
                    window.location.href = "/";
                }else{
                    alert(ret.msg);
                }
            }
        });
    }
};
var jtype = {
    getDetails : function (typeId) {
        var url = "jtype";
        var param = {};
        param.typeId = typeId;
        getContent(url, param);
    },

    toModifyType : function (typeId) {
        if (typeId === undefined || typeId === ""){
            alert("请选定要修改行");
            return;
        }
        var url = "/type/toModify";
        var param = {} ;
        param.typeId = typeId;
        getContent(url, param);
    },

    modifyType : function (params) {
        if(window.confirm('你确定要修改吗？')){
            $.ajax({
                type : "POST",
                url : "type/doModify",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        jtype.getDetails(params.id);
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },

    toAddType : function () {
        getContent("type/toAdd");
    },

    addType : function (params) {
        if(window.confirm('你确定要添加吗？')){
            $.ajax({
                type : "POST",
                url : "type/doAdd",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        jtype.getDetails(ret.data);
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }

    },

    toModifyPart : function (partId) {
        console.debug(partId)
        if (partId === undefined || partId === ""){
            alert("请选定要修改行");
            return;
        }
        var url = "/part/toModify";
        var param = {} ;
        param.partId = partId;
        getContent(url, param);
    },

    modifyPart : function (params) {
        if(window.confirm('你确定要修改吗？')){
            $.ajax({
                type : "POST",
                url : "part/doModify",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        jtype.getDetails(ret.data);
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },

    toAddPart : function (typeId) {
        var param = {} ;
        param.typeId = typeId;
        getContent("part/toAdd", param);
    },

    addPart : function (params) {
        if(window.confirm('你确定要添加吗？')){
            $.ajax({
                type : "POST",
                url : "part/doAdd",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        jtype.getDetails(ret.data);
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },

    toModifyMeterial : function (meterialId) {
        if (meterialId === undefined || meterialId === ""){
            alert("请选定要修改行");
            return;
        }
        var url = "/meterial/toModify";
        var param = {} ;
        param.meterialId = meterialId;
        getContent(url, param);
    },

    modifyMeterial : function (params) {
        if(window.confirm('你确定要修改吗？')){
            $.ajax({
                type : "POST",
                url : "meterial/doModify",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        jtype.getDetails(ret.data);
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },

    toAddMeterial : function (typeId) {
        var param = {} ;
        param.typeId = typeId;
        getContent("meterial/toAdd", param);
    },

    addMeterial : function (params) {
        if(window.confirm('你确定要添加吗？')){
            $.ajax({
                type : "POST",
                url : "meterial/doAdd",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        jtype.getDetails(ret.data);
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    }
}

var commodity ={
    getList:function () {
        var url = "commodity/list";
        var param = {};
        // param.typeId = typeId;
        getContent(url, param);
    },
    delete : function (commodityId) {
        var param = {};
        param.commodityId = commodityId;
        if(window.confirm('你确定要删除吗？')){
            $.ajax({
                type : "POST",
                url : "commodity/delete",
                data : param,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        commodity.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },
    toAdd : function () {
        getContent("commodity/add")
    },

    toModify : function (commodityId) {
        var param = {};
        param.commodityId = commodityId;

        getContent("commodity/modify", param)
    },

    add : function (params) {
        if(window.confirm('你确定要添加吗？')){
            $.ajax({
                type : "POST",
                url : "commodity/doAdd",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        commodity.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },
    modify : function (params) {
        if(window.confirm('你确定要修改吗？')){
            $.ajax({
                type : "POST",
                url : "commodity/doModify",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        commodity.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    }
};

var home = {

    banner :{
        orderList : function (params) {
            $.ajax({
                type : "POST",
                url : "home/banner/order",
                data : params,
                error : function(ret) {
                    alert(ret.msg);
                },
                success : function(ret) {
                    home.banner.getList();
                }
            });
        },
        getList : function () {
            getContent("home/banner/list")
        },
        add : function (params) {
            if(window.confirm('你确定要添加吗？')){
                $.ajax({
                    type : "POST",
                    url : "home/banner/doAdd",
                    data : params,
                    error : function() {
                    },
                    success : function(ret) {
                        if (ret.code === 0){
                            home.banner.getList();
                        }else{
                            alert(ret.msg);
                        }
                    }
                });
            }else{

            }
        },
        toAdd : function () {
            getContent("home/banner/toAdd");
        },
        toModify : function (id) {
            var param = {};
            param.bid = id;
            getContent("home/banner/toModify", param);
        },
        modify : function (params) {
            if(window.confirm('你确定要修改吗？')){
                $.ajax({
                    type : "POST",
                    url : "home/banner/doModify",
                    data : params,
                    error : function() {
                    },
                    success : function(ret) {
                        if (ret.code === 0){
                            home.banner.getList();
                        }else{
                            alert(ret.msg);
                        }
                    }
                });
            }else{

            }
        },
        delete : function (id) {
            var param = {};
            param.id = id;
            if(window.confirm('你确定要删除吗？')){
                $.ajax({
                    type : "POST",
                    url : "home/banner/delete",
                    data : param,
                    error : function() {
                    },
                    success : function(ret) {
                        if (ret.code === 0){
                            home.banner.getList();
                        }else{
                            alert(ret.msg);
                        }
                    }
                });
            }else{

            }
        }
    },

    page : {
        // 0 商品， 1 关于我们 2加入我们
        type : 0,
        getList :function (type,line) {
            var param = {};
            if (type == null){
                param.type = home.page.type;
            }else{
                param.type = type;
                home.page.type = type;
            }
            param.line = line;

            getContent("home/page/list", param);
        },
        toAdd:function () {
            var param = {};
            param.type = home.page.type;
            getContent("home/page/toAdd", param);
        },

        add:function (param) {
            if(window.confirm('你确定要添加吗？')){
                $.ajax({
                    type : "POST",
                    url : "home/page/doAdd",
                    data : param,
                    error : function() {
                    },
                    success : function(ret) {
                        if (ret.code === 0){
                            home.page.getList(home.page.type);
                        }else{
                            alert(ret.msg);
                        }
                    }
                });
            }else{

            }
        },
        toModify:function (id) {
            var param = {};
            param.id = id;
            param.type = home.page.type;
            getContent("home/page/toModify", param);
        },
        modify : function (param) {
            if(window.confirm('你确定要修改吗？')){
                $.ajax({
                    type : "POST",
                    url : "home/page/doModify",
                    data : param,
                    error : function() {
                    },
                    success : function(ret) {
                        if (ret.code === 0){
                            home.page.getList(home.page.type);
                        }else{
                            alert(ret.msg);
                        }
                    }
                });
            }else{

            }
        },
        delete : function (id) {
            var param = {};
            param.id = id;
            if(window.confirm('你确定要删除吗？')){
                $.ajax({
                    type : "POST",
                    url : "home/page/delete",
                    data : param,
                    error : function() {
                    },
                    success : function(ret) {
                        if (ret.code === 0){
                            home.page.getList(home.page.type);
                        }else{
                            alert(ret.msg);
                        }
                    }
                });
            }else{

            }
        },
        orderList : function (params) {
            $.ajax({
                type : "POST",
                url : "home/page/order",
                data : params,
                error : function(ret) {
                    alert(ret.msg);
                },
                success : function(ret) {
                    home.page.getList(home.page.type);
                }
            });
        }
    }
};

var joinus = {
    detail : function () {
        getContent("joinus/detail");
    },
    toModify :function () {
        getContent("joinus/toModify");
    },
    modify :function (param) {
        if(window.confirm('你确定要修改吗？')){
            $.ajax({
                type : "POST",
                url : "joinus/doModify",
                data : param,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        joinus.detail();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    }
};

var about_us = {
    cur_id : 0,
    detail : function () {
        getContent("aboutUs/detail");
    },
    toAdd : function () {
        getContent("aboutUs/toAdd");
    },
    add : function (param) {
        if(window.confirm('你确定要添加吗？')){
            $.ajax({
                type : "POST",
                url : "aboutUs/doAdd",
                data : param,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        about_us.detail();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },
    toModify : function (id) {
        var param = {};
        param.id =id;
        getContent("aboutUs/toModify", param);
    },
    modify : function (params) {

        if(window.confirm('你确定要修改吗？')){
            $.ajax({
                type : "POST",
                url : "aboutUs/doModify",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        about_us.detail();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },
    delete : function (id) {
        if(window.confirm('你确定要修改吗？')){
            $.ajax({
                type : "POST",
                url : "aboutUs/delete",
                data : {"id":id},
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        about_us.detail();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    }
}


