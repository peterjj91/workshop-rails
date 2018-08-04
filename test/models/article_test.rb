require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should be invalid without a title" do
    articles(:one).title = nil
    assert_nil articles(:one).title
    assert_equal false, articles(:one).valid?
  end

  test "should be invalid without a body" do
    articles(:one).body = nil
    assert_nil articles(:one).body
    assert_equal false, articles(:one).valid?
  end

  test "article title should be a string" do
    assert_equal true, articles(:one).title.is_a?(String)
  end

  test "article body should be a string" do
    assert_equal true, articles(:one).body.is_a?(String)
  end
end
