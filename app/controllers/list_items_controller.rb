class ListItemsController < ApplicationController

  def index
    respond_with @list_items = ListItem.all
  end

  def show
    respond_with @list_item = ListItem.find(params[:id])
  end

  def create
    @list_item = ListItem.create(list_item_params)
    respond_with @list_item
  end

  def update
    @list_item = ListItem.find(params[:id])
    respond_with @list_item.update(list_item_params)
  end

  def destroy
    @list_item = ListItem.find(params[:id])
    respond_with @list_item.destroy
  end

  private

  def list_item_params
    params.require(:data)
      .permit(:list_id, :name, :quantity, :category)
  end

end
