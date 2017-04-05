require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test "checking validation" do
  	@comment = Comment.new
  	assert @comment.invalid?
  	@comment.feedback = " wassup"
  	assert @comment.valid?
  end

end
