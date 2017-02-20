require 'benchmark'

class String
public
def valid?
iterations = 1
	Benchmark.bm do |bm|
		bm.report do
			iterations.times do
				letters = self.scan(/\S/) # string to array of chars
				input_set = Hash.new
				compare_param = 0
				compare_set = {           #hash for compare(as nominal) with input values
					'[' => ']',             #relationship brackets
					'{' => '}',
					'(' => ')',
					'<' => '>'
				}
				left_part = letters[0...letters.size / 2]                        # two arrays, 1:left path of...
				right_part = letters[letters.size / 2..letters.size].reverse!    #input string, 2:rigth part
				(0...left_part.size).each do |i|
					(0...right_part.size).each do |j|                              #insert left & right part in hash...
						break if j > i                                               # as keys & values
						input_set[left_part[i]] = right_part[j]
					end
				end
				input_set.each_pair do |a, b|                                   #compare nominal hash with input hash
					compare_set.each_pair do |n, m|
						compare_param += 1 if (a == n) && (b == m)
					end
				end
				if compare_param != input_set.size
					puts 'false'
				else puts 'true'
				end
			end
		end
	end
end
end
arr = '(<[{}]>)'
arr.valid?