require('./bootstrap.js');

import {QUESTION_RADIO, QUESTION_CHECKBOX, QUESTION_TEXT, SURVEYOR_DONE} from './survey.constants';
import {convertViToEn} from './survey.helper';

new Vue({
    el: '#survey',
    data: {
        QUESTION_RADIO: QUESTION_RADIO,
        QUESTION_TEXT: QUESTION_TEXT,
        QUESTION_CHECKBOX: QUESTION_CHECKBOX,
        topic: JSON.parse(app.topic),
        surveyor: JSON.parse(app.surveyor),
        manager: {
            name: '',
            invalid: false
        },
        surveyActivated: false,
        surveyDone: false,
        page: 1,
        categories: [],
        pageInfo: {},
        results: [],
        errors: [],
        disableSubmit: false,
        procesing: false,
        loading: false
    },
    mounted(){
        if (this.surveyor.status == SURVEYOR_DONE) {
            this.surveyActivated = true;
            this.disableSubmit = true;

            var $this = this;
            $this.loading = true;
            axios.post(app.baseURL + '/results-data', {
                surveyorId: app.surveyorId
            })
                .then(function (response) {
                    var res = [];
                    _.each(response.data.data, function (o) {
                        res.push({
                            question: o.question_id,
                            answer: o.answer
                        });
                    });

                    $this.results = res;

                    $this.start();
                });
        }
    },
    methods: {
        start(){
            var $this = this;
            if (!this.surveyActivated) {

                //Check topic manager name
                $this.topic.manager = convertViToEn($this.topic.manager.toLowerCase());

                var typedManagerNameArray = $this.manager.name.split(/[\s]+/);
                var realManagerNameArray = $this.topic.manager.split(/[\s]+/);
                var realManagerName = realManagerNameArray[realManagerNameArray.length - 1];

                if (convertViToEn($this.manager.name.toLowerCase()).indexOf(realManagerName) < 0) {
                    $this.manager.invalid = true;
                    return;
                }

                for (var i = 0; i < typedManagerNameArray.length; i++) {
                    var str = typedManagerNameArray[i];
                    if ($this.topic.manager.indexOf(convertViToEn(str.toLowerCase())) < 0) {
                        $this.manager.invalid = true;
                        return;
                    }
                }
            }


            $this.manager.invalid = false;

            if ($this.processing) {
                return;
            }

            $this.loading = true;
            $this.processing = true;
            axios.post(app.baseURL + '/survey-data', {
                page: $this.page,
                surveyorId: app.surveyorId
            })
                .then(function (response) {
                    $this.surveyActivated = true;

                    if (_.isEmpty(response.data.data)) {

                        if (!$this.disableSubmit) {
                            axios.post(app.baseURL + '/save', {
                                surveyorId: app.surveyorId,
                                results: $this.results
                            })
                                .then(function (response) {
                                    $this.surveyDone = true;
                                })
                                .catch(function (e) {

                                });
                        } else {
                            $this.surveyDone = true;
                        }

                    } else {
                        $this.categories = response.data.data;
                        $this.pageInfo = response.data.page;
                    }

                    $this.loading = false;
                    $this.processing = false;
                })
                .catch(function (e) {
                    $this.processing = false;
                    $this.loading = false;
                    console.error(e);
                })
        },
        questions(array, type){
            return _.filter(array, function (o) {
                return parseInt(o.type) == type;
            });
        },
        next(){
            if (this.validate()) {
                this.page++;
                this.start();
            }
        },
        back(){
            if (this.page > 1) {
                this.page--;
                this.start();
            }
        },
        result(question, answer, cat, type){
            var $this = this;

            var q = _.find($this.results, function (o) {
                return o.question == question.id;
            });

            var a = answer.id ? answer.id : answer.target.value;

            var value = [];
            if (type == 'checkbox') {
                $(':checkbox:checked').each(function (i) {
                    value[i] = $(this).val();
                });
            }
            if (_.isEmpty(q)) {
                $this.results.push({
                    question: question.id,
                    answer: type == 'checkbox' ? value.join(',') : a
                });
            } else {
                q.answer = type == 'checkbox' ? value.join(',') : a
            }


            $this.validate();


        },
        validate(){
            var $this = this;
            $this.categories = _.map($this.categories, function (c) {
                c.error = false;
                return c;
            });

            for (var i = 0; i < $this.categories.length; i++) {
                var questions = $this.categories[i].questions;

                for (var k = 0; k < questions.length; k++) {
                    if (parseInt(questions[k].required) > 0) {
                        var q = _.find($this.results, function (o) {
                            return parseInt(o.question) == parseInt(questions[k].id);
                        });

                        if (_.isEmpty(q)) {
                            $this.categories[i].error = true;
                        }
                    }
                }
            }

            var errorCat = _.find($this.categories, function (c) {
                return c.error == true;
            });

            return errorCat ? false : true;
        },
        checked(q, a, type){
            var $this = this;
            var item = [];

            if (type == 'checkbox') {
                item = _.find($this.results, function (o) {
                    var answers = [o.answer];

                    if ((o.answer + '').indexOf(',')) {
                        answers = (o.answer + '').split(',');
                    }

                    return o.question == q.id && _.includes(answers, '' + a.id);
                });
            } else {
                item = _.find($this.results, function (o) {
                    return o.question == q.id && o.answer == a.id;
                });
                if (!_.isEmpty(item)) {
                    setTimeout(function () {
                        console.log(q.id + ' ' + a.id);
                        $('input[name="rad-' + q.id + '"][answer="anw-rad-' + a.id + '"]').prop('checked', true);
                    }, 300);
                }
            }

            return !_.isEmpty(item);
        },
        text(q){
            var $this = this;

            var item = _.find($this.results, function (o) {
                return o.question == q.id;
            });
            return item ? item.answer : '';
        }
    }
})
