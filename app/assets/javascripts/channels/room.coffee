App.room = App.cable.subscriptions.create "RoomChannel",
#クライアントサイドのspeakアクションを定義して,
#そのアクションでサーバーサイドのspeakアクションを呼び、
#メッセージをmessageというパラメーターとして渡す。
#ここはchannnelにviewからのデータを渡すための中間の役割
#そしてchannelからのデータをviewに返すための中間の役割

  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # サーバーサイドから値を受け取る
      $('#posts').append("<p>"+data["message"]+"</p>"); # 投稿を追加
      #ここはデータを受け取り、viewに渡すjavaScriptのコード

  speak: (message) ->
    @perform 'speak', message: message　#サーバーサイドのspeakアクションにmessageパラメータを渡す

jQuery(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return キーのキーコードが13
    App.room.speak [event.target.value, $('[data-user]').attr('data-user'), $('[data-room]').attr('data-room')]
    event.target.value = ''
    event.preventDefault()