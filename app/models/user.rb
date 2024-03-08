class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :first_user_matches, class_name: 'Match', foreign_key: 'first_user_id'
  has_many :second_user_matches, class_name: 'Match', foreign_key: 'second_user_id'

  has_many :user_interests
  has_many :interests, through: :user_interests, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum:30, maximum: 500}
  validates :address, presence: true

  def has_interest?(interest)
    self.interests.include?(interest)
  end
end
