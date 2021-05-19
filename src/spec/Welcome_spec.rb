require_relative "../modules/Welcome.rb"

describe "a title logo and welcome message" do
    it "welcome method is defined" do
        expect(defined?(welcome)).to eql("method")
    end

    it "displays a formatted welcome message" do
        expect(welcome).to eql("Welcome to my app")
    end
end