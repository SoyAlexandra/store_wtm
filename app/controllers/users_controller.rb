class UsersController < ApplicationController
  #users/index
  def index
  	@users = User.all
  	#puts "#{@users.inspect}"
  end

  #users/123
  def show
  	@user = User.find(params[:id])
  end

  #users/new
  def new
  	@user = User.new
  end

  #users/
  def create
  	params_filtered = params.require(:user).permit(:name, :email, :password)
  	#params_filtered = {name: "michel", email:"michel@gmai.com", password:"2131312"}
  	@user = User.new(params_filtered)
  	if @user.save
  		redirect_to users_path
  	else
  		render 'new'
  	end
  end

end
