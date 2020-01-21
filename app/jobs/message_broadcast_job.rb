# -*- encoding : utf-8 -*-
class MessageBroadcastJob < ApplicationJob
  #入力とブロードキャストされたものはアラートされるだけで、保存がされない。
  #speakアクションを書き換えて、ブロードキャスト処理は非同期通信のためにjobに移動する
  #作成したテンプレートのmessages/_message.html.erbにmessageを渡して、
  #代入したものを再度messageに代入する。
  queue_as :default
  def perform(message)
      ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

    private
      def render_message(message)
        ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
      end
end
