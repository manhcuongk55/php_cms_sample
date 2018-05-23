@extends('manager.template')

@section('styles')
    <link href="{{url('/')}}/vendors/datatables/datatables/media/css/jquery.dataTables.css" rel="stylesheet"
          type="text/css">
@endsection
@section('content')
    <div class="container-fluid">

        <!-- Title -->
        <div class="row heading-bg">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h5 class="txt-dark">Dashboard</h5>
            </div>
            <!-- Breadcrumb -->
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="index.html">Dashboard</a></li>
                </ol>
            </div>
            <!-- /Breadcrumb -->
        </div>
        <!-- /Title -->

        <!-- Row -->
        <div class="row">
            @include('manager.dashboard.partitals.charts')
        </div>
    </div>
@endsection

@section('scripts')
    <script type="application/javascript" src="{{asset('pages/dashboard.js')}}"></script>
@endsection