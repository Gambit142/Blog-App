require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'tests the URL path for posts#index' do
      get '/users/1/posts'

      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here is a list of posts for a given user')
    end

    it 'tests the URL path for posts#show' do
      get '/users/1/posts/1'

      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.body).to include('<h1>Here is the view for a post of a single user</h1>')
    end
  end
end
