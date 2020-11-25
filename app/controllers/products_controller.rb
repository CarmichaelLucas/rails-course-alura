class ProductsController < ApplicationController

  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.order(name: :asc).limit 6
    @products_price = Product.order(:price).limit 1
  end

  def create
    
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = 'Produto salvo com Sucesso!'
      redirect_to root_url
    else
      rendering
    end

  end

  def new
    @product = Product.new
    @departments = Department.all
  end

  def edit
    rendering
  end

  def update

    if @product.update(product_params)
      flash[:notice] = 'Produto atualizado com Sucesso!'
      redirect_to root_url
    else
      rendering
    end
      
  end

  def search
    @name = params[:name]
    @products = Product.where "name like ?", "%#{@name}%"
  end

  def destroy
  
    @product.destroy

    redirect_to root_url
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :department_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def rendering
    @departments = Department.all
    render :new
  end
end
