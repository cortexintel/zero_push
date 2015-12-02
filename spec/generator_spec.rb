require 'spec_helper'
require 'rails/generators/test_case'
require 'generators/zero_push_woosh/install_generator'

class ZeroPushWoosh::GeneratorTest < Rails::Generators::TestCase
  destination File.expand_path('../tmp', __FILE__)
  tests ZeroPushWoosh::InstallGenerator
  test 'it copies the initializer' do
    production_token = 'production'
    development_token = 'development'
    ZeroPushWoosh::InstallGenerator.any_instance.stubs(:ask).returns(production_token).then.returns(development_token)

    run_generator

    assert_file 'config/initializers/zero_push_woosh.rb' do |initializer|
      production_config = %Q|ZeroPushWoosh.auth_token = '#{production_token}'|
      assert(initializer.include?(production_config), "The initializer doesn't include the production configuration")

      development_config = %Q|ZeroPushWoosh.auth_token = '#{development_token}'|
      assert(initializer.include?(development_config), "The initializer doesn't include the development configuration")
    end
  end
end
