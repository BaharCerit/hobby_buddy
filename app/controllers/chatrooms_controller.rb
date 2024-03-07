class ChatroomsController < ApplicationController

  def index
    # @chatrooms = Chatroom.joins(match: [:first_user_id, :second_user_id])
    #     .where(matches: { status: true, first_user_id: current_user })
    #     .or(Chatroom.joins(match: [:first_user_id, :second_user_id])
    #                  .where(matches: { status: true, second_user_id: current_user }))
    # @chatrooms = Chatroom.all
    @chatrooms = current_user.matches.map(&:chatroom)


    # @chatrooms = Chatroom.joins(match: [:first_user, :second_user])
    #                  .where(matches: { status: true, first_user: current_user })
    #                  .or(Chatroom.joins(match: [:first_user, :second_user])
    #                               .where(matches: { status: true, second_user: current_user }))

  end

  def show
    @chatroom = Chatroom.find(params[:id])
      # @chatroom = Chatroom.joins(match: [:first_user, :second_user])
      #     .where(matches: { status: true, first_user_id: current_user })
      #     .or(Chatroom.joins(match: [:first_user, :second_user])
      #                  .where(matches: { status: true, second_user_id: current_user }))
    @message = Message.new
    # @chatroom = Chatroom.find(params[:id])
    # @messages = @chatroom.messages
  end
end
