@extends('manager.template')

@section('styles')
@endsection

@section('content')
    <div class="container-fluid" id="import">
        <div class="loader" v-show="loading">
            <img src="{{url('/')}}/images/loader.gif">
        </div>

        <div class="import-file" v-show="!loading">
            <input type="file" id="file" @change="upload($event)" ref="file">
        </div>


        <a href="{{url('/')}}/storage/upload/7286897090.xls" style="display: inline-block;margin-top: 30px;">Tải file import mẫu</a>
    </div>
@endsection

@section('scripts')
    <script type="application/javascript" src="{{url('/')}}/js/import.js"></script>
@endsection