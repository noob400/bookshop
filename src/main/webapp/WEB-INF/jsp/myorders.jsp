<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>${book.getName()}</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bookDetail.css">
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
    <div id="book-pic">
        <div class="book-big">
            <img src="<%=request.getContextPath()%>/img/book-list/article/${book.getBookImage().getId()}.jpg">
        </div>
        <span class="tip"></span>
    </div> <!-- book-pic-end -->

    <div id="login-container">
        <h2>请填写订单</h2>
        <br />
        <table>
            <tr><td>订单号</td><td>书名</td><td>订单数量</td><td>联系方式</td><td>联系人</td><td>总价</td><td>订单状态</td></tr>
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
        </table>
        <p id="errorInfo"></p>
    </div>

    <div id="book-content">
        <span class="book-tip">目送共由七十四篇散文组成，是为一本极具亲情、感人至深的文集。由父亲的逝世、母亲的苍老、儿子的离开、朋友的牵挂、兄弟的携手共行，写出失败和脆弱、失落和放手，写出缠绵不舍和绝然的虚无。正如作者所说：“我慢慢地、慢慢地了解到，所谓父女母子一场，只不过意味着，你和他的缘分就是今生今世不断地在目送他的背影。</span>
    </div>
</div><!--  container -->
<footer>
    <a href="#">©2018-2019 二手书交易</a>
    <a href="#">意见反馈&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;隐私权声明&nbsp;&nbsp;&nbsp;使用条款</a>
</footer>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.js"></script>

</body>
</html>
