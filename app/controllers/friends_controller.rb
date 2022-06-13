class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = current_user.friends
  end  

  def destroy
    @friendship = Friendship.search(current_user.id, params[:id])
    @friendship.destroy
    redirect_to friends_path
  end
end