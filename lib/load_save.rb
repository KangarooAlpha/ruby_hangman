class LoadSave
  attr_reader :placeholder, :word, :guesses
  def initialize
    show_files()
    @file = choose_save() 
    load_info(@file)
    delete(@file)
  end

  def show_files
    @files = Dir.entries("./output").select { |f| File.file? File.join("./output", f) }
    puts @files
    @files.each do |file|
      File.open("./output/#{file.gsub('""',"")}", "r") do |f|
        @pl = f.readlines
        puts "#{File.basename(f,'.rb')}. #{@pl[0].gsub("/n","")}"
     end 
    end
  end

  def choose_save
    puts "Please choose a number from your saved games"
    @choice = gets.chomp!
    if File.exist?("./output/#{@choice}") 
      @a = "./output/#{@choice}"
    else
      puts "This file doesn't exit."
      @a = choose_save()
    end
    @a
  end

  def load_info(file)
    File.open("#{file}", "r") do |f|
      lines = f.readlines
      @placeholder = lines[0].gsub("/n","")
      puts @placeholder
      @word = lines[1].gsub("/n","")
      puts @word
      @guesses = lines[2].gsub("/n","")
      puts @guesses
    end
  end

  def delete(file)
    File.delete(file)
  end
end