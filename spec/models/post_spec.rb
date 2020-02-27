require 'rails_helper'

RSpec.describe Post, type: :model do

  #本文があれば有効であること
  it "is valid with a body" do
    post = Post.new(
      name: 'Taro',
      body: 'text',
      user_id: 1
    )
    expect(post).to be_valid
  end

  it "is invalid without a body" do
    post = Post.new(body: nil)
    post.valid?
    expect(post.errors[:body]).to include("can't be blank")
  end


end