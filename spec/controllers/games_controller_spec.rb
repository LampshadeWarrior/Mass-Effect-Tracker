require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "games#index" do
    it "should list the games in the database" do
      game1 = FactoryBot.create(:game)
      game2 = FactoryBot.create(:game)
      get :index
      expect(response).to have_http_status :success
      response_value = ActiveSupport::JSON.decode(@response.body)
      expect(response_value.count).to eq(2)
    end
  end
end
