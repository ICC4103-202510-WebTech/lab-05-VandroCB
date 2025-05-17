class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user, counter_cache: true

  validates :body, presence: true
end
