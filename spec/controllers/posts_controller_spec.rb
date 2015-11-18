require 'rails_helper'
RSpec.describe PostsController, :type => :controller do
		
	context '#index' do

    	it "renders the index template" do
      		get :index
      		expect(response).to render_template("index")
    	end
	end

	context '#new' do
		 it "assigns a new post to @post" do
      		get :new
      		expect(assigns(:post)).to  be_a_new(Post)
    	end

    	it "renders the :new template" do
      		get :new
      		expect(response).to render_template :new
    	end
	end

	context '#create' do

    	context  "with valid attributes" do
    	before :all do 
    		@test_post = Post.create
    	end
    	it "save the new post in the database" do
      	expect{
        	post :create, 
        	post: {title: @test_post.title, content: @test_post.content}
      	}.to change(Post, :count).by(1)
    	end
    	it "re-renders the assigns[:post] template" do
      	post :create,
      	post: {title: @test_post.title, content: @test_post.content}
      	expect(response).to redirect_to post_path(assigns[:post])
    	end
    	end
    end


	context '#destroy' do
		before :each do
        	@post = Post.create
      	end

      	it "delete the post" do
        	expect{
          		delete :destroy, id: @post
        	}.to change(Post, :count).by(-1)
      	end

      	it "redirect to post#index" do
        	delete :destroy, id: @post
        	expect(response).to redirect_to posts_path
      	end
      end

end
