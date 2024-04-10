class AnswersController < ApplicationController
  def show
    question = params['q']
    id, formatted_question, params = question.split(':').map(&:strip)
    answer = answer_question(formatted_question, params)
    render json: answer
  end

  private

  def answer_question(question, arguments = nil)
    check_addition = question.match /what is (\d+) plus (\d+)/
    return answer_addition(check_addition) if check_addition
    check_largest = question.match /which of the following numbers is the largest/
    return answer_largest(arguments) if check_largest
  end

  def answer_addition(match)
    match[1].to_i + match[2].to_i
  end

  def answer_largest(string_arguments)
    array = string_arguments.split(', ').map(&:to_i)
    array.max
  end
end