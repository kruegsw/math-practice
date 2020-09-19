def greeting()
  puts
  print "Hello.  What is your name? "
  name = gets.chomp
  puts
  print "Hi #{name}!  How many math problem would you like to do? "
  number_of_problems = gets.chomp.to_i
  puts
  return number_of_problems
end

def generate_problem(a, b)
  
  if a > b
    prompt = "#{a} - #{b} = "
    answer = a - b
  else
    prompt = "#{a} + #{b} = "
    answer = a + b
  end

  return prompt
  
end

def determine_answer(a, b)
  
  if a > b
    answer = a - b
  else
    answer = a + b
  end

  return answer
  end

def prompt_for_answer(prompt)

  print prompt
  guess = gets.chomp

  return guess
end

def evaluate_guess(guess, answer)
  if guess.to_i == answer
    evaluation = "CORRECT!"
  else
    evaluation = "WRONG, the correct answer is: #{answer}"
  end

  return evaluation
end

def do_math(number_of_problems)
  record = []
  number_correct = 0
  for i in 1..number_of_problems do 

    a = rand(1..10).to_i
    b = rand(1..10).to_i

    prompt = generate_problem(a, b)
    answer = determine_answer(a, b)
    guess = prompt_for_answer(prompt)
    evaluation = evaluate_guess(guess, answer)
    if guess.to_i == answer
      number_correct += 1
    end
    record.push([i, prompt, guess, evaluation, answer, number_correct])
    puts " ... #{evaluation}"
  end
  return record
end

def review_score(record)
  #record.each { |i| puts "#{i[0]}: #{i[1]}#{i[2]} ... #{i[3]}"}
  puts
  puts "You scored #{record[-1][-1]} / #{record[-1][0]}!"
  puts
end

def app()  
  number_of_problems = greeting()
  if number_of_problems > 0
    record = do_math(number_of_problems)
    review_score(record)
    puts
  else
    puts "... FINE have it your way.  Bye bye."
  end
end

app()