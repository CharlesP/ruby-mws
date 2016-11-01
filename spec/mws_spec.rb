require 'spec_helper'

describe RubyMWS do

  context 'connect' do
    it 'should create a RubyMWS::Base object' do
      RubyMWS.new(auth_params).class.should == RubyMWS::Base
    end
  end

end