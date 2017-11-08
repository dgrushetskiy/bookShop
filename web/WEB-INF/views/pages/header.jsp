<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="pages.title"/></title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <link href="${pageContext.request.contextPath}/static/css/non-responsive.css"  rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css">

    <link href="${pageContext.request.contextPath}/static/image/apple-touch-icon.png"  rel="icon">
</head>
<body>
<div class="page-top" style="width: 100%; height: 20px; background-color: #f46b42;"></div>

<jsp:include page="menu.jsp"/>

