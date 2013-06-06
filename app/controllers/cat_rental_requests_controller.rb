class CatRentalRequestsController < ApplicationController

  def new
    @cat = Cat.find(params[:cat_id])
    render :new
  end

  def create
    @cat = Cat.find(params[:cat_id])
    @request = CatRentalRequest.new(params[:cat_rental_request].merge(:cat_id => params[:cat_id]))
    if @request.save
      redirect_to cat_url(@cat)
    else
      redirect_to new_cat_cat_rental_request_path(@cat)
    end
  end
  def approve
    CatRentalRequest.find(params[:id]).approve!
  end

  def update
    # @request = Cat.find(params[:id])
    # @cat.update_attributes(params[:cat])
    # @cat.save
    # redirect_to cats_url
  end
end
