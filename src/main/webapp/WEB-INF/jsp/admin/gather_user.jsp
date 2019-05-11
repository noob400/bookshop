<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="com.bookshop.common.Constants" %>
<html >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>管理员 | 校园二手书交易平台</title>

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/main.css" rel="stylesheet" type="text/css">


    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.css" rel="stylesheet">
    <script src="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.js"></script>

    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">校园二手书交易平台</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="logout">登出</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <c:forEach items="${Constants.MENU_SLIDE_BAR}" var="slideItem" >
                    <li><a href="${slideItem.value}">${slideItem.key}</a></li>
                </c:forEach>
            </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">Dashboard</h1>
            <div id="toolbar" class="btn-group">
                <button id="btn_add" type="button" class="btn btn-default"
                        data-toggle="modal" data-target="#edit_form">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                </button>
                <button id="btn_edit" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                </button>
                <button id="btn_delete" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
            </div>

            <table  id="table"
                    data-toggle="table"
                    data-height="460"
                    data-unique-id="id"
                    data-click-to-select="true"
                    data-search="true"
                    data-side-pagination="server"
                    data-pagination="true"
                    data-url="${requestScope.pageAPI}.json">
                <thead>
                <tr>
                    <th data-field="state" data-checkbox="true"></th>
                    <c:forEach items="${requestScope.pageField}" var="item">
                        <th data-field="${item.key}">${item.value}</th>
                    </c:forEach>
                </tr>
                </thead>
            </table>
        </div>
        </div>
</div>


    <div class="modal fade" id="edit_form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">${requestScope.pageName} - 新增</h4>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" role="form" id="dform" onsubmit="return false" action="##" method="post">
                    <c:forEach items="${requestScope.pageField}" var="field" >
                        <div class="form-group">
                            <label for="${field.key}" class="col-sm-2 control-label">${field.value}</label>
                            <div class="col-sm-9">
                                <input type="text" id="${field.key}" name="${field.key}" class="form-control well" placeholder="请输入${field.value}"/>
                            </div>
                        </div>
                    </c:forEach>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="data_submit" type="submit" class="btn btn-primary" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
    </div>


<script>
    function contain(elem,arr){
        if(arr!=null ){
            for(var i=0;i<arr.length;i++){}
            if(arr[i]===elem){
                return true;
            }
        }
        return false;
    }

    var $table = $('#table');
    var $data_submit = $('#data_submit');
    var $btn_del = $('#btn_delete');
    var $btn_edit = $('#btn_edit');

    $(function() {
        $data_submit.click(function () {
            // Post changing request
            $.ajax({
                url:"${requestScope.pageAPI}/modify.json",
                type:"POST",
                data: $('#dform').serialize()
            });

            // Fire UI
            var row_id = $('#dform').val();
            var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
                return row.id
            });

            $table.bootstrapTable(contain(row_id,ids)?'updateRow':'insertRow', {
                index: row_id,
                row: {
                    <c:forEach items="${requestScope.pageField}" var="field" >
                    ${field.key}:$('#${field.key}').val(),
                    </c:forEach>
                }
            });
        });

        $btn_edit.click(function () {
            var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
                return row.id
            });
            var selected_data = $table.bootstrapTable('getRowByUniqueId', ids[0]);
            console.log(selected_data);
            <c:forEach items="${requestScope.pageField}" var="field" >
            $('#${field.key}').val(selected_data.${field.key});
            </c:forEach>
            $('#edit_form').modal('show');

        });


        $btn_del.click(function () {
            var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
                $.ajax({
                    url:"${requestScope.pageAPI}/delete.json",
                    type:"POST",
                    data: {id:row.id}
                });
                return row.id
            });

            $table.bootstrapTable('remove', {
                field: 'id',
                values: ids
            })
        })
    })

</script>
</body>
</html>