class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_date, :color, :name, :sex

  # validates :standard_color #, :on => :create

  COLORS = [
    :black,
    :orange,
    :red,
    :purple,
    :white
  ]

  def standard_color
    errors.add(:color, "is not valid") unless COLORS.include?(color)
  end

end
