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
  end
end
