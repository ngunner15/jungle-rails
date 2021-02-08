class Admin::SalesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD']

  def index
    @sales = Sale.all
    @active_sale = Sale.active.first
  end

end
