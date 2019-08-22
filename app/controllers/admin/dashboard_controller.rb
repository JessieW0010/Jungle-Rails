class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.count
    @category_count = Category.count
    @sale_count = Sale.count
  end
end
