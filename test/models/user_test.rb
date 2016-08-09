require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(user_name: "Username", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should not be too long" do
    @user.user_name = "a" * 30
    assert_not @user.valid?
  end

  test "there must be an email address" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email shouldn't be too long either" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "only valid emails will be accepted" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                      first.last@foo.jp alice+bob@bax.cn]
    valid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?
    end
  end

  test "emails should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "usernames should also be unique" do
    duplicate_user = @user.dup
    duplicate_user.user_name = @user.user_name.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end

  #test "password should be 6 char or longer"
  #@user.password = @user.password_confirmation = "a" * 5
  #  assert_not @user.valid?
#  end
end
