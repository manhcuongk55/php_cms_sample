@extends('manager.template')

@section('styles')
    <link href="{{url('/')}}/vendors/datatables/datatables/media/css/jquery.dataTables.css" rel="stylesheet"
          type="text/css">
@endsection
@section('content')
    <div class="container-fluid">
        <!-- Row -->
        <div class="row">
            @include('manager.topics.partitals.table')
        </div>
    </div>
@endsection

@section('scripts')
    <script type="application/javascript" src="{{asset('pages/statistics.js')}}"></script>
@endsection