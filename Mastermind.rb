#Mastermind.rb
/
Might not need Board class. 

Problems: 
  computer.play isn't displaying player name.
  Need to restict input for guesses so it only accepts listed colours. 

Do:
  build player.play so it mirrors computer.play
  build computer algorithm for guessing player's code.
/

#input validation is still an issue. 

class Game

  attr_accessor :playername, :codemaker_or_codebreaker

  
  def initalize
    
  end

  def codemaker_or_codebreaker(player1, computer)
  puts "#{@playername}, do you want to be the codemaker or the codebreaker?"
  answer = gets.chomp.downcase
  if answer == "codemaker"
    player1.play(computer, self)
  elsif answer == "codebreaker"
    computer.play(player1, self)
  else
    puts "Sorry, you haven't entered a valid answer. Try again."
    codemaker_or_codebreaker(player1, computer)
  end
    
  end

  def playername(player1)
    @playername = player1.name
  end

  def info(computer, player1)
    code = player1.code
    puts code
  end

  def rematch

  end

end

class HumanPlayer
  
  attr_accessor :name, :name_setter, :playerguess, :guessarray, :colours, :code

  public
  def initialize
    puts "New player created!"
  end

  def name_setter
  puts "Player, please enter your name:"
  @name = gets.chomp
  puts "Hello, #{name}."
  end

  def name
    @name
  end

=begin  
  def input_validator(word)
    if word.include?(["red", "blue", "orange", "green", "yellow", "purple"])
      puts "a colour was chosen correctly"
     else
      puts "incorrect" 
     end
    end
=end

  def playerguess
    @guess = []
    puts "What do you think the first colour is?"
      @guess[0] = gets.chomp.downcase
      #input_validator(@guess[0])
    puts "What do you think the second colour is?"
      @guess[1] = gets.chomp.downcase
      #input_validator(@guess[1])
    puts "What do you think the third colour is?"
      @guess[2] = gets.chomp.downcase
      #input_validator(@guess[2])
    puts "What do you think the fourth colour is?"
      @guess[3] = gets.chomp.downcase
      #input_validator(@guess[3])
  end

  def guessarray
    @guess
  end

  def play(computer, game)
    #needs to be done
  end

  def colours
    @colours = ["red", "blue", "orange", "green", "yellow", "purple"]
  end
  #private?

  def make_code
    @playercode = []
    puts "You are going to make a code that is a four colour sequence. \nThe possible colours are red, blue, orange, green, yellow and purple. \nEach colour may occur up to four times."
    puts "#{name}, please choose the first colour in your code"
      @playercode[0] = gets.chomp.downcase
    puts "#{name}, please choose the second colour in your code"
      @playercode[1] = gets.chomp.downcase
    puts "#{name}, please choose the third colour in your code"
      @playercode[2] = gets.chomp.downcase
    puts "#{name}, please choose the fourth colour in your code"
      @playercode[3] = gets.chomp.downcase  
    puts "Thank you, #{name}, the computer now has eight attempts to guess your code."
  end

  def code
    @playercode
  end
  
end

class Computer
  attr_accessor :codemaker, :code
  def initalize
    @array
  end 

  def playername(player1)
    @playername = player1.name
  end

  def code
    $code = @array
  end

  def guess
  end 

  def codemaker
    @colours = ["red", "blue", "orange", "green", "yellow", "purple"]
    @compcode = []
    @compcode[0] = @colours.sample()
    @compcode[1] = @colours.sample()
    @compcode[2] = @colours.sample()
    @compcode[3] = @colours.sample()
  end
    
  def guess_check(player1)
    @playerguess = player1.guessarray
    @exactcount = 0 

    @playerguess.each_with_index do |playerguess, gi|
      @compcode.each_with_index do |code, ci|
        if (playerguess == code) && (gi == ci)
          @exactcount += 1
          end
        end
      end

end

def lower_sorter(codes, guesses)
  if codes <= guesses
    @partialcount += codes
  else guesses <= codes
      @partialcount += guesses
  end
end


def partial_check(player1)
  @redguesses = 0
  @blueguesses = 0
  @greenguesses = 0
  @orangeguesses = 0
  @yellowguesses = 0
  @purpleguesses = 0
  @redcodes = 0
  @bluecodes = 0
  @greencodes = 0
  @orangecodes = 0
  @yellowcodes = 0
  @purplecodes = 0
  @partialcount = 0
  @exact = false
  @codecopy = @compcode.dup

  #puts "This is codecopy: #{@codecopy} and this is compcode #{@compcode}."
  #puts @codecopy
  
  if @playerguess[3] == @codecopy[3] 
  @playerguess.delete_at(3)
  @codecopy.delete_at(3) 
  end
  
  if @playerguess[2] == @codecopy[2] 
  @playerguess.delete_at(2)
  @codecopy.delete_at(2) 
  end
  
  if @playerguess[1] == @codecopy[1] 
  @playerguess.delete_at(1)
  @codecopy.delete_at(1) 
  end
   
  if  @playerguess[0] == @codecopy[0] 
  @playerguess.delete_at(0)
  @codecopy.delete_at(0) 
  end

  #p @playerguess, @compcode, @codecopy
  
  @playerguess.each do |colour|
    case colour
    when "red"
      @redguesses += 1
    when "blue"
      @blueguesses += 1
    when "orange"
      @orangeguesses += 1
    when "green"
      @greenguesses += 1
    when "yellow"
      @yellowguesses += 1
    when "purple"
      @purpleguesses += 1
    end
  end

  @codecopy.each do |colour|
    case colour
    when "red"
      @redcodes += 1
    when "blue"
      @bluecodes += 1
    when "orange"
      @orangecodes += 1
    when "green"
      @greencodes += 1
    when "yellow"
      @yellowcodes += 1
    when "purple"
      @purplecodes += 1
    end
  end

  lower_sorter(@redcodes, @redguesses)
  lower_sorter(@bluecodes, @blueguesses)
  lower_sorter(@yellowcodes, @yellowguesses)
  lower_sorter(@greencodes, @greenguesses)
  lower_sorter(@orangecodes, @orangeguesses)
  lower_sorter(@purplecodes, @purpleguesses)
 puts "YOu got #{@exactcount} guess(es) exactly correct and #{@partialcount} partially correct guess(es)."

 @exactcount == 4 ? @exactly = true : @exactly = false

end

def play(player1, game)
codemaker
code
@attempts = 0
puts "#{@playername}, you have eight attempts to guess a four colour sequence. \nThe possible colours are red, blue, orange, green, yellow and purple. \nEach colour may occur up to four times."

8.times do
  @attempts += 1
  puts "#{@playername}, this is attempt number #{@attempts} of 8."
  player1.playerguess
  guess_check(player1)
  partial_check(player1)
  if @exactly == true
    puts "Congratulations, #{@playername}, you won on attempt ##{@attempts}!"
    game.codemaker_or_codebreaker(player1, self)
  end
end

puts "Sadly, #{@playername} after #{@attempts} you couldn't crack the code. Here it is: #{@compcode}."
game.codemaker_or_codebreaker(player1, self)
end
end

player1 = HumanPlayer.new
player1.name_setter
game = Game.new
game.playername(player1)
computer = Computer.new
computer.playername(player1)
game.codemaker_or_codebreaker(player1, computer)