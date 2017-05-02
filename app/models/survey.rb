class Survey < ApplicationRecord

  has_many :questions

  def to_s
    slug
  end

end
