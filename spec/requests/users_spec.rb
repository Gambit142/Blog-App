require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "tests the URL path for users#index" do
      get "/users"

      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include("<h1>Here is a list of users in the database</h1>")
    end

    it "tests the URL path for users#show" do
      get '/users/1'

      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.body).to include("<h1>Here is the view for only one user</h1>")
    end
  end
end
