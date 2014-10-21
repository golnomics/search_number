def get_total low_number, high_number
  range_count = high_number - low_number + 1
  if range_count.even?
	  range_count_half = range_count / 2
	  ( low_number + high_number ) * range_count_half
  else
	  false
  end
end

def get_file_line file
  open(file) {|f|
    while line = f.gets
      @numbers_csv = line
    end
  }
  @numbers_csv
end

numbers_csv = get_file_line "numbers.csv"

total = get_total 1, 10000

eval_parameter = numbers_csv.gsub(',', '+')

numbers_total = eval eval_parameter

answer_number = total - numbers_total

p "answer: " << answer_number.to_s

