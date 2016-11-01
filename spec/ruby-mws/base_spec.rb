require 'spec_helper'

describe RubyMWS::Base do

  it "should connect and get a timestamp" do
    RubyMWS::Base.server_time.class.should == Time
  end

  context 'initialize' do
    it "should create a connection object" do
      mws = RubyMWS::Base.new(auth_params)
      mws.should be
      mws.connection.should be
      mws.connection.class.should == RubyMWS::Connection
    end
  end

end