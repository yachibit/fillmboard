class GroupsController < ApplicationController
  before_filter :set_group, :only => [:show, :edit, :update, :destroy]
  before_filter :require_group_member, :only => [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = current_user.groups.order('created_at DESC').page(params[:page]).per(4)
    @photos = Photo.joins(:album => {:group => :users} ).where(:users => {:id => current_user.id }).order('created_at DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    Group.transaction do
      @group = Group.new(params[:group])
      @group.save!
      @group.user_relationships.create!(:user_id => current_user.id)
    end
    redirect_to user_groups_url(current_user.id)
    rescue
    render :action => "new"
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to user_groups_url(current_user.id)}
      format.json { head :no_content }
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def require_group_member
    redirect_to root_url unless @group.users.find_by_id(current_user.id)
  end
end