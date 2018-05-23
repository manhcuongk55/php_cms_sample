<!DOCTYPE html>
<html lang="{{ \Lang::getLocale() }}">
<head>
    <meta charset="utf-8">
</head>
<body>
<table>
    <tbody>
    <tr>
        <td>Mã người khảo sát</td>
        @foreach($categories as $category)
            @for($i = 0 ; $i < count($category); $i++)
                <td colspan="{{ count($category[$i]['questions']) }}">{{($i +1).')'.$category[$i]['content']}}</td>
            @endfor
        @endforeach
    </tr>
    <tr>
        <td></td>
        @foreach($categories as $category)
            @for($i = 0 ; $i < count($category); $i++)
                @foreach($category[$i]['questions'] as $question)
                    <td>{{ $question['content'] }}</td>
                @endforeach
            @endfor
        @endforeach
    </tr>
    @foreach($surveyors as $surveyor)
        <tr>
            <td>{{$surveyor['id']}}</td>
            <?php
            foreach ($surveyor['results'] as $result) {
                $check = 1;
                foreach ($categories as $category) {
                    if ($check == 0) {
                        break;
                    }
                    for ($i = 0; $i < count($category); $i++) {
                        if ($check == 0) {
                            break;
                        }
                        foreach ($category[$i]['questions'] as $question) {
                            if ($question['id'] == $result['question_id']) {
                                echo '<td>' . ($question['type'] == '0'
                                        ? $result['answer'] : $mapAnswers[$result['answer']]['content']) . '</td>';
                                $check = 0;
                            }
                        }
                    }
                }
                if ($check == 1) {
                    echo '<td></td>';
                }
            }
            ?>
        </tr>
    @endforeach
    </tbody>
</table>

</body>
</html>
