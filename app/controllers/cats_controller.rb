class CatsController < ApplicationController
  def create
    @cat = Cat.new(params[:cat])
    if @cat.save
      redirect_to cats_url
    else
      redirect_to new_cat_url
    end
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def index
    @cats = Cat.all
    render :index
  end

  def new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update_attributes(params[:cat])
    @cat.save
    redirect_to cats_url
  end

  def destroy
    Cat.find(params[:id]).destroy
  end
end
