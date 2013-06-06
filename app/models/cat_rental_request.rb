class CatRentalRequest < ActiveRecord::Base
  attr_accessible :begin_date, :cat_id, :end_date, :status
  belongs_to :cat
  validates_presence_of :begin_date, :cat_id, :end_date
  validate :dates_are_not_claimed

  def dates_are_not_claimed
    cat.approved_rentals.each do |rental|
      errors.add(:date_range, "conflicting dates") if conflict?(rental)
    end
  end

  def approve!
    self.status = 'approved'
    self.save
    deny_conflicting_requests
  end

  def deny!
    self.status = 'denied'
    self.save
  end

  def deny_conflicting_requests
    cat.cat_rental_requests.each do |request|
      request.deny! if conflict?(request)
    end
  end

  def conflict?(other_request)
    !(other_request.date_array & date_array).empty?
  end

  def date_array
    (begin_date..end_date).to_a
  end
end
