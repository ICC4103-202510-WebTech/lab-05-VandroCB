class Chat < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :messages, dependent: :destroy

  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validate :sender_and_receiver_must_be_different

  private

  def sender_and_receiver_must_be_different
    if sender_id == receiver_id
      errors.add(:receiver_id, "can't be the same as sender")
    end
  end
end
