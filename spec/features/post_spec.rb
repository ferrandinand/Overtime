require 'rails_helper'		
 		
describe 'navigate' do		
    before do
      @user = User.create(email: "test@est.com", password: "eytodoe", password_confirmation: "eytodoe", first_name: "Jhon", last_name: "Snow")
      login_as(@user, :scope => :user)
      post1 = Post.create(date: Date.today, rationale: "Anything", user_id: @user.id)
      post2 = Post.create(date: Date.today, rationale: "Anything 2", user_id: @user.id)
      visit posts_path   
    end

    describe 'index' do		
       it "can be reached successfully" do	
          expect(page.status_code).to eq(200)		
       end		
 		
       it "has a Post name" do		
          expect(page).to have_content(/Posts/)		
       end		

       it "has a list of posts" do
          expect(page).to have_content(/Anything/)
       end
    end		
 		
  describe 'creation'do		
     before do		
       user = User.create(email: "test@test.com", password: "eytodoe", password_confirmation: "eytodoe", first_name: "Jhon", last_name: "Snow")  		
       login_as(user, :scope => :user)		
       visit new_post_path		
     end 		
     it "has a new form that can be reached" do		
        expect(page.status_code).to eq(200)		
     end		
 		
     it "can be created from new form page" do		
        fill_in 'post[date]', with: Date.today		
        fill_in 'post[rationale]', with: "Some rationale"		
        click_on  "Save"		
 		
        expect(page).to have_content("Some rationale")		
     end		
 		
    it "will have a user associated to it" do		
      fill_in 'post[date]', with: Date.today		
      fill_in 'post[rationale]', with: "User_association"		
      click_on  "Save"		
 		
     expect(User.last.posts.last.rationale).to eq("User_association")		
    end		
  end		
end
