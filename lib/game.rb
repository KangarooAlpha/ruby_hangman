class Game < Save_Game
  def initialize(word = nil, placeholder = "", guesses = 5 )
    @@incorrect_letters = []
    @@guesses = guesses
    @@word = word
    @@palceholder = placeholder
    @@win = false
    @@letters = ('abcdefghijklmnopqrstuvxyz')
    if word == nil
      read_word()
    end
    play_round()
  end

  def read_word
    @filename = 'google_text_file.txt'
    @@word =  (File.readlines(@filename).sample).chomp
    puts @@word
    if (@@word.length() < 5 || @@word.length() > 12)
      @@word = read_word()
    end
    @@placeholder = @@palceholder.rjust(@@word.length, '_')
    @@word
  end

  def play_round
    while @@guesses > 0
      puts ("Your word is #{@@word.length} letters long.\n
      You have #{@@guesses} guesses(s) left to go.\n
      If you wish to save the game, please type 'save'.\n
      These are the incorrect guesses (if any) that you have
      chosen: \n #{@@incorrect_letters.join(", ")}")
      puts ("Please choose a letter to guess if it belongs in the word.")
      puts @@placeholder
      @letter = get_letter()
      compare_letter(@letter)
      if  @@placeholder == @@word
        @@guesses = 0
        win = true
      end
    end
    if win == true 
      puts ("You won! The word was #{@@word} and you had
       #{@@guesses} guess(es) left.")
    else
      puts ("You used all of your guesses, the word was #{@@word}.")
    end
  end

  def get_letter()
    @letter = gets.chomp!.downcase
    if @letter == 'save'
      @@guesses = 0
      save_game(@@word, @@placeholder)
    end
    if (@letter.length > 1 || !@@letters.include?(@letter))
      puts 'Please input a letter.'
      @letter = get_letter()
    end
    @letter
  end
  def compare_letter(letter)
    if @@word.include?(letter)
      @@word.each_char.with_index do |l,i|
        @@placeholder[i] = l if letter.downcase == l
      end 
    else
      @@incorrect_letters << letter
      @@guesses -= 1
      puts "Oh no! #{letter} is not in the word."
    end
  end
end