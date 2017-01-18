require 'rails_helper'

RSpec.describe Post, type: :model do
   describe "creation" do
      before do 
          @user = User.create(email: "test2@test2.com", password: "eytodoe", password_confirmation: "eytodoe", first_name: "Jhon", last_name: "Snow")
          @post = Post.create(date: Date.today, rationale: "text", user_id: @user.id)
      end
      it "should be created" do
          expect(@post).to be_valid
      end

      it "cannot be created without date and rationale" do
           @post.date = nil
           @post.rationale = nil
           expect(@post).to_not be_valid
      end
   end
end
