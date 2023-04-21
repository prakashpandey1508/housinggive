class UsersController < ApplicationController
  def index
    @users=User.all
end

def new
    @user=User.new
end

def create
    # debugger
    @user=User.new(user_params)
    if @user.save
        redirect_to root_path
    else
        render 'new'
    end
end

def show
    @users=User.all

    @users=User.find_by(params[:id])

    
end
private
def user_params
    params.require(:user).permit(:name, :email, :number, :password)
end
end
