require 'test_helper'

module Adtadmin
  class NewsListsControllerTest < ActionController::TestCase
    setup do
      @news_list = news_lists(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:news_lists)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create news_list" do
      assert_difference('NewsList.count') do
        post :create, news_list: { img_url: @news_list.img_url, isactive: @news_list.isactive, isdelete: @news_list.isdelete, short_text: @news_list.short_text, text: @news_list.text, title: @news_list.title, user_id: @news_list.user_id }
      end
  
      assert_redirected_to news_list_path(assigns(:news_list))
    end
  
    test "should show news_list" do
      get :show, id: @news_list
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @news_list
      assert_response :success
    end
  
    test "should update news_list" do
      put :update, id: @news_list, news_list: { img_url: @news_list.img_url, isactive: @news_list.isactive, isdelete: @news_list.isdelete, short_text: @news_list.short_text, text: @news_list.text, title: @news_list.title, user_id: @news_list.user_id }
      assert_redirected_to news_list_path(assigns(:news_list))
    end
  
    test "should destroy news_list" do
      assert_difference('NewsList.count', -1) do
        delete :destroy, id: @news_list
      end
  
      assert_redirected_to news_lists_path
    end
  end
end
