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
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/select/1.3.0/css/select.dataTables.min.css" rel="stylesheet">
    <link href="../../../css/editor.dataTable.min.css" rel="stylesheet" type="text/css">

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
                <li><a href="#">登出</a></li>
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
                <table id="dataTable" class="table table-striped">
                    <thead>
                    <tr>
                        <c:forEach items="${requestScope.pageField}" var="fieldItem">
                            <th>${fieldItem.value}</th>
                        </c:forEach>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/select/1.3.0/js/dataTables.select.min.js"></script>
<script src="../../../js/dataTables.editor.min.js"></script>

<script>
    var editor; // use a global for the submit and return data rendering in the examples
    $(document).ready(function () {
        // 初始化编辑器
        editor = new $.fn.dataTable.Editor( {
            ajax: {
                create: {
                    type: 'POST',
                    url:  '${requestScope.pageAPI}/create.json'
                },
                edit: {
                    type: 'PUT',
                    url:  '${requestScope.pageAPI}/update.json?id=_id_'
                },
                remove: {
                    type: 'DELETE',
                    url:  '${requestScope.pageAPI}/delete?id=_id_'
                }
            },
            table: "#dataTable",
            idSrc:  'id',
            fields: [
                <c:forEach items="${requestScope.pageField}" var="item1">
                { label:"${item1.value}",name:"${item1.key}" },
                </c:forEach>
            ]
        } );

        // 气泡编辑器
        $('#dataTable').on( 'click', 'tbody td:not(:first-child)', function (e) {
            editor.bubble( this );
        } );

        // DataTable初始化
        $('#dataTable').DataTable({
            dom: "Bfrtip",
            processing: true,
            serverSide: true,
            paging:true,
            ajax:"/data/user.json",
            columns: [
                <c:forEach items="${requestScope.pageField}" var="item">
                { "data": "${item.key}" },
                </c:forEach>
            ],
            order: [ 1, 'asc' ],
            select: {
                style:    'os',
                selector: 'td:first-child'
            },
            buttons: [
                { extend: "create", editor: editor, text:"新建" },
                { extend: "edit",   editor: editor, text:"修改"},
                { extend: "remove", editor: editor, text:"删除" }
            ]
        });
    });
</script>
</body>
</html>