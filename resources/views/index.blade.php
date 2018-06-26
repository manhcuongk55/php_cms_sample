<!DOCTYPE html>
<html>
<head>
    <title> Khảo sát về hoạt động tài trợ, hỗ trợ của Quỹ phát triển KH&CN Quốc gia</title>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900italic,900'
          rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css"
          href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
    <link rel="stylesheet" type="text/css" href="{{url('/')}}/css/survey.css">
</head>
<body>
<div id="survey" class="survey" :class="{overview: !surveyActivated}" v-cloak>
    <h1>Khảo sát về hoạt động tài trợ, hỗ trợ của Quỹ Phát triển KH&CN Quốc gia</h1>
    <p class="desc">Đánh giá tác động của Đề tài do NAFOSTED tài trợ, hỗ trợ đối với cá nhân nhà khoa học</p>

    <div class="line" v-if="surveyActivated"></div>


    <div class="header-message" v-if="disableSubmit">Khảo sát đã được hoàn thành, xin mời xem lại kết quả.</div>


    <div v-if="!surveyActivated">
        <div class="frm">
            <div class="form-group text-lg">
                <label>Mã số đề tài</label> <span class="required-maker">*</span>
                <div class="input">
                    <input type="text" placeholder="Nhập mã số đề tài" readonly="" :value="topic.code">
                </div>
            </div>

            <div class="form-group text-lg">
                <label>Tên chủ nhiệm đề tài</label> <span class="required-maker">*</span>
                <div class="input">
                    <input type="text" placeholder="Nhập tên chủ nhiệm đề tài" v-model="manager.name" spellcheck="false"
                           @keyup="manager.invalid=false" @keyup.13="start">
                </div>
                <span class="error-message" v-if="manager.invalid">Tên chủ nhiệm đề tài không đúng</span>
            </div>

            <div class="form-group buttons-group">
                <a href="javascript:;" class="button right" @click="start">Tiếp tục</a>

                <div class="clear"></div>
            </div>
        </div>
    </div>

    <div v-else>
        <div class="loader" v-show="loading">
            <img src="{{url('/')}}/images/loader.gif">
        </div>

        <div v-if="!surveyDone" v-show="!loading">
            <h1 v-if="pageInfo">@{{ pageInfo.name+'.'+pageInfo.desc }}</h1>
            <div v-for="(cat, i) in categories" class="category">
                <h3>@{{i+1}}. @{{cat.content}}</h3>
                <p class="note" v-if="cat.note">@{{cat.note}}</p>

                <div class="questions">
                    <table v-if="questions(cat.questions, QUESTION_RADIO).length || questions(cat.questions, QUESTION_CHECKBOX).length">
                        <tr>
                            <td></td>
                            <td v-for="a in cat.answers">@{{a.content}}</td>
                        </tr>
                        <tr v-for="q in questions(cat.questions, QUESTION_CHECKBOX) ">
                            <td>@{{q.content}}</td>
                            <td v-for="a in cat.answers">
                                <div class="" v-if="disableSubmit"
                                     title="Bạn đã hoàn thành khảo sát">
                                    <input type="checkbox" disabled="" v-bind:checked="checked(q,a,'checkbox') ? 'checked' : ''"
                                           name="checkbox-question[]"
                                           @click="result(q, a, cat,'checkbox')" :value="a.id">

                                </div>
                                <div class="" v-else>
                                    <input type="checkbox" name="checkbox-question[]"
                                           @click="result(q, a, cat,'checkbox')" :value="a.id">

                                </div>
                            </td>
                        </tr>
                        <tr v-for="q in questions(cat.questions, QUESTION_RADIO) ">
                            <td>@{{q.content}}</td>
                            <td v-for="a in cat.answers">
                                <div class="pretty p-default p-round p-fill" v-if="disableSubmit"
                                     title="Bạn đã hoàn thành khảo sát">
                                    <input type="radio" :checked="checked(q, a)" disabled="" :name="'rad-' + q.id"
                                           @click="result(q, a, cat)">
                                    <div class="state">
                                        <label></label>
                                    </div>
                                </div>
                                <div class="pretty p-default p-round p-fill" v-else>
                                    <input type="radio" :checked="checked(q, a)" :name="'rad-' + q.id"
                                           @click="result(q, a, cat)">
                                    <div class="state">
                                        <label></label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>

                    <div class="form-group" v-for="q in questions(cat.questions, QUESTION_TEXT)">
                        <label>@{{q.content}}</label>

                        <div class="input">
                            <input :type="q.note =='number' ? 'number' : 'text'" spellcheck="false"
                                   placeholder="Nhập câu trả lời" :disabled="disableSubmit" :value="text(q)"
                                   @change="result(q, $event)">
                        </div>
                    </div>
                </div>

                <div class="error-message" v-show="cat.error">Vui lòng đánh giá hết các mục</div>
            </div>

            <div class="form-group buttons-group">
                <a href="javascript:;" class="button" @click="back" v-if="page>1" v-show="!processing">Quay lại</a>
                <a href="javascript:;" class="button right" @click="next">Tiếp tục</a>

                <div class="clear"></div>
            </div>
        </div>

        <div v-else>
            <p class="success-message">Cảm ơn bạn đã hoàn thành khảo sát.</p>
        </div>
    </div>
</div>

<script type="text/javascript">
    window.app = {
        topic: '{!!$topic!!}',
        surveyor: '{!!$surveyor!!}',
        surveyorId: '{{$surveyorId}}',
        baseURL: "{{url('/')}}"
    };
</script>
<script type="text/javascript" src="{{url('/')}}/js/survey.js"></script>
</body>
</html>