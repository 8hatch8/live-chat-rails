class RoomChannel < ApplicationCable::Channel
  # 接続時
  def subscribed
    stream_from "room_channel"
  end

  # 切断時
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # データ受信時
  def receive(data)
    # Vueからdataを受け取るため、data[:email]ではなく、data['email']となる
    user = User.find_by(email: data['email'])
    
    if message = Message.create(content: data['message'], user_id: user.id)
      # ActionCable~: チャネルに接続するすべてのブラウザにデータを送信
      ActionCable.server.broadcast "room_channel", {
        message:    data['message'],
        name:       user.name,
        created_at: message.created_at
      }
    end
  end
end
