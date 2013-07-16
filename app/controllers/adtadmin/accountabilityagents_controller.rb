require_dependency "adtadmin/application_controller"

module Adtadmin
  class AccountabilityagentsController < ApplicationController
    load_and_authorize_resource  :class=> Adtadmin::Accountabilityagent
   # load_and_authorize_resource
  # GET /accountabilityagents
  # GET /accountabilityagents.json
  #layout "admin"
  def index
    @accountabilityagents = Accountabilityagent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accountabilityagents }
    end
  end

  # GET /accountabilityagents/1
  # GET /accountabilityagents/1.json
  def show
    @accountabilityagent = Accountabilityagent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accountabilityagent }
    end
  end

  # GET /accountabilityagents/new
  # GET /accountabilityagents/new.json
  def new
    @accountabilityagent = Accountabilityagent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accountabilityagent }
    end
  end

  # GET /accountabilityagents/1/edit
  def edit
    @accountabilityagent = Accountabilityagent.find(params[:id])
  end

  # POST /accountabilityagents
  # POST /accountabilityagents.json
  def create
    @accountabilityagent = Accountabilityagent.new(params[:accountabilityagent])

    respond_to do |format|
      if @accountabilityagent.save
        format.html { redirect_to @accountabilityagent, notice: 'Accountabilityagent was successfully created.' }
        format.json { render json: @accountabilityagent, status: :created, location: @accountabilityagent }
      else
        format.html { render action: "new" }
        format.json { render json: @accountabilityagent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accountabilityagents/1
  # PUT /accountabilityagents/1.json
  def update
    @accountabilityagent = Accountabilityagent.find(params[:id])

    respond_to do |format|
      if @accountabilityagent.update_attributes(params[:accountabilityagent])
        format.html { redirect_to @accountabilityagent, notice: 'Accountabilityagent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @accountabilityagent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accountabilityagents/1
  # DELETE /accountabilityagents/1.json
  def destroy
    @accountabilityagent = Accountabilityagent.find(params[:id])
    @accountabilityagent.destroy

    respond_to do |format|
      format.html { redirect_to accountabilityagents_url }
      format.json { head :no_content }
    end
  end
end
end
