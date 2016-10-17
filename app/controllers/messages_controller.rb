class MessagesController < ApplicationController
  before_action :user_logged_in, only: [:show, :create]

  def show
    @messages = Message.all
    @message = Message.new
  end

  def create
    Message.create!(user_id: current_user.id,
                    priority: :info,
                    message: params[:message][:message])
    redirect_to chat_path
  end

  private
    def user_logged_in
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  
end
