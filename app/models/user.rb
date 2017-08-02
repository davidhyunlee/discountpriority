class User < ApplicationRecord
  enum role: [:customer, :admin]
  after_initialize :set_default_role, if :new_record?

  # using bcrypt
  has_secure_password

  def set_default_role
    # if it already exists it's self.role, if it doesn't exist, it's user.
    self.role ||= :customer
  end
end
