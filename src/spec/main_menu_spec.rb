require_relative "../modules/main_menu.rb"

describe "main menu using tty-prompt for selection functionality" do
    it "main_menu method is defined" do
        expect(defined?(main_menu)).to eql("method")
    end

    it "should output one of the options when selected" do
        expect(main_menu).to eql("recipe")
    end
end