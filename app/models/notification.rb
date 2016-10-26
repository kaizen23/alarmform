class EmailValidator < ActiveModel::EachValidator
#create email validator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Notification < ApplicationRecord
has_one :order
after_save :create_order_with_calculate_cost

#add validates
CATEGORY_TYPES = ["Awaria", "Uszkodzenie", "Usterka" ]
#dont be blank description email
	validates  :email, presence: true, email: true
	validates :description, presence: true, length: { minimum: 100 }
#Category must be included from the list
	validates :category,presence: true, inclusion: CATEGORY_TYPES
	
	
	
    private
    
		 def create_order_with_calculate_cost
		 		Order.create(
      	notification_id: self.id
        )
		   #  orderobject = Order.find(self.id)
		    # orderobject.notification_id = self.id # self is the fruit
		     #orderobject.save
		 end
end
