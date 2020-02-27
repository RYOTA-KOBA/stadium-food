require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    describe 'GET #show' do
        it "assigns the requested post to @post" do
          post = create(:post)
          get :show, id: post
          expect(assigns(:post)).to eq post
        end

        it "renders the :show template" do
            post = create(:post)
            get :show, id: post
            expect(response).to render_template :show
          end
    end

end
