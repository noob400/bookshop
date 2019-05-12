<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>我的书架</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/myBookshelf.css">
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


<form action="/edit/changeselfmassege.do" method="post" enctype="multipart/form-data" id="bookForm" class="upload-form">
<div class="person-info">
    <p>
        <a href="#" class="name">${user.getName()}</a>
    </p>
    <p>
        <a href="#" class="sex" >${user.getSex()}</a>
    </p>
    <div class="contact">
        <p>
            <span class="call-icon"></span>
            联&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系：
            <input name="tel" type="text" value="${user.getTel()}"></p>
        <p>
            <span class="address-icon"></span>
            住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:<input name="address" type="text" value="${user.getAddress()}">
        </p>
        <p>
            <span class="major-icon"></span>
            &nbsp;&nbsp;年级专业：<input name="major" type="text" value="${user.getMajor()}"></a>
        </p>
        <div class="ask container">
           <input type="button" class="submit-btn"  value="修改">
        </div>
    </div>
</div><!-- person-info-end -->
</form>







<footer>
    <a href="#">©2018-2019 二手书交易</a>
    <a href="#">意见反馈&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;隐私权声明&nbsp;&nbsp;&nbsp;使用条款</a>
</footer>

<!-- javascript- -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/myBookshelf.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/session.js"></script>

</body>
</html>
