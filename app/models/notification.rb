class EmailValidator < ActiveModel::EachValidator
#create email validator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Notification < ApplicationRecord
#one notification has one order
has_one :order
#after save create order with cost and time to realization order
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
			#function check_time check between witch hours customer save request
			def check_time
				if Notification.where("(TIME(created_at) NOT BETWEEN '09:00:00' AND '18:00:00') AND id = ?", self.id ).exists?
					return true
				end
			end
			case category # a_variable is the variable we want to compare
			when "Awaria"
			#checking depending on and save orders to database
			if check_time
				Order.create(
					notification_id: self.id,
					#if time notifications is between '17:00:00' AND '09:00:00 cost is 100
					cost: 100,
					#time to realization alarm is four hours
					lastdate: (self.created_at + 14400)
					)
			else
				Order.create(
					notification_id: self.id,
					#if time notifications is between '09:00:00' AND '17:00:00 cost is 50
					cost: 50,
					lastdate: (self.created_at + 14400)
					)
			end
			when "Uszkodzenie"
			Order.create(
					notification_id: self.id,
					#if time notifications is between '17:00:00' AND '09:00:00 cost is 100
					cost: 10,
					#time to realization alarm is four hours
					lastdate: (1.business_days.after(self.created_at))
					)
			when "Usterka"
			Order.create(
					notification_id: self.id,
					#if time notifications is between '17:00:00' AND '09:00:00 cost is 100
					cost: 1,
					#time to realization alarm is four hours
					lastdate: (3.business_days.after(self.created_at))
					)
			end
		end
		
		
end

