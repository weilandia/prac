class Game
  VERSION = 1
  attr_reader :scores
  def initialize
    @frame = 1
    @scores = {}
  end

  def roll(new_score)
    validate_score(new_score)
    validate_roll
    (@scores[@frame] ||=[]) << new_score
    manage_frames
  end

  def validate_score(score)
    raise RuntimeError if score < 0 || score > 10
    if @scores[@frame]
      raise RuntimeError if @scores[@frame].first + score > 10
    end
  end

  def validate_roll
    raise RuntimeError if @frame == 12 && @scores[10].first != 10 || @frame == 11 && @scores[10].inject(:+) != 10 || @frame > 13
  end

  def manage_frames
    if @scores[@frame].first == 10
      @frame += 1
    elsif @scores[@frame].length == 2
      @frame += 1
    end
  end

  def score
    validate_game_is_over
    keep_score
    flatten_scores
    @score = @scores.values[0..9].inject(:+)
  end

  def validate_game_is_over
    raise RuntimeError if @scores[10].nil? ||  @scores[10].first == 10 && @scores[11].nil? || @scores[10].first == 10 && @scores[11].first == 10 && @scores[12].nil? || @scores[10].length < 2 && @scores[10].first != 10
  end

  def strike?(score)
    score == [10]
  end

  def score_strike(frame)
    if @scores[frame + 1].length == 2
      10 + @scores[frame + 1].inject(:+)
    else
      10 + @scores[frame + 1].first + @scores[frame + 2].first
    end
  end

  def spare?(score)
    score.inject(:+) == 10
  end

  def keep_score
    @scores.each do |frame, score|
      if frame < 11
        if strike?(score)
          @scores[frame] = score_strike(frame)
        elsif spare?(score)
          @scores[frame] = 10 + @scores[frame + 1].first
        end
      end
    end
  end

  def flatten_scores
    @scores.each do |frame, score|
      if score.class == Array
        @scores[frame] = score.inject(:+)
      end
    end
  end
end
