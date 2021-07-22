class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def format_limit
    format("R$ %.2f",self.limit)
  end

  def format_value
    format("R$ %.2f",self.value)
  end
end
