class Admins::UsersController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @users = User.all
    respond_with :admins, @users
  end

  def show
    @user = User.find(params[:id])
    respond_with :admins, @user
  end

  def new
    @user = User.new
    respond_with :admin, @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @user.save
    respond_with :admins, @user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with :admins, @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_with :admins, @user
  end
end
