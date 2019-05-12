<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>闲置物区</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/book.css">

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


<!-- 导航 -->
<header>
    <nav class="navbar">
        <div class="nav-info">
            <a href="#" class="username">${user.getName()}</a>
            <a href="/myBookshelf.do" class="bookshelf">||&nbsp;&nbsp;&nbsp;我的书架</a>
            <a href="/orders/intomyorders" class="order">||&nbsp;&nbsp;&nbsp;我的订单</a>
            <a href="#" class="logout">[ 退 出 ]</a>
        </div> <!-- nav-info -->
        <form action="searchBook.do" method="post">
            <div class="nav-search">
                <a href="home.do"><img class="logo" src="<%=request.getContextPath()%>/img/logo2.png"></a>
                <div class="search-form">
                    <input id="search-input" name="name" type="search" class="searchIn" placeholder="搜图书...">
                    <a href="#" class="search-logo">| &nbsp;<img src="<%=request.getContextPath()%>/img/search.png"></a>
                    <button type="submit" id="search-button" class="searchBtn">搜索</button>
                </div>
            </div><!--  nav-search -->
        </form>
        <ul class="menu">
            <li><a href="/home.do">首页</a></li>
            <li><a href="/goBookStore.do">书籍良品</a></li>
            <li><a class="active" href="/goAskBookStore.do">闲置物区</a></li>
        </ul>
    </nav>
    <div class="askBook-pic"></div>
</header>
<!-- 图书分类 -->
<div id="container">
    <div id="book-container">
        <h3 class="book-title"><a href="#">| 所有求书信息</a></h3>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>闲置物ID</th>
                    <th>发布者</th>
                    <th>物品名字</th>
                    <th>价格</th>
                    <th>描述</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.spare}" var="s" varStatus="bookStatus">
                    <tr>
                        <td>${s.id}</td>
                        <td>${s.uid}</td>
                        <td>${s.name}</td>
                        <td>${s.price}</td>
                        <td>${s.description}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div> <!-- book-container end-->
    <span class="page-btn">
			<a href="?start=0" class="page-top">首页</a>
			<a href="?start=${page.getStart()-page.getCount()}" class="page-pre">上一页</a>
			<a href="?start=${page.getStart()+page.getCount()}" class="page-next">下一页</a>
			<a href="?start=${page.getEnd()}" class="page-end">尾页</a>
		</span>
</div><!-- container end-->
<footer>
    <a href="#">©2018-2019 二手书交易</a>
    <a href="#">意见反馈&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;隐私权声明&nbsp;&nbsp;&nbsp;使用条款</a>
</footer>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/session.js"></script>
<script type="text/javascript">
    $(function(){
        //菜单特效
        var index = 0
        $("#book-menu-toggle").on("click",function(){
            if (index ===0 ) {
                $("#book-menu").css("left","1px");
                $(this).css("left","178px");
                index =1;
            }else{
                $("#book-menu").css("left","-180px");
                $(this).css("left","1px");
                index=0;
            }
        });

        //点击菜单，对应类别颜色加深
        $(".book-class li").on("click",function(){
            //加粗当前点击的li
            $(this).css("font-weight","600").siblings("li").css("font-weight","500");
        });
    })
</script>
</body>
</html>
