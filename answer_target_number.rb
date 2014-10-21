load 'binary_search.rb'

answer_number = BinarySearchArray.new('numbers.csv').answer_target_number

p "answer: " << answer_number.to_s
