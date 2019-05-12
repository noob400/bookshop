<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    boolean isAdminMode =request.getAttribute("mode")!=null && request.getAttribute("mode").equals("admin");
%>
<html>
<head>
    <title>${book.getName()}</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bookDetail.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
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

<div class="container">
    <div id="book-pic">
        <div class="book-big">
            <img src="<%=request.getContextPath()%>/img/book-list/article/${book.getBookImage().getId()}.jpg">
        </div>
        <span class="tip"></span>
    </div> <!-- book-pic-end -->
    <div id="book-info">
        <span class="book-name">${book.getName()}</span>
        <span class="book-publish">${book.getAuthor()} 著 / ${book.getPress()} / ${book.getPublishDate()} / ${book.getVersion()}</span>
        <span class="book-price">
				<p>售价 <a class="final-price">￥${book.getPrice()}</a></p>
				<p>定价 <a class="original-price">￥${book.getOriginalPrice()} </a></p>
			</span>
        <span class="book-descr">
                <p>品相 <a class="condition">${book.getDegree()}新</a></p>
				<p>商品描述<a class="book-desc">${book.getDescription()}</a></p>
				<p>上书时间<a class="upload-time">2018-03-20</a></p>
			</span>
        <span class="buy-now"><a href="/orders/order/${book.getId()}" >立即联系卖家进行购买</a></span>
    </div> <!-- book-info-end -->

    <div id="login-container">
        <h3 class="book-title"><a href="#">| 填写订单</a></h3>
        <br />
        <form id="form" onsubmit="return false" action="##" method="post">
            <div class="form-group">
                <label for="counts">购买数量</label>
                <input type="text" class="form-control" id="counts" name="counts" placeholder="数量">
            </div>
            <div class="form-group">
                <label for="contactway">联系方式</label>
            <input type="text" class="form-control" id="contactway" name="contactway" placeholder="联系方式">
            </div>
            <div class="form-group">
                <label for="contactname">联系人</label>
            <input type="text" class="form-control" id="contactname" name="contactname" placeholder="联系人">
            </div>
            <button  id="order-button" class="btn btn-default" type="submit" onclick="login()">提交</button><br/>
        </form>
        <p id="errorInfo"></p>
    </div>

</div><!--  container -->
<footer>
    <p align="center" href="#">©2018-2019 二手书交易</p>
    <p align="center" href="#">意见反馈&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;隐私权声明&nbsp;&nbsp;&nbsp;使用条款</p>
</footer>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.js"></script>
<script>
    function login() {
        $('#errorInfo').html("");
        var counts = $('#counts').val();
        var contactway = $('#contactway').val();
        var contactname = $('#contactname').val();
        if (counts.length==0||contactway.length == 0 || contactname.length == 0) {
            $('#errorInfo').html("请填全信息！");
            return false;
        }
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/orders/addorder" ,//url
            data: $('#form').serialize(),
            success: function (result) {
                    location.href = "/orders/intomyorders";

            }

        });
    }
</script>
</body>
</html>
