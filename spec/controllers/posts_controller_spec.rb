require 'spec_helper'

describe PostsController do
  describe "#show" do
    let(:post) { double("some-post") }
    it "finds the requested post" do
      Post.should_receive(:find).with('post-id').and_return post
      get :show, id: 'post-id'
    end
  end

  describe "#create" do
    it "creates a new post" do
      expect { post :create, post: { content: 'Foo' } }.to change(Post, :count).by(1)
    end
  end
end
