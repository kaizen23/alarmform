class Notification < ApplicationRecord
#add validates
CATEGORY_TYPES = ["Awaria", "Uszkodzenie", "Usterka" ]
#dont be blank description email
	validates  :email, presence: true
	validates_length_of :description, :minimum  => 100, :message => "Opis musi miec przynajmniej 100 znakow"
#Category must be included from the list
	validates :category, inclusion: CATEGORY_TYPES
end
