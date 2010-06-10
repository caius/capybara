require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe Capybara::Driver::Culerity do
  before(:all) do
    @driver = Capybara::Driver::Culerity.new(TestApp)
  end
  
  it_should_behave_like "driver"
  it_should_behave_like "driver with javascript support"
  it_should_behave_like "driver with header support"

  describe "#browser_options" do
    before do
      # Make sure we're using the defaults
      Capybara.culerity_driver_options = nil
    end

    it "should default to sane defaults" do
      @driver.send(:browser_options).should == {:browser => :firefox, :log_level => :off}
    end

    it "should use any additional settings" do
      Capybara.culerity_driver_options = {:foo => :bar}
      @driver.send(:browser_options).should == {:browser => :firefox, :log_level => :off, :foo => :bar}
    end

    it "should override defaults with custom setting" do
      Capybara.culerity_driver_options = {:browser => :internet_explorer}
      @driver.send(:browser_options).should == {:browser => :internet_explorer, :log_level => :off}
    end
  end

end
