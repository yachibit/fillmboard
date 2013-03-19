class HomeController < ApplicationController

  skip_before_filter :require_signin, :only => [:index]
  before_filter :check_signin
  
  def index
  end

  private
  
  def check_signin
    redirect_to user_groups_path(current_user.id) if current_user
  end
end
