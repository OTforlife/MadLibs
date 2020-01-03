require "./lib/mad_lib"

stillRunning = true

while stillRunning
    puts "Welcome to MadLibs! Would you like to do..."
    puts "A) Secret Agent Showdown"
    puts "B) Pirate Panic!"
    puts "C) The Worst Knight"
    puts "D) Write your own!"
    puts "E) Quit"

    # story_line_test = IO.readlines("./pirate_panic.txt")[0]
    # puts story_line_test

    story_choice = gets.chomp.downcase
    chosenStory = "" 
    user_answers = []

    if story_choice == "a"
        chosenStory = File.read("./secret_agent_showdown.txt")
    elsif story_choice == "b"
        chosenStory = File.read("./pirate_panic.txt")
    elsif story_choice == "c"
        chosenStory = File.read("./the_worst_knight.txt")
    elsif story_choice == "d"
        puts "Please enter your story (Use {{double curly brackets}} around each replaceable keyword)"

    chosenStory = gets.chomp
    elsif story_choice == "e"
        puts "Byeeee"
        stillRunning = false
        break
    else 
        puts "What?"
    end

    storyCopy = chosenStory + " "
    ml = MadLib.new
    scanned_key_words = ml.scan_string(storyCopy)

    scanned_key_words.each do |word|
        puts "Please enter #{word}: "
        user_answers << gets.chomp
    end

    finalProduct = ml.replace(user_answers)

    puts finalProduct
end

