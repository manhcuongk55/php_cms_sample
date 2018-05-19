<!DOCTYPE html>
<!--[if IE 8]>
<html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <meta charset="utf-8"/>
    <title>News Cms | @yield('title', 'Page')</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <link href="{{ asset('/global/plugins/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('/global/plugins/simple-line-icons/simple-line-icons.min.css') }}" rel="stylesheet"
          type="text/css"/>
    <link href="{{ asset('/global/plugins/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css') }}" rel="stylesheet"
          type="text/css"/>
    <link href="{{ asset('/global/css/components.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('/global/css/plugins.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('/layouts/layout/css/layout.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('/layouts/layout/css/themes/darkblue.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('/layouts/layout/css/custom.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('/css/app.css') }}" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="{{ asset('favicon.jpg') }}"/>
    @yield('assets_head')
    <link href="{{ asset('/css/app.min.css') }}" rel="stylesheet" type="text/css"/>
</head>
<!-- END HEAD -->

<body class="page-header-fixed page-sidebar-closed-hide-logo">

<!-- BEGIN HEADER -->
@include('header')
<!-- END HEADER -->
<!-- BEGIN HEADER & CONTENT DIVIDER -->
<div class="clearfix"></div>
<!-- END HEADER & CONTENT DIVIDER -->
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
@include('sidebar')
<!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <!-- BEGIN CONTENT BODY -->
        <div class="page-content {{ $contentClass or '' }}">
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN PAGE BAR -->
        @yield('page-bar')
        <!-- END PAGE BAR -->
            <!-- END PAGE HEADER-->
            @yield('content')
        </div>
        <!-- END CONTENT BODY -->
    </div>
    <!-- END CONTENT -->
    <!-- BEGIN QUICK SIDEBAR -->

    <!-- END QUICK SIDEBAR -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <div class="page-footer-inner"> 2016 &copy; Cms Browser</div>
    <div class="scroll-to-top">
        <i class="icon-arrow-up"></i>
    </div>
</div>
<!-- END FOOTER -->
<!--[if lt IE 9]>
<script src="{{ asset('/global/plugins/respond.min.js') }}"></script>
<script src="{{ asset('/global/plugins/excanvas.min.js') }}"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script type="text/javascript"
        src="{{ asset('/apps/lang/' . Session::get('locale', config('app.fallback_locale')) . '.js') }}"></script>
<script type="text/javascript" src="{{ asset('/apps/config/public.js') }}"></script>
<script type="text/javascript" src="{{ asset('/global/plugins/jquery.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('/global/plugins/bootstrap/js/bootstrap.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('/global/plugins/js.cookie.min.js') }}"></script>
<script type="text/javascript"
        src="{{ asset('/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('/global/plugins/jquery.blockui.min.js') }}"></script>
<script type="text/javascript"
        src="{{ asset('/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('/global/scripts/app.js') }}"></script>
<script type="text/javascript" src="{{ asset('/layouts/layout/scripts/layout.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('/layouts/global/scripts/quick-sidebar.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('/global/scripts/app-common.js') }}"></script>
<!-- END THEME LAYOUT SCRIPTS -->
@yield('assets_footer')
<input type="hidden" id="site-meta"
       data-token="{!! csrf_token() !!}" data-time="{{ Session::get('timeType',config('app.fallback_time')) }}"
       data-base-url="{{ url('/') }}" data-language="{{ Session::get('locale', config('app.fallback_locale'))}}"
       data-user-id="{{ \Illuminate\Support\Facades\Auth::user()->id }}"
       data-host="{{ \App\Models\Constants::LOCAL == true ? "http://localhost" : (\App\Models\Constants::ENV == "dev" ? "http://10.240.152.151" : "http://10.240.152.116")  }}"
       data-host-upload="{{ \App\Models\Constants::ENV == "dev" ? "http://10.240.152.149:8090" : "http://news.sfive.vn"  }}"
       data-img-url="{{ \App\Models\Constants::ENV == "dev" ? "http://10.240.152.149/site_logos/" : "http://10.240.152.84/site_logos/" }}"
/>
</body>
</html>
