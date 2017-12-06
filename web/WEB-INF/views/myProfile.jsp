<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="pages/header.jsp" />
<div class="container">
    <div class="row" style="margin-bottom: -100px;">
        <div class="col-xs-8">
            <h2 class="section-headline">
                <h2 class="section-headline">
                    <span ${user.username}></span>
                </h2>
            </h2>
        </div>
        <div class="col-xs-4">
            <img src="${pageContext.request.contextPath}/static/image/logo.png" class="img-responsive" />
        </div>
    </div>
    <hr
            style="position: absolute; width: 100%; height: 6px; background-color: #333; z-index: -1; margin-top: -80px;" />
    <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/wood.png"
         style="margin-top: -75px;" />

    <div class="row" style="margin-top: 60px;">
        <div class="col-xs-9 col-xs-offset-3">

            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li><a href="#tab-1" data-toggle="tab"><span style="color: red;">Edit</span></a></li>
                <li><a href="#tab-2" data-toggle="tab"><span style="color: red;">Orders</span></a></li>
                <li><a href="#tab-3" data-toggle="tab"><span style="color: red;">Billing</span></a></li>
                <li><a href="#tab-4" data-toggle="tab"><span style="color: red;">Shipping</span></a></li>
            </ul>

            <!-- Tab panels -->
            <div class="tab-content">

                <!-- Edit user information -->
                <div class="tab-pane fade" id="tab-1">
                    <div class="panel-group">
                        <div class="panel panel-default" style="border: none;">
                            <div class="panel-body" style="background-color: #ededed; margin-top: 20px;">
                                <form:form action="${pageContext.request.contextPath}/updateUserInfo" method="post">
                                    <input type="hidden" name="id" ${user.id}>

                                    <div class="bg-info">User info updated.</div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-6">
                                                <label for="firstName">First Name</label>
                                                <input type="text" class="form-control" id="firstName" name="firstName" ${user.firstName}/>
                                            </div>
                                            <div class="col-xs-6">
                                                <label for="lastName">Last Name</label>
                                                <input type="text" class="form-control" id="lastName"  name="lastName" ${user.lastName}/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="userName">Username</label> '
                                        <input type="text" class="form-control" id="userName" name="username" ${user.username}/>
                                    </div>
                                    <div class="form-group">
                                        <label for="currentPassword">Current Password</label> '
                                        <input type="text" class="form-control" id="currentPassword"  name="currentPassword" ${currentPassword}/>
                                    </div>
                                    <p style="color:#828282">Enter your current password to change the email address or password.</p>

                                    <div class="form-group">
                                        <label for="email">* Email Address</label> '
                                        <input type="text" class="form-control" id="email"  name="email" ${user.email}/>
                                    </div>
                                    <p style="color:#828282">A valid email address. All
                                        emails from the system withll be sent to this address. The
                                        email address is not made public and will only be used if
                                        you wish to receive a new password or wish to receive
                                        certain notification.</p>

                                    <div class="form-group">
                                        <label for="txtNewPassword">Password</label> '
                                        <input type="password" class="form-control" id="txtNewPassword" name="newPassword" />
                                    </div>

                                    <div class="form-group">
                                        <label for="txtConfirmPassword">Confirm Password</label> '
                                        <input type="password" class="form-control" id="txtConfirmPassword"/>
                                    </div>
                                    <p style="color:#828282">To change the current user password, enter the new password in both fields.</p>

                                    <button type="submit" class="btn btn-primary">Create new account</button>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end of container -->
<jsp:include page="pages/header_js.jsp"/>
