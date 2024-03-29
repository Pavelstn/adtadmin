require 'test_helper'

module Adtadmin
  class PostsControllerTest < ActionController::TestCase
    setup do
      @post = posts(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:posts)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create post" do
      assert_difference('Post.count') do
        post :create, post: { altname: @post.altname, category_id: @post.category_id, contact: @post.contact, imageurl: @post.imageurl, isactive: @post.isactive, isdelete: @post.isdelete, ontop: @post.ontop, price: @post.price, region_id: @post.region_id, tags: @post.tags, text: @post.text, title: @post.title, user_id: @post.user_id }
      end
  
      assert_redirected_to post_path(assigns(:post))
    end
  
    test "should show post" do
      get :show, id: @post
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @post
      assert_response :success
    end
  
    test "should update post" do
      put :update, id: @post, post: { altname: @post.altname, category_id: @post.category_id, contact: @post.contact, imageurl: @post.imageurl, isactive: @post.isactive, isdelete: @post.isdelete, ontop: @post.ontop, price: @post.price, region_id: @post.region_id, tags: @post.tags, text: @post.text, title: @post.title, user_id: @post.user_id }
      assert_redirected_to post_path(assigns(:post))
    end
  
    test "should destroy post" do
      assert_difference('Post.count', -1) do
        delete :destroy, id: @post
      end
  
      assert_redirected_to posts_path
    end
  end
end
