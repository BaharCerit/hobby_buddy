class Match < ApplicationRecord
  belongs_to :first_user, class_name: 'User'
  belongs_to :second_user, class_name: 'User'
  has_one :chatroom

  def rejected!
    self.status = "rejected"
  end

  def rejected?
    self.status == "rejected"
  end

  def accepted!
    self.status = "accepted"
  end

  def accepted?
    self.status == "accepted"
  end
end
