
public

def valids?
	letters = self.scan(/\S/)
	compare_set = {
		'[' => ']',
		'{' => '}',
		'(' => ')',
		'<' => '>'
	}
	if letters.size % 2 != 0
		puts "False"; exit
	end
	input_set = Hash.new
	arr1 = letters[0...letters.size / 2]
	arr2 = letters[letters.size / 2 ..letters.size].reverse!

	arr1.each do |q|
		arr2.each do |h|
			input_set[q] = h
		end
	end

	puts input_set
	print "Keys #{arr1}, values #{arr2}"
	puts
	arr1.each do |a|
		arr2.each do |b|
			compare_set.each_pair do |n, m|
				if (a == n) && (b == m)
					puts "#{a} == #{b}"
				end
			end
		end
	end
end

array = '(<[{}]>>'
array.valids?