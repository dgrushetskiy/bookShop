<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav class="navbar navbar-default navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/"><spring:message code="menu.pages.index"/></a>
        </div>
        <div id="navbar">
            <ul class="nav navbar-nav navbar-left">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle"
                       data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><spring:message code="menu.pages.books"/><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><spring:message code="browse"/></a></li>
                        <li><a href="#"><spring:message code="store_hours"/></a></li>
                        <li><a href="#"><spring:message code="menu.pages.faq"/></a></li>

                    </ul></li>
                <form class="navbar-form">
                    <div class="form-group">
                        <input type="text" name="keyword" class="form-control" placeholder="Book title" />
                    </div>
                    <button type="submit" class="btn btn-default"><spring:message code="menu.button.search"/></button>
                </form>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><spring:message code="menu.pages.shopcart"/></a></li>
                <sec:authorize access="isAnonymous()">
                <li><a href="${pageContext.request.contextPath}/login"><spring:message code="menu.pages.myAccount"/></a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                <li><a href="${pageContext.request.contextPath}/myProfile"><spring:message code="menu.pages.myAccount"/></a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                <li><a href="${pageContext.request.contextPath}/logout"><spring:message code="menu.pages.logout"/></a></li>
                </sec:authorize>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
    <!--/.container-fluid -->
</nav>