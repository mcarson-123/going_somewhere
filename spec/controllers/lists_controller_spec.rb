require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  let!(:list) { create(:list) }

  describe "GET #index" do
    it "gets the lists" do
      get :index, { format: :json }

      expect(response).to have_http_status(:ok)
      expect(assigns[:lists]).to contain_exactly(list)
    end
  end

  describe "GET #show" do
    it "gets the list" do
      get :show, { format: :json, id: list.id }

      expect(response).to have_http_status(:ok)
      expect(assigns[:list]).to eql(list)
    end
  end

  describe "POST #create" do
    it "creates the list" do
      post :create, { format: :json, data: { name: "Packing List" } }

      expect(response).to have_http_status(:created)
      expect(assigns[:list]).to be_persisted
      expect(assigns[:list].name).to eql("Packing List")
    end
  end

  describe "PUT #update" do
    it "updates the list" do
      put :update, { format: :json, id: list.id, data: { name: "Packing List" } }

      expect(response).to have_http_status(:no_content)
      expect(assigns[:list]).to be_persisted
      expect(assigns[:list].name).to eql("Packing List")
    end
  end

  describe "DELETE #destroy" do
    it "deletes the list" do
      delete :destroy, { format: :json, id: list.id }

      expect(response).to have_http_status(:no_content)
      expect{ List.find(list.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
