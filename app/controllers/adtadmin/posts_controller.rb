require_dependency "adtadmin/application_controller"

module Adtadmin
class PostsController < ApplicationController
  load_and_authorize_resource  :class=> Adtadmin::Post
  # GET /posts
  # GET /posts.json
  #layout "admin"
  def index
    if request.post?
      category_id= params[:category_id]
      region_id= params[:region_id]
      isactive= params[:isactive]
      ontop= params[:ontop]

      session[:category_id] = category_id
      session[:region_id] = region_id
      session[:isactive] = isactive
      session[:ontop] = ontop
#      if category_id==""  #Сбрасываем фильтр категорий
#       session[:category_id]= 0
#      end
    end

  
    #@posts = Post.paginate(:page => params[:page], :per_page => 20).order('id DESC').all
    @posts = Post.postisdelete
    if session[:ontop]
      @posts = @posts.postontop 
    else
      @posts = @posts.postonnottop 
    end

    if session[:isactive]
      @posts = @posts.postisactive 
    else 
      @posts = @posts.postisunactive 
    end

    @posts = @posts.postregion(session[:region_id]) if !session[:region_id].blank?
    @posts = @posts.postcategory(session[:category_id]) if !session[:category_id].blank?


    @posts = Post.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @agentprofiles= Agentprofile.findbypost(@post.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
   # @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
end
