class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :user_bicycles
  has_many :bicycles, through: :user_bicycles
 
  def bicycle_already_added?(name)
    bicycle = Bicycle.find_by_name(name)
    return false unless bicycle
    user_bicycles.where(bicycle_id: bicycle.id).exists?
  end 
  
  def under_bicycle_limit?
    (user_bicycles.count < 3)
  end 
  
  def can_add_bicycle?(name)
    under_bicycle_limit? && !bicycle_already_added?(name)
  end 
end
