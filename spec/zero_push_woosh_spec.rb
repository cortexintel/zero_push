require 'spec_helper'

describe ZeroPushWoosh do
  before do
    ZeroPushWoosh.auth_token = ENV['AUTH_TOKEN'] || 'test_token'
  end

  describe 'using different auth_tokens' do
    it 'accepts a hash of tokens' do
      ZeroPushWoosh.auth_tokens = {
        apns: 'test-apns-token',
        gcm: 'test-gcm-token'
      }
      ZeroPushWoosh.apns.auth_token.must_equal 'test-apns-token'
      ZeroPushWoosh.gcm.auth_token.must_equal 'test-gcm-token'
    end
  end

  describe '.client' do
    it 'returns a client instance' do
      ZeroPushWoosh.client.class.must_equal ZeroPushWoosh::Client
    end
  end

  describe 'methods the module responds to' do
    [:verify_credentials, :notify, :broadcast, :subscribe, :unsubscribe, :register, :unregister, :set_badge, :inactive_tokens, :devices, :device, :set_device, :update_device, :channels, :channel, :delete_channel, :client].each do |method|
      it "responds to #{method}" do
        ZeroPushWoosh.respond_to?(method).must_equal(true)
      end
    end
  end
end
