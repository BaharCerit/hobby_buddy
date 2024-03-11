class ChatroomsController < ApplicationController

  def index
    # @chatrooms = Chatroom.all

    @chatrooms = current_user.matches.where(status: "accepted").map(&:chatroom)
    # @chatrooms = Chatroom.joins(match: [:first_user_id, :second_user_id])
                    #  .where(matches: { status: true, first_user_id: current_user })
                    #  .or(Chatroom.joins(match: [:first_user, :second_user])
                    #               .where(matches: { status: true, second_user: current_user }))

  end

  # def show
  #   @chatroom = Chatroom.find(params[:id])
  #   @message = Message.new
  #   # @chatroom = Chatroom.find(params[:id])
  #   # @messages = @chatroom.messages
  # end

  def show
    @chatroom = Chatroom.find_by(id: params[:id])
    if @chatroom.nil?
      redirect_to root_path, alert: "Chatroom not found."
    else
      @message = Message.new
    end
  end
end
