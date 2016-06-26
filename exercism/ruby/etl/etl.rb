class ETL
  def self.transform(legacy_data)
    legacy_data.reduce({}) do |new_db, (score, letters)|
      letters.map(&:downcase).each do |letter|
        new_db[letter] = score
      end
      new_db
    end
  end
end
