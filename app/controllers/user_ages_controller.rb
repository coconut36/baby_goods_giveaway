class UserAgesController < ApplicationController
  before_action :set_user_age, only: [:show, :edit, :update, :destroy]

  # GET /user_ages
  def index
    @user_ages = UserAge.all
  end

  # GET /user_ages/1
  def show
  end

  # GET /user_ages/new
  def new
    @user_age = UserAge.new
  end

  # GET /user_ages/1/edit
  def edit
  end

  # POST /user_ages
  def create
    @user_age = UserAge.new(user_age_params)

    if @user_age.save
      redirect_to @user_age, notice: 'User age was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /user_ages/1
  def update
    if @user_age.update(user_age_params)
      redirect_to @user_age, notice: 'User age was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user_ages/1
  def destroy
    @user_age.destroy
    redirect_to user_ages_url, notice: 'User age was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_age
      @user_age = UserAge.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_age_params
      params.require(:user_age).permit(:age_range)
    end
end
