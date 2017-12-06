<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="pages/header.jsp" />

<div class="container">
    <div class="row" style="margin-bottom: -100px;">
        <div class="col-xs-8">
            <h2 class="section-headline">
                <span><spring:message code="myaccount"/></span>
            </h2>
        </div>
        <div class="col-xs-4">
            <img src="${pageContext.request.contextPath}/static/image/logo.png" class="img-responsive" />
        </div>
    </div>
    <hr style="position:absolute; width:100%; height:6px; background-color: #333; z-index:-1; margin-top:-80px;" />
    <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/wood.png" style="margin-top: -75px;"/>

    <div class="row" style="margin-top: 60px;">
        <div class="col-xs-9 col-xs-offset-3">

            <!-- Nav tabs -->
            <ul class="nav nav-tabs">

                <li><a href="#tab-1" data-toggle="tab"><span style="color:red;"><spring:message code="myaccount_create"/></span></a></li>


                <li><a href="#tab-2" data-toggle="tab"><span style="color:red;"><spring:message code="my_account_login"/></span></a></li>


                <li><a href="#tab-3" data-toggle="tab"><span style="color:red;"><spring:message code="myaccount_forget_password"/></span></a></li>

            </ul>

            <!-- Tab panels -->
            <div class="tab-content">

                <!-- create new user pane -->

                <div class="tab-pane fade" id="tab-1">
                    <div class="panel-group">
                        <div class="panel panel-default" style="border: none;">
                            <div class="panel-body" style="background-color: #ededed; margin-top: 20px;">

                                <div class="alert alert-info">
                                    <spring:message code="myaccount_email_sent"/>
                                </div>

                                <form:form action="${pageContext.request.contextPath}/newUser" method="post">

                                    <div class="form-group">
                                        <label for="newUsername"><spring:message code="myaccount_username"/></label> &nbsp;<span
                                            style="color: red;"><spring:message code="myaccount_username_already_exists"/></span>
                                        <input required="required" type="text" class="form-control" id="newUsername" name="username" />
                                        <p style="color: #828282"><spring:message code="myaccount_username_enter"/></p>
                                    </div>


                                    <div class="form-group">
                                        <label for="email"><spring:message code="myaccount_email"/></label><span
                                            style="color: red;"><spring:message code="myaccount_email_already_exists"/></span>
                                        <input required="required" type="text" class="form-control" id="email" name="email" />
                                        <p style="color: #828282"><spring:message code="myaccount_valid_email_address"/></p>
                                    </div>

                                    <button type="submit" class="btn btn-primary"><spring:message code="myaccount_create"/></button>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- log in -->

                <div class="tab-pane fade" id="tab-2">
                    <div class="panel-group">
                        <div class="panel panel-default" style="border: none;">
                            <div class="panel-body" style="background-color: #ededed; margin-top: 20px;">
                                <c:if test="${param.error != null}">
                                <div style="color:red;"><spring:message code="myaccount_error_username_password"/></div>
                                </c:if>
                                <form:form action="${pageContext.request.contextPath}/login" method="post">
                                    <div class="form-group">
                                        <label for="username"><spring:message code="myaccount_username"/></label> <input
                                            required="required" type="text" class="form-control"
                                            id="username" name="username" />
                                        <p style="color: #828282"><spring:message code="myaccount_username_enter"/></p>
                                    </div>

                                    <div class="form-group">
                                        <label for="password"><spring:message code="myaccount_password"/></label> <input
                                            required="required" type="password" class="form-control"
                                            id="password" name="password" />
                                        <p style="color: #828282"><spring:message code="myaccount_enter_password"/></p>
                                    </div>

                                    <button type="submit" class="btn btn-primary"><spring:message code="my_account_login"/></button>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- forget password -->

                <div class="tab-pane fade" id="tab-3">
                    <div class="panel-group">
                        <div class="panel panel-default" style="border: none;">
                            <div class="panel-body" style="background-color: #ededed; margin-top: 20px;">

                                <div  class="alert alert-danger"><spring:message code="myaccount_email_exist"/></div>


                                <div class="alert alert-success"><spring:message code="myaccount_forget_password_email_sent"/></div>

                                <form:form action="${pageContext.request.contextPath}/forgetPassword" method="post">
                                    <div class="form-group">
                                        <label for="recoverEmail"><spring:message code="myaccount_forget_email"/></label>
                                        <input required="required" type="text" class="form-control" id="recoverEmail" name="email" />
                                        <p style="color: #828282"><spring:message code="myaccount_forget_email_register"/></p>
                                    </div>
                                    <button type="submit" class="btn btn-primary"><spring:message code="myaccount_submit"/></button>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- end Tab panels -->
        </div>
    </div>
</div>

<!-- end of container -->
<jsp:include page="pages/header_js.jsp"/>
