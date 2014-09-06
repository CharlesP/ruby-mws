# Logic for submitting XML data "feeds" to Amazon and retrieving the response

module MWS
  module API

    module Feeds
      def submit_feed(feed_type, xml)
        logger.debug "ruby-mws: Sending #{feed_type} feed to Amazon MWS. Body: #{xml.size > 1000 ? xml[0...1000] + '...' : xml}" if $VERBOSE
        response = send_request(:submit_feed, :feed_type => feed_type, :body => xml, :verb => :post, :content_md5 => true, :content_type => 'application/xml')

        # Amazon returns FeedSubmissionId, which we use to check if submission was successful
        submission_id = response.feed_submission_info.feed_submission_id
        logger.debug "ruby-mws: Got submission ID #{submission_id}" if $VERBOSE
        
        return submission_id
      end
    end

  end
end


# module MWS
#   module API
#
#     class Feed < Base
#       def_request [:submit_feed],
#                   :verb => :post,
#                   :uri => '/',
#                   :body => xml,
#                   :content_md5 => true,
#                   :version => '2009-01-01'
#
#       # def_request :submit_feed,
#       #   :verb => :get,
#       #   :uri => '/Feeds/2011-10-01',
#       #   :version => '2011-10-01',
#       #   :mods => [
#       #     lambda {|r| r.feeds = r.feeds.feed if r.feeds}
#       #   ]
#
#     end
#
#   end
# end
