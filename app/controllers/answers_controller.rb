class AnswersController < ApplicationController
  def show
    question = params['q']
    id, formatted_question, params = question.split(':').map(&:strip)
    answer = answer_question(formatted_question, params)
    puts answer.inspect
    render json: answer
  end

  private

  def answer_question(question, arguments = nil)
    check_addition = question.match /what is (\d+) plus (\d+)/
    return answer_addition(check_addition) if check_addition

    check_multiplication = question.match /what is (\d+) multiplied by (\d+)/
    return answer_multiplication(check_multiplication) if check_multiplication

    check_largest = question.match /which of the following numbers is the largest/
    return answer_largest(arguments) if check_largest

    check_square_cube = question.match /which of the following numbers is both a square and a cube/
    return answer_square_cube(arguments) if check_square_cube

    check_actor = question.match /who played (.+) in the film (.+)/
    return answer_actor(check_actor) if check_actor
  end

  def answer_addition(match)
    match[1].to_i + match[2].to_i
  end

  def answer_multiplication(match)
    match[1].to_i * match[2].to_i
  end

  def answer_largest(string_arguments)
    array = string_arguments.split(', ').map(&:to_i)
    array.max
  end

  def answer_square_cube(string_arguments)
    array = string_arguments.split(', ').map(&:to_i)

    array.detect { Math.cbrt(_1) % 1 == 0.0 && Math.sqrt(_1) % 1 == 0.0 }
  end

  def anser_actor(match)
    ACTOR_DICT.dig(match[1], match[2])
  end
end