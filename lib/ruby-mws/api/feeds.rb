# Logic for submitting XML data "feeds" to Amazon and retrieving the response

module RubyMWS
  module API

    module Feeds
      def submit_feed(feed_type, xml)
        puts "ruby-mws: Sending #{feed_type} feed to Amazon RubyMWS. Body: #{xml.size > 1000 ? xml[0...1000] + '...' : xml}" if $VERBOSE
        response = send_request(:submit_feed, :feed_type => feed_type, :body => xml, :verb => :post, :content_md5 => true, :content_type => 'application/xml')

        # Amazon returns FeedSubmissionId, which we use to check if submission was successful
        puts 'response -- ' + response.inspect if $VERBOSE
        
        submission_id = response.feed_submission_info.feed_submission_id
        puts "ruby-mws: Got submission ID #{submission_id}" if $VERBOSE
        
        return submission_id
      end
    end

  end
end
