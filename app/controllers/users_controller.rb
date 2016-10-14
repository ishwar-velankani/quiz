class UsersController < ApplicationController
	skip_before_filter :verify_authenticity_token  

	def create_user
		@user = User.new
	end

	def save_user
		@user = ""
		if user_save_params.present?
			# User.create(user_save_params)
			@user = User.new
			@user.first_name = user_save_params[:first_name]
			@user.last_name = user_save_params[:last_name]
			@user.date_of_birth = user_save_params[:date_of_birth]
			@user.save
		end
		redirect_to users_take_test_path(:user_id => @user.id)
	end

	def take_test
		@questions = Question.all
		@question_count = @questions.count
		@users = User.all
		#puts 'params',params.inspect
		@user_id = params[:user_id]
	end

	def submit_test

		#puts 'params',params.inspect
		#Answer.create(user_save_params)
		#render plain: params[input_values].inspect
		
		@input_values=params[:input_values]

		@user_id = params[:user_id]
		#this is for destroying the table entries of the previous user
		Answer.where(user_id: @user_id).destroy_all

		@input_values.each  do |k,v|
			@answer = Answer.new
			@answer.user_id = @user_id
			@answer.question_id = k
			@answer.input_answer = v
			@answer.save
		end
		@questions = Question.all
		total_question= @questions.count
		count = 0
		@all_answer = Answer.where(:user_id => @user_id)
		@all_answer.each do |answer|
		end
		for i in 1..total_question
			@question = Question.find_by_id i
			@answer = @all_answer.find_by_question_id i
			if @question.correct == @answer.input_answer
				count = count + 1
			end
		end
		puts "total question"
		render :text =>"#{count} out of #{total_question}"
		


	end

	private
		def user_save_params
			params.require(:user).permit(:first_name,:last_name, :date_of_birth)
		end

		# def submit_test_params
		# 	params.permit(:first_name,:last_name, :date_of_birth)
		# end
		
end
