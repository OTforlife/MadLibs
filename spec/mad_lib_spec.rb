require "mad_lib"

  describe MadLib do
#   it "prints MadLib correctly " do
#     ml = MadLib.new
#     answer = ml.replace
#     expect(answer).to eql("My name is SteveJobs")
#   end

  # it "grabs a substring correctly" do
  #   ml = MadLib.new
  #   answer = ml.replace("My name is {{name}}")
  #   expect(answer).to eql("{{name}}")
  # end

  # it "returns a hash" do
  # ml = MadLib.new
  # answer = ml.replace("My name is {{name}}")
  # expect(answer).to eql({"{{name}}" => "SteveJobs"})
  # end

    it "returns a fixed string" do
    ml = MadLib.new
    ml.scan_string("My name is {{name}}")
    answer = ml.replace(["SteveJobs"])
    expect(answer).to eql("My name is SteveJobs")
    end

    it "returns multiple correct" do
      ml = MadLib.new
      ml.scan_string("My name is {{name}} and I am the {{job}}")
      answer = ml.replace(["SteveJobs", "CEO of Apple"])
      expect(answer).to eql("My name is SteveJobs and I am the CEO of Apple")
    end

    it "gets key_words from string" do
      ml = MadLib.new
      answer = ml.scan_string("My name is {{name}} and I like {{food}}")
      expect(answer).to eql(["{{name}}", "{{food}}"])
    end

    it "knows how to scan double words" do
      ml = MadLib.new
      answer = ml.scan_string("{{name}} was happy, but {{name}} was stupid.")
      expect(answer).to eql(["{{name}}"])
    end

    it "can scan a long and complicated string" do
      ml = MadLib.new
      answer = ml.scan_string("{{name}} went down to {{place}} to buy some {{items}} and felt {{adverb}} {{adjective}} about their {{pet}} who was also named {{name}})")
      expect(answer).to eql(["{{name}}","{{place}}", "{{items}}", "{{adverb}}", "{{adjective}}", "{{pet}}"])
    end

    it "throws error when {{ not closed" do
      ml = MadLib.new
      expect{ml.scan_string("I was like, 'OMG!!@#${{")}.to raise_error(NoMethodError)
    end
    # context "when keywords are {{name}} and {{verb}}" do
    #   it "asks for keywords" do
    #     answer = ml.scan_string
    #   end
    # end
  end


