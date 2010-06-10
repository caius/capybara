require File.expand_path('spec_helper', File.dirname(__FILE__))

require 'capybara'

describe Capybara do
  
  describe 'default_wait_time' do
    after do
      Capybara.default_wait_time = 2
    end
    
    it "should be changeable" do
      Capybara.default_wait_time = 5
      Capybara.default_wait_time.should == 5
    end
  end

  describe "#culerity_driver_options" do
    before do
      # Reset it back to defaults
      Capybara.culerity_driver_options = nil
    end

    it "should default to an empty hash" do
      Capybara.culerity_driver_options.should == {}
    end

    it "should take a custom value" do
      Capybara.culerity_driver_options = {:foo => :bar}
      Capybara.culerity_driver_options.should == {:foo => :bar}
    end
  end

end