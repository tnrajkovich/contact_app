class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def friendly_updated_at
    created_at.strftime("%B %e, %Y")
  end

  def full_name
    return first_name + " " + last_name
  end
end
