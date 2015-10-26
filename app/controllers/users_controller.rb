class UsersController < ApplicationController

# new sign-up form

def new

@user=User.new

end

#create user in database

def create

@user=User.new(user_params)

if @user.save
	redirect_to cuisine_types_path
else
	render :new
end

end

private

def user_params

params.require(:user).permit(:email, :password, :password_confirmation)

end



end

