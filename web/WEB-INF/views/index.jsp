<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="pages/header.jsp" />

<div class="container">
    <div class="row">
        <!-- carousel -->
        <div class="col-xs-8">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div id="carousel-example-generic" class="carousel slide"
                         data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0"
                                class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img src="http://lorempixel.com/output/sports-q-c-1600-500-1.jpg"
                                        alt="..." />
                                <div class="carousel-caption">
                                    <h4>First Thumbnail Label</h4>
                                    <p>Contrary to popular belief, Lorem Ipsum is not simply
                                        random text. It has roots in a piece of classical Latin
                                        literature from 45 BC, making it over 2000 years old.</p>
                                </div>
                            </div>
                            <div class="item">
                                <img
                                        src="http://lorempixel.com/output/sports-q-c-1600-500-2.jpg"
                                        alt="..." />
                                <div class="carousel-caption">
                                    <h4>First Thumbnail Label</h4>
                                    <p>Contrary to popular belief, Lorem Ipsum is not simply
                                        random text. It has roots in a piece of classical Latin
                                        literature from 45 BC, making it over 2000 years old.</p>
                                </div>
                            </div>
                            <div class="item">
                                <img
                                        src="http://lorempixel.com/output/sports-q-c-1600-500-3.jpg"
                                        alt="..." />
                                <div class="carousel-caption">
                                    <h4>First Thumbnail Label</h4>
                                    <p>Contrary to popular belief, Lorem Ipsum is not simply
                                        random text. It has roots in a piece of classical Latin
                                        literature from 45 BC, making it over 2000 years old.</p>
                                </div>
                            </div>
                            ...
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic"
                           role="button" data-slide="prev"> <span
                                class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a> <a class="right carousel-control"
                                href="#carousel-example-generic" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right"
                                      aria-hidden="true"></span> <span class="sr-only">Next</span>
                    </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-4">
            <img src="${pageContext.request.contextPath}/static/image/logo.png" class="img-responsive"/>
        </div>
    </div>

    <hr />

    <div class="row">
        <div class="col-xs-4">
            <div clas="panel panel-default">
                <div class="panel-body">
                    <img src="${pageContext.request.contextPath}/static/image/bestseller.png" class="img-responsive"/>
                </div>
            </div>
        </div>
        <div class="col-xs-4">
            <div clas="panel panel-default">
                <div class="panel-body">
                    <img src="${pageContext.request.contextPath}/static/image/hours.png" class="img-responsive" />
                </div>
            </div>
        </div>
        <div class="col-xs-4">
            <div clas="panel panel-default">
                <div class="panel-body">
                    <img src="${pageContext.request.contextPath}/static/image/faq.png" class="img-responsive" />
                </div>
            </div>
        </div>
    </div>

    <div>
        <div class="home-headline">
            <span>Featured Books</span>
        </div>
        <hr style="margin-top: -15px;" />
    </div>


    <div class="row">
        <div id="featured-books" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#featured-books" data-slide-to="0" class="active"></li>
                <li data-target="#featured-books" data-slide-to="1"></li>
                <li data-target="#featured-books" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="${pageContext.request.contextPath}/static/image/shelf.png" class="img-responsive" />
                    <div class="carousel-caption">
                        <div class="row">
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/static/image/shelf.png" class="img-responsive" />
                    <div class="carousel-caption">
                        <div class="row">
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/static/image/shelf.png" class="img-responsive" />
                    <div class="carousel-caption">
                        <div class="row">
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                            <div class="col-xs-2">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/static/image/book1.png" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Controls -->
            <a class="left carousel-control" href="##featured-books"
               role="button" data-slide="prev"> <span
                    class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a> <a class="right carousel-control" href="##featured-books"
                    role="button" data-slide="next"> <span
                class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
        </div>
    </div>
</div>
<!-- end of container -->
<jsp:include page="pages/header_js.jsp"/>