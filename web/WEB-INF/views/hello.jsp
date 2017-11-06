<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="false"%>
<html>
<body>
<h1>Title : ${title}</h1>
<h1>Message : ${message}</h1>
<div class="well">
    <a href="<c:url value='/login' />">login User</a>
</div>
</body>
</html>
