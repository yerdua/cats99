class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_date, :color, :name, :sex
  has_many :cat_rental_requests, :dependent => :destroy
  validates_presence_of :name
  validate :standard_color #, :on => :create

  COLORS = [
    :black,
    :orange,
    :red,
    :purple,
    :white
  ]

  def standard_color
    errors.add(:color, "is not valid") unless COLORS.include?(color.to_sym)
  end

  def approved_rentals
    self.cat_rental_requests.select{|request| request.status == 'approved'}
  end

end
