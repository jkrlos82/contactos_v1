class Contact < ApplicationRecord
    belongs_to :user
    validates :name, :dob, :telephone, :address, :card_number, :email, presence: true
end
