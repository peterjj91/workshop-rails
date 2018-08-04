require 'test_helper'

class ArticleFlowTest < ActionDispatch::IntegrationTest
  test "can see article#post as homepage" do
    get "/"
    assert_select "h1", "Article#index"
  end

  test "can create a article" do 
    get "/articles/new"
    assert_response :success

    post "/articles", params: { title: "Article title", body: "Article body" }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h2", "Article title"
  end

  test "can see form on article#new route" do
    get "/articles/new"

    assert_select "form" do |elements|
      elements.each do |element|
        assert_select element, "input", 4
      end
    end
  end
end
