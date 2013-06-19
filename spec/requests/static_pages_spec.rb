# encoding: utf-8

require 'spec_helper'

describe "Static Pages" do

	describe "Home page" do

		it "Should have h1 'Sample app'" do
			visit '/static_pages/home'
			page.should have_selector('h1', :text => 'Sample app')
		end

		it "Should have right title" do
			visit '/static_pages/home'
			page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Home")		
		end

	end

	describe "Help page" do

		it "Should have h1 'Help'" do
			visit '/static_pages/help'
			page.should have_selector('h1', :text => 'Help')
		end
		it "Should have right title" do
			visit '/static_pages/help'
			page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Help")
		end

	end

	describe "About page" do

		it "Should have h1 'About us'" do
			visit '/static_pages/about'
			page.should have_selector('h1', :text => 'About us')
		end
		it "Should have right title" do
			visit '/static_pages/about'
			page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | About")		
		end

	end

	describe "Contact page" do

		it "Should have h1 'Contact'" do
			visit '/static_pages/contact'
			page.should have_selector('h1', :text => 'Contact')
		end
		it "Should have right title" do
			visit '/static_pages/contact'
			page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Contact")
		end

	end

end
