class ListsController < ApplicationController
  def index
    @lists = List.all
    @lists = List.includes(:reviews).all
  end

  def show
    @list = List.find(params[:id])
    @average_rating = @list.reviews.average(:rating).to_f
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
