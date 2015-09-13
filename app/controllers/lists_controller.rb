class ListsController < ApplicationController

  def index
    @lists = params[:trip_id] ? List.where(trip_id: params[:trip_id]) : List.all
    respond_with @lists
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
