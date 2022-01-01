class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :delete]
  def create
    like = Like.new(user_id: current_user.id, message_id: params[:message_id])
    if like.save
      render json: {
        id:       like.id,
        email:    current_user.email,
        message:  "いいねしました"
      }, status: :ok
    else
      render json: {
        message:  "いいねできませんでした",
        errors:   like.errors.messages
      }, status: :bad_request
    end
  end

  def destroy
    like = Like.find(params[:id])
    if like.delete
      render json: {
        id:       like.id,
        email:    like.user.email,
        message:  "削除しました"
      }, status: :ok
    else
      render json: {
        message:  "削除できませんでした",
        errors:   like.errors.messages
      }, status: :bad_request
    end
  end

end
