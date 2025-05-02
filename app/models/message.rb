class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :body, presence: true
end
