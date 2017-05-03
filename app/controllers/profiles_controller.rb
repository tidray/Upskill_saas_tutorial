class ProfilesController < ApplicationController
  # Get request to /users/:user_id/profile/new
  def new
  # Render blanck profile details form  
  @profile = Profile.new
  end
end
