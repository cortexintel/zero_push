require 'zero_push_woosh/version'
require 'zero_push_woosh/client'
require 'faraday'

module ZeroPushWoosh
  class << self
    extend Forwardable
    attr_accessor :auth_token, :auth_tokens, :config

    def_delegators :client,
      :verify_credentials,
      :notify,
      :broadcast,
      :subscribe,
      :unsubscribe,
      :register,
      :unregister,
      :set_badge,
      :inactive_tokens,
      :devices,
      :device,
      :set_device,
      :update_device,
      :channels,
      :channel,
      :delete_channel

    def client(auth_token = self.auth_token)
      ZeroPushWoosh::Client.new(auth_token)
    end

    def config
      @config ||= {:http_adapter => Faraday.default_adapter, request_encoding: :json}
    end

    def method_missing(method, *params, &block)
      if auth_tokens.is_a?(Hash) && auth_tokens.keys.include?(method)
        self.client(auth_tokens[method])
      else
        super
      end
    end
  end
end
