require 'test_helper'
require 'generators/sms_gateway/sms_gateway_generator'

class SmsGatewayGeneratorTest < Rails::Generators::TestCase
  tests SmsGatewayGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
