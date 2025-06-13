class Chat < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :messages, dependent: :destroy

  scope :for_user, ->(user) { where("sender_id = ? OR receiver_id = ?", user.id, user.id) }
  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validate :sender_and_receiver_must_be_different
  validate :no_duplicate_chats

  def self.find_between(user1, user2)
    where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)",
          user1.id, user2.id, user2.id, user1.id).first
  end

  private

  def sender_and_receiver_must_be_different
    if sender_id == receiver_id
      errors.add(:receiver_id, "can't be the same as sender")
    end
  end

  def no_duplicate_chats
    existing_chat = Chat.find_between(sender, receiver)
    if existing_chat && existing_chat.id != id
      errors.add(:base, "Chat already exists with this user")
    end
  end
end
