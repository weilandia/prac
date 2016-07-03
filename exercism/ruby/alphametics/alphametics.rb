module BookKeeping
  VERSION = 1
end

class Alphametics
  def solve(equation)
    parse(equation)
    @equation = equation
    @chars = build_set(equation.dup)
    build_char_hash(brute_force_solution.map(&:to_i))
  end

  def brute_force_solution
    [*'0'..'9'].permutation(@chars.length).find { |number_arr|
      equation = eval_permutation(number_arr)

      true_equation?(equation) == true
    }
  end

  def eval_permutation(arr)
    translation = build_char_hash(arr)

    @equation.chars.map do |char|
      translation[char] ? translation[char] : char
    end.join
  end

  def true_equation?(equation)
    no_leading_zeros?(equation) ? eval(equation) : false
  end

  def no_leading_zeros?(equation)
    equation.split(" ").each { |arg| return false if arg[0] == "0" }
  end

  def parse(equation)
    equation.gsub!('^', '**')
  end

  def build_set(equation)
    equation.gsub!(/[^A-Z]/, '')
    Set.new(equation.split(''))
  end

  def build_char_hash(number_arr)
    Hash[@chars.zip(number_arr)]
  end
end
