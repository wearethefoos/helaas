require 'spec_helper'

describe PostsController do
  let(:user) { create :user }
  before do
    session[:current_user_id] = user.id
  end

  describe "#show" do
    let(:post) { double("some-post") }
    it "finds the requested post" do
      expect(Post).to receive(:find).with('post-id').and_return post
      get :show, id: 'post-id'
    end
  end

  describe "#create" do
    it "creates a new post" do
      expect { post :create, post: { content: 'Foo' } }.to change(Post, :count).by(1)
    end

    it "assigns the current user to the post" do
      post :create, post: { content: 'Bar' }
      expect(assigns(:post).user).to eq User.current_user
    end
  end
end
