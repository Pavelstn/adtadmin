require 'test_helper'

module Adtadmin
  class AgentprofilesControllerTest < ActionController::TestCase
    setup do
      @agentprofile = agentprofiles(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:agentprofiles)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create agentprofile" do
      assert_difference('Agentprofile.count') do
        post :create, agentprofile: { adress: @agentprofile.adress, description: @agentprofile.description, isactive: @agentprofile.isactive, isdelete: @agentprofile.isdelete, name: @agentprofile.name, phone: @agentprofile.phone, photourl: @agentprofile.photourl, region_id: @agentprofile.region_id }
      end
  
      assert_redirected_to agentprofile_path(assigns(:agentprofile))
    end
  
    test "should show agentprofile" do
      get :show, id: @agentprofile
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @agentprofile
      assert_response :success
    end
  
    test "should update agentprofile" do
      put :update, id: @agentprofile, agentprofile: { adress: @agentprofile.adress, description: @agentprofile.description, isactive: @agentprofile.isactive, isdelete: @agentprofile.isdelete, name: @agentprofile.name, phone: @agentprofile.phone, photourl: @agentprofile.photourl, region_id: @agentprofile.region_id }
      assert_redirected_to agentprofile_path(assigns(:agentprofile))
    end
  
    test "should destroy agentprofile" do
      assert_difference('Agentprofile.count', -1) do
        delete :destroy, id: @agentprofile
      end
  
      assert_redirected_to agentprofiles_path
    end
  end
end
