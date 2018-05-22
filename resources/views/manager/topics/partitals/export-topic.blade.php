<!DOCTYPE html>
<html lang="{{ \Lang::getLocale() }}">
<head>
    <meta charset="utf-8">
</head>
<body>
<table>
    <tbody>
    {{--<td>{{ json_encode($categories) }}</td>--}}
    @foreach($categories as $category)
        @for($i = 0 ; $i < count($category); $i++)
            <tr>
                <td>{{ ($i+1) }}</td>
                <td colspan="20">{{$category[$i]['content']}}</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                @foreach($category[$i]['questions'] as $question)
                    <td>{{ $question['content'] }}</td>
                @endforeach
            </tr>
            <tr></tr>
        @endfor
    @endforeach
    </tbody>
</table>

</body>
</html>
