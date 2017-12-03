class Rental < ActiveRecord::Base
  belongs_to :bicycle
  belongs_to :user

  validates :starts_on, presence: true
  validates :ends_on, presence: true
  validate :cannot_start_in_the_past
  validate :cannot_end_in_the_past
  validate :cannot_end_before_it_starts
  validates :starts_on, :ends_on, overlap: { scope: 'bicycle_id', message_title: 'This bicycle', message_content: "is not available during this time" }

  def cannot_start_in_the_past
    if starts_on < Date.today
      errors.add(:starts_on, "can't be in the past")
    end
  end

  def cannot_end_in_the_past
    if ends_on < Date.today
      errors.add(:ends_on, "can't be in the past")
    end
  end

  def cannot_end_before_it_starts
    if ends_on < starts_on
      errors.add(:base, "Rental can't end before it's started")
    end
  end

  def days
    (ends_on - starts_on).to_i + 1
  end

  def sum_price
    days * bicycle.price
  end
end