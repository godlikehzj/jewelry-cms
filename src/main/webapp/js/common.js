
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

    toAdd : function () {
        getContent("commodity/add")
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
    }
}


