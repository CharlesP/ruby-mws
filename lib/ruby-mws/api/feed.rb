module MWS
  module API

    class Feed < Base
      def_request [:submit_feed],
                  :verb => :post,
                  :uri => '/',
                  :content_md5 => true,
                  :version => '2009-01-01'

      # def_request :submit_feed,
      #   :verb => :get,
      #   :uri => '/Feeds/2011-10-01',
      #   :version => '2011-10-01',
      #   :mods => [
      #     lambda {|r| r.feeds = r.feeds.feed if r.feeds}
      #   ]

    end

  end
end
