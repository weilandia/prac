class Proverb
  def initialize(*lines)
    @qualifier = find_qualifier(lines)
    @lines = lines
  end

  def to_s
    add_ending(build_lines.compact).join
  end

  def build_lines
    @lines.map.with_index do |noun, index|
      if index != @lines.length - 1
        "For want of a #{noun} the #{@lines[index + 1]} was lost.\n"
      end
    end
  end

  def add_ending(lines)
    lines << "And all for the want of a#{@qualifier} #{@lines.first}."
    lines
  end

  def find_qualifier(lines)
    " #{lines.pop[:qualifier]}" if lines[-1].class == Hash
  end
end


# For want of a nail the shoe was lost.
# For want of a shoe the horse was lost.
# For want of a horse the rider was lost.
# For want of a rider the message was lost.
# For want of a message the battle was lost.
# For want of a battle the kingdom was lost.
# And all for the want of a horseshoe nail.
