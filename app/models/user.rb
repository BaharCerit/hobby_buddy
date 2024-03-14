class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :first_user_matches, class_name: 'Match', foreign_key: 'first_user_id', dependent: :destroy
  has_many :second_user_matches, class_name: 'Match', foreign_key: 'second_user_id', dependent: :destroy
  has_one_attached :photo

  has_many :user_interests, dependent: :destroy
  has_many :interests, through: :user_interests, dependent: :destroy
  # has_many :matches
  # has_many :chatrooms, through: :matches
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 30, maximum: 500 }
  validates :address, presence: true

  def has_interest?(interest)
    self.interests.include?(interest)
  end

  def matches
    Match.where("first_user_id = ? OR second_user_id = ?", self.id, self.id)
  end

  def matched?(other)
    for match in self.matches do
      if match.first_user_id == other.id || match.second_user_id == other_id
        return true
      end
    end

    return false
  end
end
