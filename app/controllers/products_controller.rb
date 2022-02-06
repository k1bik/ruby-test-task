require 'net/http'
require "uri"
require "json"

class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  MEASUREMENT = 1_000_000

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    @product.user_id = 9

    url = URI("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{ params[:product][:departure] }&destinations=#{ params[:product][:destination] }&key=#{ API }")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    res = https.request(request)
    json = JSON.parse(res.body)
    @product.distance = json['rows'][0]['elements'][0]['distance']['value'] * 0.001

    order_volume = volume(@product.height, @product.width, @product.height)

    @product.price = totalPrice(order_volume, @product.distance, @product.weight) / 0.001

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:weight, :length, :width, :height, :departure, :destination, :distance)
    end

    def volume(lenght, height, width)
      lenght * height * width
    end

    def totalPrice(volume, distance, height)
      if volume > MEASUREMENT && height < 10.0
        price = distance * 0.002
      elsif volume < MEASUREMENT
        price = distance * 0.001
      else
        price = distance * 0.003
      end
    end
end
