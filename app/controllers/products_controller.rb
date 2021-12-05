class ProductsController < ApplicationController
  before_action :current_user_must_be_product_giver,
                only: %i[edit update destroy]

  before_action :set_product, only: %i[show edit update destroy]

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).includes(:giver, :messages,
                                                   :category, :age_group).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@products.where.not(location_latitude: nil)) do |product, marker|
      marker.lat product.location_latitude
      marker.lng product.location_longitude
    end
  end

  def show
    @message = Message.new
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)

    if @product.save
      message = "Product was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @product, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    message = "Product was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to products_url, notice: message
    end
  end

  private

  def current_user_must_be_product_giver
    set_product
    unless current_user == @product.giver
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:giver_id, :name, :description, :age_id,
                                    :category_id, :gender, :image, :location)
  end
end
