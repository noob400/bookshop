<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>我的书架</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/myBookshelf.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<!-- 导航条 -->
<nav class="navbar">
    <div class="nav-menu">
        <ul class="menu">
            <li><a class="active" href="/home.do">首页</a></li>
            <li><a href="/goBookStore.do">书籍良品</a></li>
            <li><a href="/goAskBookStore.do">闲置物区</a></li>
        </ul>
    </div><!-- nav-menu -->

    <div class="nav-search">
        <form action="searchBook.do" method="post">
            <input type="search" class="searchIn" name="name" placeholder="搜图书...">
            <button class="search-logo"><img src="<%=request.getContextPath()%>/img/search2.png"></button>
        </form>
    </div>

    <div class="nav-info">
        <a href="#" class="username">${user.getName()}</a>
        <a href="/myBookshelf.do" class="bookshelf">||&nbsp;&nbsp;&nbsp;我的书架</a>
        <a href="/orders/intomyorders" class="order">||&nbsp;&nbsp;&nbsp;我的订单</a>
        <a href="#" class="logout">[ 退 出 ]</a>
    </div> <!-- nav-info-end -->
</nav>

<!-- 个人信息 -->
<div class="row">
    <div class="col-md-6 col-md-offset-3">
<form  id="editform" onsubmit="return false" action="##" method="post">
          <div class="form-group">
              <label for="tel" >联系:</label>
            <input id="tel" class="form-control" name="tel" type="text" value="${user.getTel()}"></p>
          </div>
          <div class="form-group">
              <label for="address" >地址：</label>
            <input name="address" class="form-control" id="address" type="text" value="${user.getAddress()}">
          </div>
          <div class="form-group">
           <label for="major" >年级专业：</label>
              <input name="major" class="form-control" id="major" type="text" value="${user.getMajor()}">
          </div>
            <button  class="btn btn-default" type="submit" onclick="login()">修改</button>
    <!-- person-info-end -->
</form>
        <p id="errorInfo"></p>
    </div>
</div>
<footer>
    <p align="center" href="#">©2018-2019 二手书交易</p>
    <p align="center" href="#">意见反馈&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;隐私权声明&nbsp;&nbsp;&nbsp;使用条款</p>
</footer>

<!-- javascript- -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/myBookshelf.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/session.js"></script>
<script>
    function login() {
        $('#errorInfo').html("");
        var tel = $('#tel').val();
        var address = $('#address').val();
        var major = $('#major').val();
        if (tel.length==0||address.length == 0 || major.length == 0) {
            $('#errorInfo').html("请填全信息！");
            return false;
        }
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/edit/changeselfmassege.do" ,//url
            data: $('#editform').serialize(),
            success: function (result) {
                location.href = "/edit/intoprofile";

            },
            error:function (result) {
                console.log("haha");
            }

        });
    }
</script>
</body>
</html>
