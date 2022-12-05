class RelationshipsController < ApplicationController
  # フォロー
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end
  # リムーブ
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
  # フォローの一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワーの一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end