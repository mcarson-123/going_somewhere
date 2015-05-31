require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  let!(:trip) { create(:trip) }

  describe "GET #index" do
    it "gets the trips" do
      get :index, { format: :json }

      expect(response).to have_http_status(:ok)
      expect(assigns[:trips]).to contain_exactly(trip)
    end
  end

  describe "GET #show" do
    it "gets the trip" do
      get :show, { format: :json, id: trip.id }

      expect(response).to have_http_status(:ok)
      expect(assigns[:trip]).to eql(trip)
    end
  end

  describe "POST #create" do
    it "creates the trip" do
      post :create, { format: :json, data: { name: "Super Fun Trip" } }

      expect(response).to have_http_status(:created)
      expect(assigns[:trip]).to be_persisted
      expect(assigns[:trip].name).to eql("Super Fun Trip")
    end
  end

  describe "PUT #update" do
    it "updates the trip" do
      put :update, { format: :json, id: trip.id, data: { name: "Super Fun Trip" } }

      expect(response).to have_http_status(:no_content)
      expect(assigns[:trip]).to be_persisted
      expect(assigns[:trip].name).to eql("Super Fun Trip")
    end
  end

  describe "DELETE #destroy" do
    it "deletes the trip" do
      delete :destroy, { format: :json, id: trip.id }

      expect(response).to have_http_status(:no_content)
      expect{ Trip.find(trip.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
