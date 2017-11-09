require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    get users_new_url
    assert_response :success
  end
  def create
    @user = User.new(user_params)
    if @user.save
            flash[:success] = "Welcome to the Sample App!"

      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end

