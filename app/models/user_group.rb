class UserGroup < ApplicationRecord

  belongs_to :user

  enum group: {
    abutter: 10,
    resident: 20,
    other: 30
  }

end
