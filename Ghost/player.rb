class Player

    def initialize(name)
        @name = name
    end

    def guess
        puts "enter a letter"
        input = gets.chomp 
        self.alert_invalid_guess if input.length > 1 || !('a'..'z').include?(input)
        return input
    end

    def alert_invalid_guess
        raise "invalid guess"
    end



end