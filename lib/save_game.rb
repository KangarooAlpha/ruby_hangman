class SaveGame
  def initialize(word, placeholder, guesses)
    save_file(word, placeholder, guesses)
  end

  def save_file(word, placeholder, guesses)
    Dir.mkdir("./output") unless Dir.exist?("./output")
    @c = Dir["./output/**/*"].length
    f = ("./output/#{@c+1}")
    File.open(f, 'w') do |file|
      file.puts placeholder
      file.puts word
      file.puts guesses
    end

  end
end