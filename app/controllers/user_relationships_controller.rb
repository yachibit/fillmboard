class UserRelationshipsController < ApplicationController

=begin
  def new
    @user_relationship = UserRelationship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_relationship }
    end
  end
=end
  def create
    @user_relationship = UserRelationship.new(params[:user_relationship])
    @user_relationship.save
    
    respond_to do |format|
      format.html { redirect_to group_url(@user_relationship.group_id) }
      format.js
      format.json { render json: @user_relationship }
    end
  end

end