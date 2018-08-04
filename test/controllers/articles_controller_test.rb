require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get show" do
    get "/articles/1"
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end
end
