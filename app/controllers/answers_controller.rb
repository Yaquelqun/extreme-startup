class AnswersController < ApplicationController
  def show
    question = params['q']
    id, formatted_question = question.split(':').map(&:strip)
    answer = answer_question(formatted_question)
    render json: answer
  end

  private

  def answer_question(question)
     check_addition = question.match /what is (\d+) plus (\d+)/
     return answer_addition(check_addition) if check_addition
  end

  def answer_addition(match)
    match[1].to_i + match[2].to_i
  end
end