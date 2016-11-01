require 'spec_helper'

describe RubyMWS::Connection do

  context "initialize" do
    it "should intialize with all requires params" do
      conn = RubyMWS::Connection.new auth_params
      conn.class.should == RubyMWS::Connection
      auth_params.each do |k,v|
        conn.send(k).should == v
      end
      conn.host.should == "mws.amazonservices.com"
    end

    it "should raise an exception when a required param is missing" do
      auth_params.each do |k,v|
        lambda { RubyMWS::Connection.new auth_params.delete(k) }.should raise_error
      end
    end

    it "should override host when sent a host param" do
      conn = RubyMWS::Connection.new auth_params.merge({host: 'newhost.com'})
      conn.host.should == 'newhost.com'
    end
  end
end