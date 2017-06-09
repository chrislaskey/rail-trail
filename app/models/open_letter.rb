class OpenLetter < ApplicationRecord

  belongs_to :user

  has_paper_trail

  before_create :set_defaults

  validates :title,
            length: { maximum: 100 },
            presence: true

  validates :body,
            length: { maximum: 100_000 },
            presence: true

  validates :user,
            presence: true

  scope :active?, ->{ where(active: true) }

  private

  def set_defaults
    self.active = true
  end

end
