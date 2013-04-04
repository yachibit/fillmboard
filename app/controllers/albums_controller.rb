class AlbumsController < ApplicationController
  before_filter :set_album, :only => [:show, :edit, :update, :destroy]
  before_filter :require_album_member, :only => [:show, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.where("group_id = ?", params[:group_id])

    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @photo = @album.photos.new
    @photos = @album.photos.order('created_at DESC').page(params[:page]).per(6)
    respond_to do |format|
      format.js
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @group = Group.find(params[:group_id])
    @album = @group.albums.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(params[:album])

    respond_to do |format|
      if @album.save
        format.html { redirect_to group_url(@album.group), notice: 'Album was successfully created.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to album_url(@album), notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def require_album_member
    redirect_to root_url unless @album.group.users.find_by_id(current_user.id)
  end
end
