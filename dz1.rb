class String
	public

	def valid?()
		letters = self.scan(/\S/)
		input_set = Hash.new
		compare_param = 0
		compare_set = {
				'[' => ']',
				'{' => '}',
				'(' => ')',
				'<' => '>'
		}

		if letters.size % 2 != 0
			puts 'false'
			exit
		end

		left_part = letters[0...letters.size / 2]
		right_part = letters[letters.size / 2 ..letters.size].reverse!

		(0...left_part.size).each do |i|
			(0...right_part.size).each do |j|
				break if j > i
				input_set[left_part[i]] = right_part[j]
			end
		end

			input_set.each_pair do |a, b|
				compare_set.each_pair do |n, m|
					if (a == n) && (b == m)
						#puts "#{a} == #{b}"
						compare_param += 1
					end
				end
			end
		if compare_param != input_set.size
			puts 'false'
		else puts 'true'
		end
	end
end
