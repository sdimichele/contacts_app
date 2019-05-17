class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A\w+[@]\w{3,}[.]\w{2,}\z/, message: "must be a valid email" }

  belongs_to :user

   def friendly_updated_at
    updated_at.strftime("%b %d, %Y")
  end

  def full_name
    "#{first_name} #{middle_Name} #{last_name}"

  end



end

