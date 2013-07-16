require 'test_helper'

module Adtadmin
  class AccountabilityagentsControllerTest < ActionController::TestCase
    setup do
      @accountabilityagent = accountabilityagents(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:accountabilityagents)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create accountabilityagent" do
      assert_difference('Accountabilityagent.count') do
        post :create, accountabilityagent: { agentprofile_id: @accountabilityagent.agentprofile_id, post_id: @accountabilityagent.post_id }
      end
  
      assert_redirected_to accountabilityagent_path(assigns(:accountabilityagent))
    end
  
    test "should show accountabilityagent" do
      get :show, id: @accountabilityagent
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @accountabilityagent
      assert_response :success
    end
  
    test "should update accountabilityagent" do
      put :update, id: @accountabilityagent, accountabilityagent: { agentprofile_id: @accountabilityagent.agentprofile_id, post_id: @accountabilityagent.post_id }
      assert_redirected_to accountabilityagent_path(assigns(:accountabilityagent))
    end
  
    test "should destroy accountabilityagent" do
      assert_difference('Accountabilityagent.count', -1) do
        delete :destroy, id: @accountabilityagent
      end
  
      assert_redirected_to accountabilityagents_path
    end
  end
end
