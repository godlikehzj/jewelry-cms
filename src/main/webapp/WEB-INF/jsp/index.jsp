<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>珠宝管理系统</title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/common.css" rel="stylesheet">

    <!-- NProgress -->
    <%--<link href="vendors/nprogress/nprogress.css" rel="stylesheet">--%>
    <!-- iCheck -->
    <%--<link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">--%>
    <!-- bootstrap-wysiwyg -->
    <%--<link href="vendors/google-code-prettify/prettify.min.css" rel="stylesheet">--%>
    <!-- Select2 -->
    <%--<link href="vendors/select2/select2.min.css" rel="stylesheet">--%>
    <!-- Switchery -->
    <%--<link href="vendors/switchery/switchery.min.css" rel="stylesheet">--%>
    <!-- starrr -->
    <%--<link href="vendors/starrr/starrr.css" rel="stylesheet">--%>
    <!-- bootstrap-daterangepicker -->
    <%--<link href="vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">--%>

    <!-- Custom Theme Style -->
    <link href="vendors/custom/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>珠宝管理系统</span></a>
                </div>

                <div class="clearfix"></div>

                <br />

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <!--<h3>General</h3>-->
                        <ul class="nav side-menu">
                            <li><a><i class="fa fa-home"></i> 首页管理 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="javascript:void(0)" onclick="home.banner.getList()">banner</a></li>
                                    <li><a href="javascript:void(0)" onclick="home.page.getList(0)">商品</a></li>
                                    <li><a href="javascript:void(0)" onclick="home.page.getList(1)">关于我们</a></li>
                                    <li><a href="javascript:void(0)" onclick="home.page.getList(2)">加入我们</a></li>
                                </ul>
                            </li>
                            <li><a href="javascript:void(0)" onclick="jtype.getDetails(0)"><i class="fa fa-bars"></i> 分类管理 </a>
                            </li>
                            <li><a href="javascript:void(0)" onclick="commodity.getList()"><i class="fa  fa-shopping-cart"></i> 商品管理 </a>
                            </li>
                            <li><a href="javascript:void(0)" onclick="about_us.detail()"><i class="fa fa-user"></i> 关于我们 </a>
                            </li>
                            <li><a href="javascript:void(0)" onclick="joinus.detail()"><i class="fa fa-users"></i> 加入我们 </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /sidebar menu -->
            </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <nav>
                    <div class="nav toggle">
                        <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                    </div>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="">
                            <a href="javascript:void(0);" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <img src="images/head.png" alt="">admin
                                <span class=" fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-usermenu pull-right">
                                <li><a href="#" onclick="user.logout()"><i class="fa fa-sign-out pull-right"></i>退出登录</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main" id="content">
            <div style="font-size:40px;padding-top: 200px;text-align: center;width: 100%">欢迎使用</div>
            <%--<h1><i>欢迎使用</i></h1>--%>
        </div>
        <footer>
            <div class="pull-right">
                yihu - Jewelry Admin System powerd by <a style="color: blue;" href="#" onclick="getContent('contact')">godlikehzj</a>
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /page content -->

        <!-- footer content -->

        <!-- /footer content -->
    </div>
</div>

<!-- jQuery -->
<script src="vendors/jquery/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="vendors/bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="vendors/fastclick/js/fastclick.js"></script>
<!-- NProgress -->
<%--<script src="vendors/nprogress/nprogress.js"></script>--%>
<!-- bootstrap-progressbar -->
<%--<script src="vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>--%>
<!-- iCheck -->
<%--<script src="vendors/iCheck/icheck.min.js"></script>--%>
<!-- bootstrap-daterangepicker -->
<%--<script src="vendors/moment/moment.min.js"></script>--%>
<%--<script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>--%>
<!-- bootstrap-wysiwyg -->
<%--<script src="vendors/bootstrap-wysiwyg/bootstrap-wysiwyg.min.js"></script>--%>
<%--<script src="vendors/jquery.hotkeys/jquery.hotkeys.js"></script>--%>
<%--<script src="vendors/google-code-prettify/prettify.js"></script>--%>
<!-- jQuery Tags Input -->
<%--<script src="vendors/jquery.tagsinput/jquery.tagsinput.js"></script>--%>
<!-- Switchery -->
<%--<script src="vendors/switchery/switchery.min.js"></script>--%>
<!-- Select2 -->
<%--<script src="vendors/select2/select2.full.min.js"></script>--%>
<!-- Parsley -->
<%--<script src="vendors/parsleyjs/parsley.min.js"></script>--%>
<!-- Autosize -->
<%--<script src="vendors/autosize/autosize.min.js"></script>--%>
<!-- jQuery autocomplete -->
<%--<script src="vendors/devbridge-autocomplete/jquery.autocomplete.min.js"></script>--%>
<!-- starrr -->
<%--<script src="vendors/starrr/starrr.js"></script>--%>

<!-- Custom Theme Scripts -->
<script src="vendors/custom/custom.min.js"></script>
<script src="js/common.js"></script>

</body>
</html>
