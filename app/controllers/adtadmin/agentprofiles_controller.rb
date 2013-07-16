require_dependency "adtadmin/application_controller"

module Adtadmin

class AgentprofilesController < ApplicationController
  load_and_authorize_resource  :class=> Adtadmin::Agentprofile
  # GET /agentprofiles
  # GET /agentprofiles.json
  #layout "admin"
  def index
    @agentprofiles = Agentprofile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @agentprofiles }
    end
  end

  def findbypost
    @agentprofiles= Agentprofile.findbypost(params[:post_id])
    #@agentprofiles = Agentprofile.all
    render json: @agentprofiles
  end

  # GET /agentprofiles/1
  # GET /agentprofiles/1.json
  def show
    @agentprofile = Agentprofile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agentprofile }
    end
  end

  # GET /agentprofiles/new
  # GET /agentprofiles/new.json
  def new
    @agentprofile = Agentprofile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @agentprofile }
    end
  end

  # GET /agentprofiles/1/edit
  def edit
    @agentprofile = Agentprofile.find(params[:id])
  end

  # POST /agentprofiles
  # POST /agentprofiles.json
  def create
    @agentprofile = Agentprofile.new(params[:agentprofile])

    respond_to do |format|
      if @agentprofile.save
        format.html { redirect_to @agentprofile, notice: 'Agentprofile was successfully created.' }
        format.json { render json: @agentprofile, status: :created, location: @agentprofile }
      else
        format.html { render action: "new" }
        format.json { render json: @agentprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /agentprofiles/1
  # PUT /agentprofiles/1.json
  def update
    @agentprofile = Agentprofile.find(params[:id])

    respond_to do |format|
      if @agentprofile.update_attributes(params[:agentprofile])
        format.html { redirect_to @agentprofile, notice: 'Agentprofile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @agentprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agentprofiles/1
  # DELETE /agentprofiles/1.json
  def destroy
    @agentprofile = Agentprofile.find(params[:id])
    @agentprofile.destroy

    respond_to do |format|
      format.html { redirect_to agentprofiles_url }
      format.json { head :no_content }
    end
  end
end
end
