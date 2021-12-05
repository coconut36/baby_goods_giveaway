class UserAgesController < ApplicationController
  before_action :set_user_age, only: %i[show edit update destroy]

  def index
    @q = UserAge.ransack(params[:q])
    @user_ages = @q.result(distinct: true).includes(:products).page(params[:page]).per(10)
  end

  def show
    @product = Product.new
  end

  def new
    @user_age = UserAge.new
  end

  def edit; end

  def create
    @user_age = UserAge.new(user_age_params)

    if @user_age.save
      redirect_to @user_age, notice: "User age was successfully created."
    else
      render :new
    end
  end

  def update
    if @user_age.update(user_age_params)
      redirect_to @user_age, notice: "User age was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user_age.destroy
    redirect_to user_ages_url, notice: "User age was successfully destroyed."
  end

  private

  def set_user_age
    @user_age = UserAge.find(params[:id])
  end

  def user_age_params
    params.require(:user_age).permit(:age_range)
  end
end
