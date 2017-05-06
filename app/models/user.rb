class User < ApplicationRecord

  devise :rememberable, :timeoutable, :trackable, :omniauthable, omniauth_providers: [:facebook]

  enum group: {
    abutter: 10,
    resident: 20,
    other: 30
  }

  validates :email, uniqueness: true

  def last_sign_in_ago
    last_sign_in_at ? time_ago_in_words(last_sign_in_at) + " ago" : "-"
  end

end
