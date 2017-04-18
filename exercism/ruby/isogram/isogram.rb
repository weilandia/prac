require 'pry'
class Isogram
  def self.is_isogram?(string)
    string.gsub(/[^a-zA-Z]/, "").split("").map(&:downcase).uniq.length == string.gsub(/[^a-zA-Z]/, "").length
  end
end
