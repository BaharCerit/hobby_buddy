class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :match

  def other(current_user)
    if self.match.first_user == current_user
      match.second_user
    else
      match.first_user
    end
  end
end
