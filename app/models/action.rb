class Action < ApplicationRecord
  belongs_to :sport
  belongs_to :user
  belongs_to :employee
end
