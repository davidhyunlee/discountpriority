class User < ApplicationRecord
  enum role: [:customer, :admin]
  after_initialize :set_default_role, :if => :new_record?

  validates :first_name, :last_name, :presence => true

  # using bcrypt
  has_secure_password

  def set_default_role
    # if it already exists it's self.role, if it doesn't exist, it's user.
    self.role ||= :customer
    self.activated ||= false
  end

  def full_name_lf
    fullname = ""
    fullname << "#{self.last_name.titleize}," if self.last_name
    fullname << " #{self.first_name.titleize}" if self.first_name
    return fullname
  end
end
