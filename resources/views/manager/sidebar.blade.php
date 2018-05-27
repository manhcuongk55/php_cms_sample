<div class="fixed-sidebar-left">
    <ul class="nav navbar-nav side-nav nicescroll-bar">
        <li class="navigation-header">
            <span>Menu</span>
            <i class="zmdi zmdi-more"></i>
        </li>
        <li>
            <a class="{{$menu=='dashboard' ? 'active' : ''}}" href="{{url('/')}}/manager/dashboard">
                <div class="pull-left">
                    <i class="zmdi zmdi-book mr-20"></i>
                    <span class="right-nav-text">Import</span></div>
                <div class="pull-right"><i class="zmdi zmdi-caret-right"></i></div>
                <div class="clearfix"></div>
            </a>
        </li>
        <li>
            <a class="{{$menu=='topics' ? 'active' : ''}}" href="{{ url('/').'/manager/topics'}}" data-toggle="collapse" data-target="#dashboard_dr">
                <div class="pull-left">
                    <i class="zmdi zmdi-format-size mr-20"></i>
                    <span class="right-nav-text">Danh mục đề tài</span></div>
                <div class="pull-right"><i class="zmdi zmdi-caret-right"></i></div>
                <div class="clearfix"></div>
            </a>
        </li>


    </ul>
</div>