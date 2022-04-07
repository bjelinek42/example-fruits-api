class FruitsController < ApplicationController
  def index
    fruits = Fruit.all
    render json: fruits
  end

  def create
    fruit = Fruit.new(
      name: params[:name],
      image: params[:image],
      quality: params[:quality]
    )
    fruit.save
    render json: fruit
  end

  def show
    fruit = Fruit.find(params[:id])
    render json: fruit
  end
end
