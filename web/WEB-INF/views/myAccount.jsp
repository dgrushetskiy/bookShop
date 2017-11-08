<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="pages/header.jsp" />

<div class="container">
    <div class="row" style="margin-bottom: -100px;">
        <div class="col-xs-8">
            <h2 class="section-headline">
                <span>User Account</span>
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
                <li classappend="${classActiveNewAccount}? 'active'"><a href="#tab-1" data-toggle="tab"><span style="color:red;">Create new account</span></a></li>
                <li classappend="${classActiveLogin}? 'active'"><a href="#tab-2" data-toggle="tab"><span style="color:red;">Log in</span></a></li>
                <li classappend="${classActiveForgetPassword}? 'active'"><a href="#tab-3" data-toggle="tab"><span style="color:red;">Forget Password</span></a></li>
            </ul>

            <!-- Tab panels -->
            <div class="tab-content">

                <!-- create new user pane -->
                <div class="tab-pane fade" id="tab-1" classappend="${classActiveNewAccount}? 'in active'">
                    <div class="panel-group">
                        <div class="panel panel-default" style="border: none;">
                            <div class="panel-body"
                                 style="background-color: #ededed; margin-top: 20px;">
                                <div class="alert alert-info" if="${emailSent}">
                                    An email has been sent to the email address you just registered. Please validate your email address and update your password information.
                                </div>
                                <form action="@{/newUser}" method="post">
                                    <div class="form-group">
                                        <label for="newUsername">* Username: </label> &nbsp;<span
                                            style="color: red;" th:if="${usernameExists}">Username
												already exists. Choose a different one.</span> <input
                                            required="required" type="text" class="form-control"
                                            id="newUsername" name="username" />
                                        <p style="color: #828282">Enter your username here.</p>
                                    </div>

                                    <div class="form-group">
                                        <label for="email">* Email Address: </label><span
                                            style="color: red;" th:if="${emailExists}">Email
												already exists. Choose a different one.</span> <input
                                            required="required" type="text" class="form-control"
                                            id="email" name="email" />
                                        <p style="color: #828282">A valid email address. All
                                            emails from the system withll be sent to this address. The
                                            email address is not made public and will only be used if
                                            you wish to receive a new password or wish to receive
                                            certain notification.</p>
                                    </div>

                                    <button type="submit" class="btn btn-primary">Create new account</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- log in -->
                <div class="tab-pane fade" id="tab-2" th:classappend="${classActiveLogin}? 'in active'">
                    <div class="panel-group">
                        <div class="panel panel-default" style="border: none;">
                            <div class="panel-body"
                                 style="background-color: #ededed; margin-top: 20px;">
                                <div th:if="${param.error != null}" style="color:red;">Incorrect username or password.</div>
                                <form th:action="@{/login}" method="post">
                                    <div class="form-group">
                                        <label for="username">* Username: </label> <input
                                            required="required" type="text" class="form-control"
                                            id="username" name="username" />
                                        <p style="color: #828282">Enter your username here.</p>
                                    </div>

                                    <div class="form-group">
                                        <label for="password">* Password: </label> <input
                                            required="required" type="password" class="form-control"
                                            id="password" name="password" />
                                        <p style="color: #828282">Enter the password that
                                            accompanies your username</p>
                                    </div>

                                    <button type="submit" class="btn btn-primary">Log in</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- forget password -->
                <div class="tab-pane fade" id="tab-3" th:classappend="${classActiveForgetPassword}? 'in active'">
                    <div class="panel-group">
                        <div class="panel panel-default" style="border: none;">
                            <div class="panel-body"
                                 style="background-color: #ededed; margin-top: 20px;">
                                <div th:if="${emailNotExist}" class="alert alert-danger">Email doesn't exist.</div>
                                <div th:if="${forgetPasswordEmailSent}" class="alert alert-success">Email sent.</div>
                                <form th:action="@{/forgetPassword}" method="post">
                                    <div class="form-group">
                                        <label for="recoverEmail">* Your Email: </label> <input
                                            required="required" type="text" class="form-control"
                                            id="recoverEmail" name="email" />
                                        <p style="color: #828282">Enter your registered email address here.</p>
                                    </div>

                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </form>
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
