class Game

    attr_accessor :player_1, :previous_player, :player_2, :current_player, :fragment, :dictionary

    def initialize
        @players = 2
        @player_1 = Player.new(name_1)
        @player_2 = Player.new(name_2)
        @current_player = @player_1
        @previous_player = @player_2
        @fragment = ""
        @game_over = false
        @dictionary = {} 
        File.readlines('dictionary.txt').map(&:chomp).each {|ele| @dictionary[ele] = ''}
    end

    def next_player!
        if @current_player == @player_1
            @current_player = @player_2
            @previous_player = @player_1
        else
            @current_player = @player_1
            @previous_player = @player_2
        end
    end

    def valid_play?(string)
        flag = false
        
        @dictionary.each_key do |key|
            if key.slice(0, string.length) == string
                flag = true
            end
        end
        
        flag
    end

    def take_turn(player)
        @fragment += @current.player.guess

        if self.valid_play?(@fragment)
            if @dictionary.has_key(@fragment)
                self.game_over
            end
            self.next_player!
        end
    end

    def game_over
        @game_over = true
        puts '#{@current_player.name} you lose!'
    end

end