class Bicycle < ActiveRecord::Base
  has_many :rentals, dependent: :destroy

  validates :name, presence: true
  validates :kind, inclusion: { in: ["A", "B", "C"],  message: 'has to be one of A, B, C' }

  def price
    case kind
    when 'A'
      100
    when 'B'
      75
    when 'C'
      50
    end
  end

  def total_income
    total = 0
    rentals.each { |r| total += r.sum_price }
    total
  end
end