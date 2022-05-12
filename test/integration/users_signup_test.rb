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

  test 'valid submission' do
    assert_difference 'User.count' do
      post users_path, params: {
        user: { name: 'yiewjr wrrwt',
                email: 'ewr@wertasd.lol',
                password: 'password',
                password_confirmation: 'password'
        }
      }
    end

    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?

    assert_not flash.alert
  end

end

