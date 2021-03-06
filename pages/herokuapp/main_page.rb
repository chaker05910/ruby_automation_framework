require 'logger'
require './pages/actions'

#Page Object Model (POM) is a design pattern, popularly used in test automation that creates Object Repository for web UI elements.
#The advantage of the model is that it reduces code duplication and improves test maintenance
module Page
  module Herokuapp
    #Navigation class with some template methods.
    class MainPage

      #Set up browser and create actions class
      # @param browser[Webdrivers::Driver] initialized selenium browser
      # @see Page::Actions
      def initialize(browser)
        @browser = browser
        @actions = Page::Actions.new(@browser)
      end

      #Open A/B page and return ABPage object
      def open_a_b_page
        @browser.find_element(link_text: "A/B Testing").click
        Page::Herokuapp::ABPage.new(@browser)
      end

      #Open Add/remove page and return ABPage object
      def open_add_remove_elements
        @browser.find_element(link_text: "Add/Remove Elements").click
        Page::Herokuapp::AddRemoveElements.new(@browser)
      end

      #Go to main page
      def visit
        $logger.info("Visiting main page : http://the-internet.herokuapp.com/")
        @browser.get 'http://the-internet.herokuapp.com/'
      end

      #Get page title
      def get_title
        title = @browser.title
        $logger.info("Page title retrieved and is [#{title}]")
        return title
      end

    end
  end
end