module RaceBet
  class Race
    POINTS = [15,10,5,3,1]

    class << self
      def score(guesses, winners)
        res = 0
        guesses_left, winners_left = [], []
        guesses.zip(winners, POINTS).each do |a,b,c|
          if a == b
            res += c
          else
            guesses_left << a
            winners_left << b
          end
        end
        res + score_unmatched(guesses_left, winners_left)
      end

      def score_unmatched(guesses, winners)
        (guesses & winners).size
      end
    end

  end
end
