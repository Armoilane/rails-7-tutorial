require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:Armo)
  end

  test 'unsuccessful edit' do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {
      user: {
        name: '',
        email: 'foio@incalid',
        password: 'fgoo',
        password_confirmation: 'tat'
      }
    }
    assert_template 'users/edit'
    assert_select 'div.alert', text: 'The form contains 4 errors.'
  end
end

