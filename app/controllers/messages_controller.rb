class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    messages = Message.includes(:user, [likes: :user])
    messages_array = messages.map do |message|
      {
        id:         message.id,
        user_id:    message.user.id,
        name:       message.user.name,
        content:    message.content,
        email:      message.user.email,
        created_at: message.created_at,
        likes:      message.likes.map {
          |like| {
            id:     like.id,
            email:  like.user.email
          }
        }
      }
    end
    # messages_arrayをHTTPレスポンスとして返す（成功 status:200）
    render json: messages_array, status: :ok
  end
end
