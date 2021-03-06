class ProductsController < ApplicationController

	def inventory
		@product = Product.find_by(id: params[:id])
		render plain: @product.inventory > 0 ? true : false
	end

	def description
		@product = Product.find_by(id: params[:id])
		render plain: @product.description
	end

	def index 
		@products = Product.all
	end

	def new 
		@product = Product.new
	end

	def create
		Product.create(product_params)
		redirect_to products_path
	end


	private
	def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
	


end
