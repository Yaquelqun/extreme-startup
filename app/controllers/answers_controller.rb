class AnswersController < ApplicationController
  ACTOR_DICT = {
    "James Bond" => {
      "Dr No" => "Sean Connery"
    }
  }

  CITY_DICT = {
    "Eiffel tower" => "Paris"
  }

  def show
    question = params['q']
    id, formatted_question, params = question.split(':').map(&:strip)
    answer = answer_question(formatted_question, params)
    puts answer.inspect
    render json: answer
  end

  private

  def answer_question(question, arguments = nil)
    check_computation = question.match /what is \d+/
    return answer_computation(question[8..]) if check_computation

    check_fibonacci = question.match /what is the (\d+).+ in the Fibonacci sequence/
    return answer_fibonacci(check_fibonacci) if check_fibonacci

    check_largest = question.match /which of the following numbers is the largest/
    return answer_largest(arguments) if check_largest

    check_square_cube = question.match /which of the following numbers is both a square and a cube/
    return answer_square_cube(arguments) if check_square_cube

    check_prime_number = question.match /which of the following numbers are prime/
    return answer_prime_number(arguments) if check_prime_number

    check_actor = question.match /who played (.+) in the film (.+)/
    return answer_actor(check_actor) if check_actor

    check_city = question.match /which city is the (.+) in/
    return answer_city(check_city) if check_city
  end

  def answer_computation(computation)
    eval(computation.gsub("plus", "+").gsub("minus", '-').gsub('multiplied by', '*').gsub('to the power of', '**'))
  end

  def answer_fibonacci(string_argument)
    number = string_argument[1].to_i
    result = [1, 1]
    i = 0
    until result.length >= number
      result << result[i] + result[i+1]
      i +=1
    end
    result[number-1]
  end

  def answer_largest(string_arguments)
    array = string_arguments.split(', ').map(&:to_i)
    array.max
  end

  def answer_square_cube(string_arguments)
    array = string_arguments.split(', ').map(&:to_i)

    array.detect { Math.cbrt(_1) % 1 == 0.0 && Math.sqrt(_1) % 1 == 0.0 }
  end

  def answer_prime_number(string_arguments)
    array = string_arguments.split(', ').map(&:to_i)
    array.detect do |input|
      unacceptable_divisors = (2..(input-1))
      unacceptable_divisors.none? { |unacceptable_divisor| input % unacceptable_divisor == 0 }
    end
  end

  def answer_actor(match)
    ACTOR_DICT.dig(match[1], match[2])
  end

  def answer_city(match)
    CITY_DICT.dig(match[1])
  end
end