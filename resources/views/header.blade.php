<div class="page-header navbar navbar-fixed-top">
    <!-- BEGIN HEADER INNER -->
    <div class="page-header-inner ">
        <!-- BEGIN LOGO -->
        <div class="page-logo">
            <a href="{{ url('/') }}">
                <img src="{{ asset('/layouts/layout/img/logo.png') }}" alt="logo" class="logo-default"
                     style="margin-top: 18px;"/> </a>
            <div class="menu-toggler sidebar-toggler">
                <span></span>
            </div>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse"
           data-target=".navbar-collapse">
            <span></span>
        </a>
        <!-- END RESPONSIVE MENU TOGGLER -->
        <!-- BEGIN TOP NAVIGATION MENU -->
        <div class="top-menu">
            <ul class="nav navbar-nav pull-right">

                <!-- BEGIN USER LOGIN DROPDOWN -->
                <li class="dropdown dropdown-user">
                    <?php
                    $lang = trans('general.UTCTime');
                    $time = Session::get('timeType', config('app.fallback_time'));
                    switch ($time) {
                        case 'utc':
                            $lang = trans('general.UTCTime');
                            break;
                        case 'friendly':
                            $lang = trans('general.friendlyTime');
                            break;

                    }
                    ?>
                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                       data-close-others="true">
                        <i class="fa fa-clock-o"></i>
                        <span class="username username-hide-on-mobile"> {{ $lang }} </span>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-default">
                        <li class="time-option" data-time="utc">
                            <a href="javascript:;"><i class="fa fa-clock-o"></i> {{trans('general.UTCTime')}} </a>
                        </li>
                        <li class="time-option" data-time="friendly">
                            <a href="javascript:;"><i class="fa fa-clock-o"></i> {{trans('general.friendlyTime')}} </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown dropdown-language">
                    <?php
                    $flag = 'vn.png';
                    $lang_name = 'Việt Nam';
                    $locale = Session::get('locale', config('app.fallback_locale'));
                    switch ($locale) {
                        case 'vi':
                            $flag = 'vn.png';
                            $lang_name = 'Việt Nam';
                            break;
                        case 'en':
                            $flag = 'england.png';
                            $lang_name = 'English';
                            break;

                    }
                    ?>
                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                       data-close-others="true">
                        <img alt="" class="lang-img" src="{{ asset('/global/img/flags/' . $flag) }}"/>
                        <span class="langname"> {{ $lang_name }} </span>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-default">
                        <li>
                            <a class="lang-option" data-lang-name="Tiếng Việt" data-locale="vi" href="javascript:;">
                                <img src="{{ asset('/global/img/flags/vn.png') }}"> Tiếng Việt
                            </a>
                        </li>
                        <li>
                            <a class="lang-option" data-lang-name="English" data-locale="en" href="javascript:;">
                                <img src="{{ asset('/global/img/flags/england.png') }}"> English
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown dropdown-user">
                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                       data-close-others="true">
                        <img alt="" class="img-circle" src="{{ asset('/layouts/layout/img/avatar3_small.jpg') }}"/>
                        <span class="username username-hide-on-mobile"> {{ Auth::user()->username }} </span>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-default">
                        <li>
                            <a href="{{ url('/changePassword') }}"><i
                                        class="icon-key"></i> {{trans('changePassword.title')}} </a>
                        </li>
                        <li>
                            <a href="{{ url('/logout') }}"><i class="icon-logout"></i> {{trans('general.logout')}} </a>
                        </li>
                    </ul>
                </li>
                <!-- END USER LOGIN DROPDOWN -->
                <!-- BEGIN QUICK SIDEBAR TOGGLER -->
                <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                <!--                <li class="dropdown dropdown-quick-sidebar-toggler">
                                    <a href="javascript:;" class="dropdown-toggle">
                                        <i class="icon-logout"></i>
                                    </a>
                                </li>-->
                <!-- END QUICK SIDEBAR TOGGLER -->
            </ul>
        </div>
        <!-- END TOP NAVIGATION MENU -->
    </div>
    <!-- END HEADER INNER -->
</div>
