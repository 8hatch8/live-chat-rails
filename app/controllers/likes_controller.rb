class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :delete]
  def create
    like = Like.new(user_id: current_user.id, message_id: params[:message_id])
    if like.save
      render json: {
        id:       like.id,
        email:    current_user.email,
        message:  "成功しました"
      }, status: 200
    else
      render json: {
        message:  "いいねできませんでした",
        errors:   like.errors.messages
      }, status: 400
    end
  end

end
