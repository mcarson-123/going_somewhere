class ListItemsController < ApplicationController

  def index
    @list_items = params[:list_id] ? ListItem.where(list_id: params[:list_id]) : ListItem.all
    # respond_with @list_items = ListItem.where(list_id: params[:list_id])
    respond_with @list_items
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
