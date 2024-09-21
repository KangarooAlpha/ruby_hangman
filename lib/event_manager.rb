require_relative('load_save.rb')
require_relative('save_game.rb')
require_relative('game.rb')

unless './output'.empty?
  puts "Do you wish to choose one of your saves? (y/n)"
  ch = gets.chomp!
  if ch.downcase == 'y'
    save = LoadSave.new
    guesses = save.guesses.to_i
    puts guesses
    word = save.word
    puts word
    placeholder = save.placeholder
    puts placeholder
    Game.new(word, placeholder, guesses)
  else
    Game.new
  end
else
  Game.new
end
