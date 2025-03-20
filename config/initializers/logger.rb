require 'logger'
require 'active_support/logger'

# Define Logger::Severity if it doesn't exist
unless defined?(Logger::Severity)
  class Logger
    module Severity
      DEBUG = 0
      INFO = 1
      WARN = 2
      ERROR = 3
      FATAL = 4
      UNKNOWN = 5
    end
    include Severity
  end
end