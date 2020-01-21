# -*- encoding : utf-8 -*-
class RoomChannel < ApplicationCable::Channel
  #ActionCableを使用するためのチャンネル
  #このチャンネルはspeakアクションのためのチャンネル
  #サーバーサイドのspeakアクション
  #ここはコントローラーのの役割を担っている
  #クライアントサイドのspeakアクションから渡されたパラメーターをdataとして受け取り、room_channelにmessageをブロードキャストする。
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(message)
    #ActionCable.server.broadcast 'room_channel', message: data['message']
   post = Post.new(message: message['message'][0], user_id: message['message'][1].to_i, room_id: message['message'][2].to_i)
   post.save
   ActionCable.server.broadcast 'room_channel', message: message['message'][0] # フロントへ返します
   #ここでメッセージを受け取り、createアクションと同じでpostモデルに保存する
  end
end
