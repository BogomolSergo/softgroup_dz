require 'benchmark'
class String
  def valid?
    iterations = 1
    input_set = {}
    compare_param = 0
    compare_set = { # Hash for compare(as nominal) with input values.
      '[' => ']', # Relationship brackets.
      '{' => '}',
      '(' => ')',
      '<' => '>'
    }
    Benchmark.bm do |bm|
      bm.report do
        iterations.times do
          line = scan(/\S/) # String to array of chars.
          l_part = line[0...line.size / 2] # Two arrays, 1:left path of
          r_part = line[line.size / 2..line.size].reverse! #   input string, 2: part.
          (0...l_part.size).each do |i|
            (0...r_part.size).each do |j| # Insert left & right part in hash
              break if j > i #   as keys & values.
              input_set[l_part[i]] = r_part[j]
            end
          end
          input_set.each_pair do |a, b| # Compare nominal hash with input hash.
            compare_set.each_pair do |n, m|
              compare_param += 1 if (a == n) && (b == m)
            end
          end
          puts compare_param == input_set.size ? 'true' : 'false'
        end
      end
    end
  end
end
arr = '(<[{}]>)'
arr.valid?
