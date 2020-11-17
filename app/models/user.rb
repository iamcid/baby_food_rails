class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_baby_foods, through: :reviews, source: :baby_food

    has_many :baby_foods

    validates :username, uniqueness: true, presence: true
    validates :baby_name, presence: true

    has_secure_password

    def self.create_from_omniauth(auth)
        user = User.find_by(email: auth[:info][:email]) do |u|
            u.username = auth[:info][:username]
            u.password = SecureRandom.hex(17)
        end
    end
    
end
