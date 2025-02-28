class MessagesController < ApplicationController
  before_action :authenticate_user!, only: ["index", "destroy"]

  def index
    messages = Message.includes(:user, [likes: :user])
    messages_array = messages.map do |message|
      {
        id: message.id,
        user_id: message.user.id,
        name: message.user.name,
        content: message.content,
        email: message.user.email,
        created_at: message.created_at,
        likes: message.likes.map { |like| { id: like.id, email: like.user.email } }
      }
    end

    render json: messages_array, status: :ok
  end

  def destroy
    message = Message.find(params[:id])
    if (request.headers[:uid] == message.user.uid)
      if message.destroy
        render json: { id: message.id, email: message.user.email, message: 'メッセージの削除に成功しました' }, status: :ok
      else
        render json: { message: 'メッセージの削除に失敗しました', errors: message.errors.messages }, status: :bad_request
      end
    else 
      render json: { message: 'メッセージ作成者が違います' }, status: 401
    end
  end
end
