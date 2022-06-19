require "test_helper"

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:Armo)
    # This is not idiomatically correct, will be updated later
    @micropost = Micropost.new(content: 'Lorem ipsum', user_id: @user.id)
  end

  test 'micropost should be valid' do
    assert @micropost.valid?
  end

  test 'user id should be present' do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

end

