class Game
  def initialize
    @@incorrect_letters = []
    @@guesses = 5
    @@word = nil
    @@palceholder = nil
    read_word()
    play_round()
  end

  def read_word
    @filename = 'google_text_file.txt'
    @@word =  (File.readlines(@filename).sample).chomp
    puts @@word
    if (@@word.length() < 5 || @@word.length() > 12)
      @@word = read_word()
    end
    @@placeholder = (word.length * '_')
    @@word
  end

  def play_round
    while @@guesses > 0
    puts ("Your word is #{@@word.length} letters long.\n
    You have #{@@guesses} guesses(s) left to go.\n
    These are the incorrect guesses (if any) that you have
     chosen: \n #{@@incorrect_letters}")
    puts ("Please choose a letter to guess if it belongs in the word.")
    puts @@placeholder
    @letter = get_letter()
    compare_letter()
    if  @@placeholder == @@word
      @@guesses = 0
    end

    end
  end

  def get_letter()
    @letter = gets.chomp!
    if (@letter.length > 1)
      puts 'Please input only one letter.'
      @letter = get_letter()
    end
    @letter
  end
  def compare_letter(letter)
    if @@word.include?(letter)
      @@word.each_with_index {|l,i| @@placeholder[i] = l if letter.downcase == l}
    else
      @@incorrect_letters << letter
      @@guesses -= 1
      puts "Oh no! #{letter} is not in your word."
    end
  end
end