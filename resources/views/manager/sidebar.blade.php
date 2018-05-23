<div class="fixed-sidebar-left">
    <ul class="nav navbar-nav side-nav nicescroll-bar">
        <li class="navigation-header">
            <span>Menu</span>
            <i class="zmdi zmdi-more"></i>
        </li>
        {{--<li class="{{ Request::is('/') ? 'active' : '' }}">--}}
            {{--<a class="" href="{{url('/')}}/manager/dashboard" data-toggle="collapse" data-target="#dashboard_dr">--}}
                {{--<div class="pull-left">--}}
                    {{--<i class="zmdi zmdi-chart-donut mr-20"></i>--}}
                    {{--<span class="right-nav-text">Dashboard</span></div>--}}
                {{--<div class="pull-right"></div>--}}
                {{--<div class="clearfix"></div>--}}
            {{--</a>--}}
        {{--</li>--}}
        <li class="{{ Request::is('/') ? 'active' : '' }}">
            <a class="" href="{{ url('/').'/manager/topics'}}" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left">
                    <i class="zmdi zmdi-landscape mr-20"></i>
                    <span class="right-nav-text">Quản lý chủ đề</span></div>
                <div class="pull-right"></div>
                <div class="clearfix"></div>
            </a>
        </li>


    </ul>
</div>