@extends('manager.template')

@section('styles')
@endsection

@section('content')
    <div class="container-fluid">
        <div class="import-file" id="import">
            <input type="file" id="file" @change="upload($event)" ref="file">
        </div>
    </div>
@endsection

@section('scripts')
    <script type="application/javascript" src="{{url('/')}}/js/import.js"></script>
@endsection