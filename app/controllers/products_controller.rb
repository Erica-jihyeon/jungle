class ProductsController < ApplicationController

  def index
    # uses MODEL
    @products = Product.all.order(created_at: :desc)
    # VIEW
    # render :index  # this is implicit
  end

  def show
    @product = Product.find params[:id]
  end

end
