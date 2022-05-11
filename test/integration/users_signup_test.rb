require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test 'invalid user does not increase user count' do
    get signup_path

    assert_no_difference 'User.count' do
      post users_path, params: {
        user: { name: '',
                email: 'we@invlaid',
                password: 'ewr',
                password_confirmation: 'wer'
              }
      }
    end

    assert_response :unprocessable_entity
    assert_template 'users/new'

    assert_select 'div#error_explanation'
    assert_select 'div.alert'
  end

end

