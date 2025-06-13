# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.admin?
      # Admin can manage all
      can :manage, :all
    else
      # Regular users can only read their own user profile
      can :read, User, id: user.id

      # Users can manage their own chats
      can :manage, Chat do |chat|
        chat.sender_id == user.id || chat.receiver_id == user.id
      end

      # Users can create new chats
      can :create, Chat

      # Users can manage their own messages
      can :manage, Message, user_id: user.id

      # Users can read messages in chats they're part of
      can :read, Message do |message|
        chat = message.chat
        chat.sender_id == user.id || chat.receiver_id == user.id
      end
    end
  end

  # Define abilities for the user here. For example:
  #
  #   return unless user.present?
  #   can :read, :all
  #   return unless user.admin?
  #   can :manage, :all
  #
  # The first argument to `can` is the action you are giving the user
  # permission to do.
  # If you pass :manage it will apply to every action. Other common actions
  # here are :read, :create, :update and :destroy.
  #
  # The second argument is the resource the user can perform the action on.
  # If you pass :all it will apply to every resource. Otherwise pass a Ruby
  # class of the resource.
  #
  # The third argument is an optional hash of conditions to further filter the
  # objects.
  # For example, here the user can only update published articles.
  #
  #   can :update, Article, published: true
  #
  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
end
