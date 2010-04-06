class Weakness < ActiveRecord::Base
  set_table_name :choices
  has_and_belongs_to_many :choices
end
