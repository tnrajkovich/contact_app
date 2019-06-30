class Contact < ApplicationRecord
  def friendly_updated_at
    created_at.strftime("%B %e, %Y")
  end

  def full_name
    return first_name + " " + last_name
  end
end
