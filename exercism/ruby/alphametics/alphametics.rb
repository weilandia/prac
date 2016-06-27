class Alphametics
  def solve(equation)
    parse(equation)
    @equation = equation
    @chars = build_set(equation.dup)

    build_hash(brute_force_solution.map(&:to_i))
  end

  def brute_force_solution
    [*'0'..'9'].permutation(@chars.length).find { |number_arr|
      translation = build_hash(number_arr)

      new_equation = @equation.chars.map do |char|
        translation[char] ? translation[char] : char
      end.join.split(' ')

      true_equation?(new_equation) == true
    }
  end

  def true_equation?(equation)
    initial_value, *chain = equation
    chain.each_slice(2).reduce(initial_value.to_i) do |result, (operator, arg)|
      result.send(operator, arg.to_i)
    end
  end

  def translate_equation(string_equation)
    string_equation.split(' ').map.with_index { |char, i|
      i.even? ? char.to_i : char
    }
  end

  def parse(equation)
    equation.gsub!('^', '**')
  end

  def build_set(equation)
    equation.gsub!(/[^A-Z]/, '')
    Set.new(equation.split(''))
  end

  def build_hash(number_arr)
    Hash[@chars.zip(number_arr)]
  end
end
