class QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def edit
		@question = Question.find(params[:id])
	end
	def create
		
		#render plain: params[:question].inspect
		@question = Question.new(question_params)
		
		if @question.save
			redirect_to @question
		else
			render 'new'
		end
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to questions_path
	end

	def update
  		@question = Question.find(params[:id])
 
  		if @question.update(question_params)
    		redirect_to @question
  		else
    		render 'edit'
  		end
	end
	def show
		puts '-------------'
		puts params.inspect
		@question = Question.find(params[:id])
	end

	def index
		@questions = Question.all
	end

	

	def display_test
	end


	private
		def question_params
			params.require(:question).permit(:question,:op1,:op2,:op3,:op4,:correct)
		end


end
