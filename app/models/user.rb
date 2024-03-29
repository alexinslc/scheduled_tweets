# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
    has_many :twitter_accounts
    has_many :tweets
    has_secure_password 
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be valid: john@example.com" }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
end
