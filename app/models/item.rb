class Item < ActiveRecord::Base
  
  belongs_to :user
    
  validates :name, length: { minimum: 4 },presence: true  
end
