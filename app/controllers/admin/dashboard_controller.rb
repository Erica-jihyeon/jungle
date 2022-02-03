class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: BASIC_AUTHENTICATION_USERNAME, password: BASIC_AUTHENTICATION_PASSWORD
  def show
    @num_products = Product.count(:all)
    @num_categories = Category.count(:all)
    # raise @num_products.inspect
  end
end
