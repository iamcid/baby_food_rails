class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_baby_foods, through: :reviews, source: :baby_food

    has_many :baby_foods

    validates :username, uniqueness: true, presence: true
    # validates :baby_name, presence: true

    has_secure_password

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.password = SecureRandom.hex(16)
        end
    end
    
end
