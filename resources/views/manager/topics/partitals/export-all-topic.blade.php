<!DOCTYPE html>
<html lang="{{ \Lang::getLocale() }}">
<head>
    <meta charset="utf-8">
</head>
<body>
<style>
    .header {
        text-align: center;
        font-weight: bold;
        font-size: 20;
    }

    .sub-header {
        text-align: center;
        font-style: italic;
    }

    .table-title {
        text-align: center;
        font-weight: bold;
        font-size: 13;
    }

    .table-subtitle {
        text-align: left;
        font-style: italic;
        font-size: 11;
    }

    .cell-data {
        border: 1 solid #000;
    }

    .row-odd {
        background: #ececec;
        border: 1 solid #000;
    }

    .row-even {
        background: #ffffff;
        border: 1 solid #000;
    }

    td {
        width: 20;
    }
</style>
<table>
    <tbody>
    <tr>
        <td colspan="6" class="header">THỐNG KÊ KHẢO SÁT CHỦ ĐỀ</td>
    </tr>
    <tr></tr>
    <tr>
        <td rowspan="2" class="cell-data table-title">Tên đề tài</td>
        <td rowspan="2" class="cell-data table-title">Chủ nhiệm</td>
        <td rowspan="2" class="cell-data table-title">Mã người khảo sát</td>
        @foreach($categories as $category)
            @for($i = 0 ; $i < count($category); $i++)
                <td class="cell-data table-title"
                    colspan="{{ count($category[$i]['questions']) }}">{{ $category[$i]['content']}}</td>
            @endfor
        @endforeach
    </tr>
    <tr>
        <td class="cell-data"></td>
        <td class="cell-data"></td>
        <td class="cell-data"></td>
        @foreach($categories as $category)
            @for($i = 0 ; $i < count($category); $i++)
                @foreach($category[$i]['questions'] as $question)
                    <td class="cell-data table-subtitle">{{ $question['content'] }}</td>
                @endforeach
            @endfor
        @endforeach
    </tr>
    <?php $index = 1; ?>
    @foreach($topics as $topic)
        @foreach($surveyors as $surveyor)
            @if($surveyor['topic_id'] == $topic['id'])
                <tr class="{{ $index % 2 == 0 ? 'row-even' : 'row-odd'}}">
                    <td class="cell-data">{{ $topic['code']  }}</td>
                    <td class="cell-data">{{ $topic['manager'] }}</td>
                    <td>{{$surveyor['id']}}</td>
                    <?php
                    $index++;
                    foreach ($categories as $category) {
                        for ($i = 0; $i < count($category); $i++) {
                            foreach ($category[$i]['questions'] as $question) {
                                $check = 1;
                                $str = '';
                                foreach ($surveyor['results'] as $result) {
                                    if ($question['id'] == $result['question_id']) {
                                        $str = $result['answer'];
                                        if ($question['type'] != '0') {
                                            if ($question['note'] == 'checkbox') {
                                                $arrAnswers = explode(',', $result['answer']);
                                            } else {
                                                $arrAnswers = [$result['answer']];
                                            }
                                            $str = '';
                                            foreach ($mapAnswers as $answer) {
                                                foreach ($arrAnswers as $item) {
                                                    if ($answer['id'] == $item) {
                                                        $str .= $answer['content'];
                                                        if (count($arrAnswers) > 1) {
                                                            $str .= ' ; ';
                                                        }
                                                        break;
                                                    }
                                                }
                                            }

                                        }
                                        $check = 0;
                                        break;
                                    }
                                }
                                echo $check == 1 ? '<td></td>' : "<td>$str</td>";
                            }
                        }
                    }
                    ?>
                </tr>
            @endif
        @endforeach
    @endforeach
    </tbody>
</table>

</body>
</html>
