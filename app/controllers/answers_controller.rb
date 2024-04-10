class AnswersController < ApplicationController
  def show
    question = params['q']
    id, formatted_question = question.split(':').map(&:trim)
    render json: 3
  end
end