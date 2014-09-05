require 'minitest/spec'
require 'minitest/autorun'
require "minitest/reporters"
require "paperclip/smart_data_uri_adapter"

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]
