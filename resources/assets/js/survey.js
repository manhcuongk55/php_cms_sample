require('./bootstrap.js');

import {QUESTION_RADIO, QUESTION_TEXT, SURVEYOR_DONE} from './survey.constants';

new Vue({
	el: '#survey',
	data: {
		QUESTION_RADIO: QUESTION_RADIO,
		QUESTION_TEXT: QUESTION_TEXT,
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
		results: [],
		errors: [],
		disableSubmit: false
	},
	mounted(){
		if(this.surveyor.status==SURVEYOR_DONE){
			this.surveyActivated = true;
			this.disableSubmit = true;

			var $this = this;
			axios.post(app.baseURL + '/results-data', {
				surveyorId: app.surveyorId
			})
			.then(function(response){
				var res = [];
				_.each(response.data.data, function(o){
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
			if(!this.surveyActivated){
				if($this.manager.name.toLowerCase() != $this.topic.manager.toLowerCase()){
					$this.manager.invalid = true;

					return;
				}
			}

			$this.manager.invalid = false;
			axios.post(app.baseURL + '/survey-data', {
				page: $this.page,
				surveyorId: app.surveyorId
			})
			.then(function(response){
				$this.surveyActivated = true;

				if(_.isEmpty(response.data.data)){

					if(!disableSubmit){
						axios.post(app.baseURL + '/save', {
							surveyorId: app.surveyorId,
							results: $this.results
						})
						.then(function(response){
							$this.surveyDone = true;
						})
						.catch(function(e){

						});		
					} else {
						$this.surveyDone = true;
					}
					
				} else {
					$this.categories = response.data.data;
				}
			})
			.catch(function(e){
				console.error(e);
			})
		},
		questions(array, type){
			return _.filter(array, function(o){
				return parseInt(o.type) == type;
			});
		},
		next(){
			console.log('next');
			console.log(this.validate());
			if(this.validate()){
				this.page++;
				this.start();
			}
		},
		back(){
			if(this.page>1){
				this.page--;
				this.start();
			}	
		},
		result(question, answer, cat){
			var $this = this;

			var q = _.find($this.results, function(o){
				return o.question == question.id;
			});

			var a = answer.id ? answer.id : answer.target.value;

			if(_.isEmpty(q)){
				$this.results.push({
					question: question.id,
					answer: a
				});
			} else {
				q.answer = a;
			}

			
			$this.validate();


		},
		validate(){
			var $this = this;
			$this.categories = _.map($this.categories, function(c){
				c.error = false;
				return c;
			});

			for(var i=0; i<$this.categories.length; i++){
				var questions = $this.categories[i].questions;

				for(var k=0; k<questions.length; k++){
					if(parseInt(questions[k].required)>0){
						var q = _.find($this.results, function(o){
							return parseInt(o.question) == parseInt(questions[k].id);
						});

						if(_.isEmpty(q)){
							$this.categories[i].error = true;
						}
					}
				}
			}

			var errorCat = _.find($this.categories, function(c){
				return c.error==true;
			});

			return errorCat ? false : true;
		},
		checked(q, a){
			var $this = this;

			var item = _.find($this.results, function(o){
				return o.question == q.id && o.answer == a.id;
			});

			return !_.isEmpty(item);
		},
		text(q){
			var $this = this;
			var item = _.find($this.results, function(o){
				return o.question == q.id;
			});

			return item ? item.answer : '';
		}
	}
})
