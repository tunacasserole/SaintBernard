require 'test_helper'

class TransferControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get transfers_url
    assert_response :success
  end

  test "should get show" do
    get transfer_url(1)
    assert_response :success
  end
end
