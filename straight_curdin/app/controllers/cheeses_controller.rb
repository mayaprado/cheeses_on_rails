class CheesesController < ApplicationController

  def index
    @cheeses = Cheese.all
  end

  def show
    @cheese = Cheese.find(params[:id])
  end

  def new
    @cheese = Cheese.new
  end

  def create
    @cheese = Cheese.new(cheese_params)

    if @cheese.save
      redirect_to cheeses_path
    else
      render :action => :new
    end
  end

  def edit
    @cheese = Cheese.find(params[:id])
  end

  def update
    @cheese = Cheese.find(params[:id])

    if @cheese.update(cheese_params)
      redirect_to @cheese
    else
      render :action => :edit
    end
  end

  def destroy
    @cheese = Cheese.find(params[:id])
    @cheese.destroy
    redirect_to cheeses_path
  end

  def random
    max = Cheese.all.length
    ran_num = rand(1..max)
    @cheese = Cheese.find(ran_num)
  end

  private

  def cheese_params
    params.require(:cheese).permit(:name, :milk_type, :description, :image_url)
  end


end