class ListsController < ApplicationController

  def index
    respond_with @lists = List.all
  end

  def show
    respond_with @list = List.find(params[:id])
  end

  def create
    @list = List.create(list_params)
    respond_with @list
  end

  def update
    @list = List.find(params[:id])
    respond_with @list.update(list_params)
  end

  def destroy
    @list = List.find(params[:id])
    respond_with @list.destroy
  end

  private

  def list_params
    params.require(:data)
      .permit(:name, :trip_id)
  end

end
