class User < ApplicationRecord
    has_secure_password

    has_many :friend_as, foreign_key: :friend_a_id, class_name: 'Friendship', dependent: :destroy
    has_many :initiated_friends, through: :friend_as, source: 'friend_b'

    has_many :friend_bs, foreign_key: :friend_b_id, class_name: 'Friendship', dependent: :destroy
    has_many :requested_friendship, through: :friend_bs, source: 'friend_a'
end
