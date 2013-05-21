require 'spec_helper'

describe CommentsController do
  let(:user) { create :user }
  before do
    session[:current_user_id] = user.id
  end

  describe "#create" do
    let(:main_post) { Post.create content: 'Foo' }

    let(:creation_request) {
      post :create, post_id: main_post.id, comment: { content: 'Bar' }
    }

    it "creates a new comment on a post" do
      expect { creation_request }.to change { main_post.comments.count }.by(1)
    end

    it "redirects to the original post" do
      creation_request
      response.should redirect_to post_path(main_post)
    end
  end
end
