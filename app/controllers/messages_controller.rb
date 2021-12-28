class MessagesController < ApplicationController
  def index
    messages = Message.all
    messages_array = messages.map do |message|
      {
        id:         message.id,
        user_id:    message.user.id,
        name:       message.user.name,
        content:    message.content,
        email:      message.user.email,
        created_at: message.created_at
      }
    end
    # messages_arrayをHTTPレスポンスとして返す（成功 status:200）
    render json: messages_array, status:200
  end
end