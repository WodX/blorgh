require "test_helper"

module Blorgh
  class LoggerControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get logger_index_url
      assert_response :success
    end
  end
end
