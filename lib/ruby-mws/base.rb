module RubyMWS

  class Base
    
    attr_accessor :connection

    def initialize(options={})
      @connection = RubyMWS::Connection.new(options)
    end

    def orders
      @orders ||= RubyMWS::API::Order.new(@connection)
    end

    def inventory
      @inventory ||= RubyMWS::API::Inventory.new(@connection)
    end

    def reports
      @reports ||= RubyMWS::API::Report.new(@connection)
    end

    def products
      @products ||= RubyMWS::API::Product.new(@connection)
    end
    
    # def feeds
    #   @feeds ||= RubyMWS::API::Feed.new(@connection)
    # end

    # serves as a server ping
    def self.server_time
      RubyMWS::Connection.server_time
    end

  end
end