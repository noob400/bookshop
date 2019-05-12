<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>${book.getName()}</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bookDetail.css">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        <a href="#" class="logout">[ 退 出 ]</a>
    </div> <!-- nav-info-end -->
</nav>

<div class="container">
    <div id="book-container">
        <h3 class="book-title"><a href="#">| 订单列表</a></h3>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr><td>订单号</td><td>书名</td><td>订单数量</td><td>联系方式</td><td>联系人</td><td>总价</td><td>订单状态</td></tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="orders">
                <c:if test="${orders.orderid<0}">
                    <tr><td>无</td><td>无</td><td>无</td><td>无</td>
                        <td>无</td><td>无</td><td>无</td></tr>
                </c:if>
                <c:if test="${orders.orderid>0}">
                    <tr><td>${orders.orderid}</td><td>${orders.bookname}</td><td>${orders.counts}</td><td>${orders.contactway}</td>
                    <td>${orders.contactname}</td><td>${orders.price}元</td><td><a href="pay.do">${orders.orderstatus}</a></td></tr>
                </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
    </div>
    <footer>
        <div align="center">
      <span  class="page-btn">
			<a href="?start=0" class="page-top">首页</a>
			<a href="?start=${page.getStart()-page.getCount()}" class="page-pre">上一页</a>
			<a href="?start=${page.getStart()+page.getCount()}" class="page-next">下一页</a>
			<a href="?start=${page.getEnd()}" class="page-end">尾页</a>
		</span>
        </div>
        </footer>
</div><!--  container -->
<footer >
    <p align="center" href="#">©2018-2019 二手书交易</p>
    <p align="center" href="#">意见反馈&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;隐私权声明&nbsp;&nbsp;&nbsp;使用条款</p>
</footer>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.js"></script>

</body>
</html>
