class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Notification < ApplicationRecord
#add validates
CATEGORY_TYPES = ["Awaria", "Uszkodzenie", "Usterka" ]
#dont be blank description email
	validates  :email, presence: true, email: true
	validates :description, presence: true, length: { minimum: 100 }
#Category must be included from the list
	validates :category, inclusion: CATEGORY_TYPES
end
