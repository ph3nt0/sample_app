require 'spec_helper'

describe ApplicationHelper do
	describe "full_title" do

		it "Should include the page name" do
			full_title("foo").should =~ /foo/
		end

		it "Should include the base title" do 
			full_title("foo").should =~ /^Ruby on Rails Tutorial Sample App/
		end

		it "Should not include a bar on the home page " do
			full_title("").should_not =~ /\|/

		end
	end
end
