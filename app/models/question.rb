class Question < ActiveRecord::Base
	validates :question, presence: true
	validates :op1, presence: true
	validates :op2, presence: true
	validates :op3, presence: true
	validates :op4, presence: true
	validates :correct, presence: true
	
end
