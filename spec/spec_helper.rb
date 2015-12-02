require 'minitest/autorun'
require 'minitest/spec'
require 'webmock/minitest'
require 'zero_push_woosh'
require 'pry'

ENV['AUTH_TOKEN'] ||= 'test-token'

WebMock.enable!
