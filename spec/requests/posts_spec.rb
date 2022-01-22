require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'tests the URL path for posts#index' do
      get '/users/1/posts'

      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('<div>List of All Posts</div>')
    end

    it 'tests the URL path for posts#show' do
      get '/users/1/posts/1'

      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.body).to include('<i class="fas fa-heart"></i>')
    end
  end
end
