require 'rails_helper'

RSpec.describe ListItemsController, type: :controller do
  let!(:list_item) { create(:list_item) }

  describe "GET #index" do
    it "gets the list_items" do
      get :index, { format: :json }

      expect(response).to have_http_status(:ok)
      expect(assigns[:list_items]).to contain_exactly(list_item)
    end
  end

  describe "GET #show" do
    it "gets the list_item" do
      get :show, { format: :json, id: list_item.id }

      expect(response).to have_http_status(:ok)
      expect(assigns[:list_item]).to eql(list_item)
    end
  end

  describe "POST #create" do
    it "creates the list_item" do
      post :create, { format: :json, data: { name: "shoes" } }

      expect(response).to have_http_status(:created)
      expect(assigns[:list_item]).to be_persisted
      expect(assigns[:list_item].name).to eql("shoes")
    end
  end

  describe "PUT #update" do
    it "updates the list_item" do
      put :update, { format: :json, id: list_item.id, data: { name: "shoes" } }

      expect(response).to have_http_status(:no_content)
      expect(assigns[:list_item]).to be_persisted
      expect(assigns[:list_item].name).to eql("shoes")
    end
  end

  describe "DELETE #destroy" do
    it "deletes the list_item" do
      delete :destroy, { format: :json, id: list_item.id }

      expect(response).to have_http_status(:no_content)
      expect{ ListItem.find(list_item.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
