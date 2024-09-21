require_relative('load_save.rb')
require_relative('save_game.rb')
require_relative('game.rb')

unless Dir.empty?('./output')
  puts "Do you wish to choose one of your saves? (y/n)"
  ch = gets.chomp!
  if ch.downcase == 'y'
    save = LoadSave.new
    guesses = save.guesses.to_i
    word = save.word
    placeholder = save.placeholder
    Game.new(word, placeholder, guesses)
  else
    Game.new
  end
else
  Game.new
end
