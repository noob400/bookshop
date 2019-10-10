<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    boolean isAdminMode = request.getAttribute("mode") != null && request.getAttribute("mode").equals("admin");
%>

<html>
<head>
    <title>管理员注册 | 校园二手书交易平台</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css">
</head>
<body>
<div id="login-container">
    <h2>用户注册 | 二手书交易平台</h2>
    <br/>
    <form>
        <input type="text" id="studentid" class="userName" placeholder="学号"><br/>
        <input type="password" id="password" class="password" placeholder="密码"><br/>
        <button class="loginBtn" id="login-button" type="submit">注册</button><br/>
        <a class="forgetPass2" href="/users/">登录?</a>
        <br/>
    </form>
    <p id="errorInfo"></p>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.js"></script>
<script type="text/javascript">

    $(function () {
        $('#login-button').click(function (event) {
            $('#errorInfo').html("");
            var studentid_ = $('#studentid').val();
            var password_ = $('#password').val();
            if (studentid_.length == 0 || password_.length == 0) {
                $('#errorInfo').html("学号或密码不能为空！");
                return false;
            }

            var data_ = {"studentid": studentid_, "password": password_};
            var jsonData = JSON.stringify(data_);
            $.ajax({
                type: "POST",
                url: "/users/checkSignIn",
                async: false,
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                data: jsonData,
                success: function (result) {
                    if (result.resultCode === 200) {
                        event.preventDefault();
                        location.href = "/home.do";
                    } else {
                        event.preventDefault();
                        $('#errorInfo').html(result.message);
                    }
                }
            });
        });
    })
</script>
</body>
</html>
