<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="com.bookshop.common.Constants" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>管理员 | 校园二手书交易平台</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../../css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../../../css/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="../../../css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../../../css/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../../css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../../../css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>

<body>

<div id="wrapper">


    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="gather_user.do">校园二手书交易平台</a>
        </div>


        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li class="divider"></li>
                    <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
            </li>
        </ul>

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </li>
                    <c:forEach items="${Constants.MENU_SLIDE_BAR}" var="slideItem">
                        <li>
                            <a href="${slideItem.value}"><i class="fa fa-dashboard fa-fw"></i> ${slideItem.key}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </nav>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">${requestScope.pageName}</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <di class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTable">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>学号</th>
                                <th>名字</th>
                                <th>密码</th>
                                <th>性别</th>
                                <th>电话</th>
                                <th>地址</th>
                                <th>专业</th>
                            </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </di>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- jQuery -->
<script src="../../../js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../../js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../../../js/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="../../../js/jquery.dataTables.min.js"></script>
<script src="../../../js/dataTables.bootstrap.min.js"></script>
<script src="../../../js/dataTables.responsive.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../../../js/sb-admin-2.js"></script>


<script>
    $(document).ready(function () {
        $('#dataTable').DataTable({
            processing: true,
            serverSide: true,
            ajax:"/data/user.json",
            columns: [
                { "data": "id" },
                { "data": "name" },
                { "data": "password" },
                { "data": "sex" },
                { "data": "studentid" },
                { "data": "tel" },
                { "data": "address" },
                { "data": "major" }
            ],
        });
    });

</script>
</body>
</html>
