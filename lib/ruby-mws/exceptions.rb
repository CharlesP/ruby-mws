module RubyMWS

  class RubyMWSException < StandardError
  end

  class MissingConnectionOptions < RubyMWSException
  end

  class NoNextToken < RubyMWSException
  end

  class ErrorResponse < RubyMWSException
  end

  class BadResponseError < RubyMWSException
  end
end