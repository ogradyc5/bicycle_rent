class Bicycle < ActiveRecord::Base
  #belongs_to :user
  include AASM
  has_many :users, through: :user_bicycles
  has_many :user_bicycles
  #delegate :user, :allow_nil => true
  #def self.new_from_lookup(bicycle)
   # lookup = params[:lookup]
    #@bicycles = Bicycle.find_by_lookup(lookup)
    #new(name: lookup.name, make: lookup.make, rent_print: lookup.rent_price)
  #end 
  def self.find_by_name(name)
   where(name: name).first
  end 
 
  #validates :name, presence: true, length: { minimum: 5 }
  
  def self.new_from_lookup(name)
   # looked_up_bicycle = Bicycle.where('make LIKE ?', make)
   begin
    looked_up_bicycle = Bicycle.find_by_name(name)
    #looked_up_bicycle = Bicycle.select(:id, :name, :make, :rent_price).where('make LIKE ?', make)
    #price = strip_commas(looked_up_bicycle.pluck(:rent_price))
    #price = rent_price.gsub(/,/, '').to_f
    #new(name: looked_up_bicycle.pluck(:name).join(", "), make: looked_up_bicycle.pluck(:make).join(", "), rent_price: looked_up_bicycle.pluck(:rent_price))
    new(id: looked_up_bicycle[:id], name: looked_up_bicycle[:name], make: looked_up_bicycle[:make], rent_price: looked_up_bicycle[:rent_price], created_at: looked_up_bicycle[:created_at], updated_at: looked_up_bicycle[:updated_at])
   rescue Exception => e
    return nil
   end 
  end
   #else
    #Bicycle.alltruncate(2).to_s('F')
  
  
 #def self.strip_commas(number)
   #number.gsub(",", "")
   #number.to_s.to_f.round(2)
 #end
end
