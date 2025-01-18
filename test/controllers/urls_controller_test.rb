require "test_helper"

class UrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url = urls(:one) # Assuming you have a fixture named urls
  end

  test "should get index" do
    get urls_url
    assert_response :success
  end

  test "should get new" do
    get new_url_url
    assert_response :success
  end

  test "should create url" do
    assert_difference('Url.count') do
      post urls_url, params: { url: { original_url: 'http://example.com' } }
    end
    assert_redirected_to urls_path
  end

  test "should show url" do
    get url_url(@url)
    assert_response :success
  end

  test "should track analytics" do
    assert_difference('@url.analytics.count', 1) do
      get url_url(@url)
    end
  end
end
